# Single-Graph Production Lock Spec · Inventory Sprint Day 4 of 4

**Owner:** Chitraksh
**Status:** spec drafted Apr 24 morning · merge target end of Apr 25
**Tag on merge:** `prod-2026-04-25`

---

## Sprint context

Inventory sprint Apr 22 → Apr 25:
- Day 1: v3 synonym map deploy + sync verdict (`inventory-query-rebuild-plan-v3.md`)
- Day 2: cold-transfer guardrail (`cold-transfer-guardrail-plan-v1.md`) + 21-case retest pack (`logs/apr23-retest-pack.md`)
- Day 3: proactive "3 close alternatives" flow (carryover if not landed)
- **Day 4 (today / tomorrow): single-graph production lock** — collapse everything into one Retell agent + one n8n flow + one Supabase verdict path, tagged `prod-2026-04-25`

---

## What "single graph" means (and what it deletes)

Today there are multiple parallel flows in n8n and multiple draft Retell agent configs. That is fine for a sprint; it is a liability for the moment a real prospect call lands. After the lock:

- **One Retell agent** (the Mercedes inventory + qualifier hybrid). All other Mercedes-flavored draft agents go into a `_archive` workspace.
- **One n8n flow** for inventory query (`Mercedes_Inventory_Query_v3_PROD`). All v1, v2, and experimental forks renamed `_archive_<date>`.
- **One Supabase verdict path** (`vehicles` query → matcher → response). The cold-transfer guardrail writes to a single new table `call_transfer_log`. No duplicate logging tables.

---

## Components included in the lock

1. **v3 synonym map** (`scripts/family-map.json` — 12 families, 72 trims) wired into the Retell agent's inventory node prompt as a normalization preprocessor. Hard requirement: the matcher reads the same JSON the test harness reads.
2. **Cold-transfer guardrail** (`call_transfer_log` Supabase table + n8n retry backoff 2s / 5s / 12s + terminate-on-busy). Hard requirement: guardrail fires before any SIP-invite chain attempt 3.
3. **21-case retest pack** (7 synonym + 3 utterance-noise + 1 empty-path + 10 VIN). Hard requirement: 21/21 pass on a fresh production run before the merge.
4. **Proactive "3 close alternatives"** if Day 3 landed. If not: stub the response branch with a polite "I do not have an exact match, can I take your contact and have someone follow up?" and ship. Do not block the lock on a missing optional flow.
5. **Logging discipline:** every call writes to `call_log`, every transfer attempt writes to `call_transfer_log`, every successful appointment writes to `Appointment Log`. No `console.log` in production code paths. No string-concat SQL.

---

## Merge gates (all must pass)

| Gate | How to verify | Owner |
|---|---|---|
| 21/21 retest pass | Run `scripts/inventory-matcher.test.js` against the v3 PROD flow output | Chitraksh |
| 5/5 cold transfers without silent drop | Live phone test, 5 consecutive transfers to Frankie's cell | Chitraksh + Frankie |
| Empty-path branch responds gracefully | Query for an unstocked trim ("EQS 580 4MATIC AMG Line Plus") returns the no-match response, not an exception | Chitraksh |
| Latency p50 ≤ 4s, p95 ≤ 8s | Pull last 50 calls from Retell logs, compute | Chitraksh |
| n8n credential audit | Confirm `t68H7KhMcrrNgUPs` (Supabase), `1EASaEHAoK3fG6X1` (Gmail), `PcO0YC16KIquuS6x` (Twilio), `2BaP72YO9q5pyBGt` (Calendar) are all live and not rotated | Chitraksh |
| Dashboard updated | Mark inventory-fix progress bar 100 percent and v3 deploy `LIVE` | CTO-Claude |

---

## Tagging + rollback

On successful merge:
```
git tag -a prod-2026-04-25 -m "Single-graph production lock · v3 synonym + cold-transfer guardrail + 21-case retest"
git push origin prod-2026-04-25
```

In Retell + n8n: name the production agent and flow with the tag suffix `_v3_PROD_2026-04-25`.

**Rollback recipe** (if a production call fails post-lock):
1. In Retell, switch the agent override back to the previous build (it is preserved as `_v2_2026-04-15`).
2. In n8n, deactivate `Mercedes_Inventory_Query_v3_PROD` and re-activate `Mercedes_Inventory_Query_v2_2026-04-15`.
3. Page Chitraksh + Frankie.
4. Open a hot-fix branch off `prod-2026-04-25`, ship the fix, re-run the 21-case retest, re-tag `prod-2026-04-25.1`.

---

## What this unblocks

- Any MBSB pilot reply can route through the locked stack with confidence.
- The Tuesday email next batch (when re-sent in May or whenever the channel makes sense again) hits a stable stack.
- George's quote conversation can reference a working production agent (proof-of-life for the broader product).
- The paid-ads funnel (P2 + P1) can route inbound qualifier calls through the same locked stack without a parallel dev branch.

---

## Out of scope (do not merge today)

- Inventory pricing field (still pending data backfill from MBSB feed)
- Inbound IVR replacement (separate feature, Standard tier)
- White-label voice ID swap (Enterprise tier, separate feature)
- Custom CRM webhook routing (Enterprise tier, separate feature)
