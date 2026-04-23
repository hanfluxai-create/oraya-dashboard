# Cold-Transfer Guardrail Plan v1 · Apr 23

**Owner:** Chitraksh (CTO) · paste-ready for Sprint Day 2 of 4
**Origin:** Mtg 19 finding — SIP invite drops between attempt 2 and 3. Silent fail, no speak-back. Blocking single-graph production lock (T1.4) scheduled Apr 25.
**Pass bar:** 5 consecutive real phone transfers, all answered or cleanly terminated, with a populated `call_transfer_log` row per attempt.

---

## 1. Failure mode (what Mtg 19 observed)

- Retell transfer node fires SIP invite to forwarded-number destination.
- If destination does not pick up within Retell's default ringing window (18s), Retell marks attempt as `failed_no_answer` and exits the node.
- Flow is supposed to retry twice (3-attempt chain set Mtg 17). Attempt 2 either:
  - fires but the SIP leg hangs in INVITE → hangs the whole call, or
  - does not fire because the retry branch never executes (no terminate-on-busy handling on busy + SIT tones)
- Net effect: caller hears dead air after attempt 2, drops.

---

## 2. Retell transfer-node config (paste into the node)

```
Transfer destination   : {{dealer_transfer_number}}         # pulled from n8n payload
Ring timeout           : 20 seconds                          # was default (18), bump 2s to beat carrier race
Speak before transfer  : "Connecting you now. One moment."   # breaks dead-air illusion
Post-transfer tool     : log_transfer_attempt (n8n webhook)  # fires on every attempt, success or fail
End-call conditions    :
  - destination_busy  → go to retry_node
  - destination_no_answer → go to retry_node
  - destination_unreachable → speak "I'm having trouble reaching the line. Let me take a message and have Chris call you back." + fallback_node
  - connected → end_transfer_node
```

Retry node is the same transfer node re-entered with `attempt_counter` incremented via n8n. Retell does not natively loop nodes, so retry logic lives in n8n (see §3).

---

## 3. n8n retry backoff wiring

```
Trigger: Retell post-call webhook with event = transfer_failed
Attempt counter key: $json.body.call.call_analysis.custom_analysis_data.transfer_attempt
Branch logic:
  attempt_counter == 1 → wait 2 seconds  → fire Retell outbound call with same context + attempt_counter=2
  attempt_counter == 2 → wait 5 seconds  → fire Retell outbound call with same context + attempt_counter=3
  attempt_counter == 3 → wait 12 seconds → send SMS to caller_number ("We missed you. Chris will call you back today.") + end
```

Rationale: 2/5/12 spread covers (a) transient network drops, (b) destination-agent-in-a-different-call, (c) human-away-from-desk. Past 3, we stop burning caller patience and take the message.

---

## 4. Terminate-on-busy + SIT-tone handling

SIT tones (Special Information Tones) signal hard-unreachable. Retell's SIP stack surfaces these as `destination_unreachable` but only if `sit_tone_detect` is enabled in the transfer node:

```
sit_tone_detect : true
busy_tone_detect: true
```

Both default to false. Flip both.

When either fires: skip retry entirely, go straight to fallback_node (message-take). No point retrying a disconnected line.

---

## 5. Supabase `call_transfer_log` schema

```sql
create table call_transfer_log (
  id              uuid default gen_random_uuid() primary key,
  call_id         text not null,
  attempt         int  not null,
  destination     text not null,
  outcome         text not null,  -- connected | no_answer | busy | unreachable | timeout
  sip_code        int,            -- 200, 486, 408, 503 etc.
  duration_ms     int,
  created_at      timestamptz default now()
);

-- Index for same-call lookups
create index on call_transfer_log (call_id);
```

n8n `log_transfer_attempt` webhook inserts one row per attempt. Outcome column keys directly off Retell's post-call event payload.

---

## 6. 5-call live pass-bar checklist

Run from the n8n UI's `trigger-test-transfer` workflow or by hand-dialing. Expected outcomes:

| # | Scenario | Expected | Pass criterion |
|---|----------|----------|----------------|
| 1 | Destination answers immediately | connected | 1 log row, outcome=connected |
| 2 | Destination rings-out (no answer) | 3 attempts then fallback | 3 log rows, final outcome=timeout, SMS sent |
| 3 | Destination busy (line occupied) | No retry, straight to fallback | 1 log row, outcome=busy, SMS sent |
| 4 | Destination unreachable (SIT tone) | No retry, straight to fallback | 1 log row, outcome=unreachable, SMS sent |
| 5 | Destination answers on attempt 2 | Retry fires, connects | 2 log rows, final outcome=connected |

Pass bar = 5/5. Any fail blocks single-graph lock T1.4.

---

## 7. Rollout order

1. Supabase table: create now (cheap, irreversible? drop + recreate if schema changes).
2. n8n retry workflow: clone current transfer handler to `transfer-handler-v2`, wire backoff, leave v1 live.
3. Retell node: duplicate Jessica agent to `Jessica-v4-transfer-hardened`, apply §2 config, switch single test phone number to v4.
4. Run §6 against v4 only. If 5/5, cut prod traffic from Jessica-v3 to v4, retire v3.

Estimated wall time: 90 minutes if the n8n retry clone is straightforward, 3 hours if the Retell SIT-tone flags need Retell support ticket.

---

## 8. Risk if this slips to Apr 24

- Single-graph production lock (T1.4) slips from Apr 25 to Apr 26-27.
- Any Tuesday email yes-pilot reply from Apr 23 EOD forward hits a transfer path that still drops silently — visible defect on the live demo.
- If slip compounds past Apr 28, Mazzio dormancy recast collides with Teresa recast and we lose two parallel anchors in the same week.

Do not ship without the 5/5 pass bar, even if retest pack greens.
