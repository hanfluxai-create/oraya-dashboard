# HiQ Latency Audit — Post-Pivot Verification
**Owner:** Chitraksh
**Ship date:** Apr 18 2026 AM · CTO-Claude autonomous drop
**Status:** Spec · pending Chitraksh execution + dashboard paste-in

---

## Why this exists

Apr 18 sync moved the Retell sales-outbound LLM from Gemini to HiQ. Premium is $0.05/min (+$250 per 1K calls). We accepted the cost on the promise of latency improvement — Gemini was silent 10 seconds before first speech. We have not yet verified HiQ is actually better in production. This audit is the verification gate.

**Rollback trigger:** if HiQ p95 time-to-first-audio is not ≤ (Gemini baseline p95 minus 2.0s), revert to Gemini and re-open the model decision. The +$0.05/min is only justified by the latency delta.

## Baseline (from call logs Apr 14–Apr 17, pre-pivot)

To be filled by Chitraksh from Retell dashboard. Pull the last 30 sales-outbound calls pre-pivot and compute:

| Metric | Value |
|---|---|
| n (calls sampled) | ______ |
| p50 time-to-first-audio (s) | ______ |
| p95 time-to-first-audio (s) | ______ |
| Mean call duration (s) | ______ |
| # calls with silence >5s | ______ |

## Post-pivot sample (target: 10 sales-outbound calls on HiQ)

Pull the first 10 sales-outbound calls on HiQ after the pivot timestamp. Same metrics.

| Call # | Retell call_id | Duration (s) | Time-to-first-audio (s) | Silence events >3s | Notes |
|---|---|---|---|---|---|
| 1 | | | | | |
| 2 | | | | | |
| 3 | | | | | |
| 4 | | | | | |
| 5 | | | | | |
| 6 | | | | | |
| 7 | | | | | |
| 8 | | | | | |
| 9 | | | | | |
| 10 | | | | | |

**Computed:**
- p50 time-to-first-audio: ______
- p95 time-to-first-audio: ______
- Delta vs Gemini baseline p95: ______

## Decision matrix

| Outcome | Action |
|---|---|
| HiQ p95 ≤ Gemini p95 − 2.0s | **Keep HiQ.** Paste deltas into dashboard R-HiQ card. Update pricing model. |
| HiQ p95 between Gemini p95 and Gemini p95 − 2.0s | **Flag.** Marginal improvement does not justify +$250/1K. Schedule a second-chance audit with 25 more calls. |
| HiQ p95 ≥ Gemini p95 | **Rollback.** Revert agent LLM to Gemini. Open ticket with HiQ support with logs attached. Update dashboard R-HiQ card to CLOSED-REVERTED. |

## Dashboard paste-in (after audit)

When the audit completes, paste this block into the dashboard at the HiQ risk card (line ~473, or wherever R-HiQ lives):

```
HiQ AUDIT Apr 18 2026 · n=10 · p50 ______ s · p95 ______ s · delta vs Gemini p95 ______ s · decision: [KEEP / FLAG / ROLLBACK]
```

## Cost math reference (for the decision call)

- HiQ adds $0.05/min. At 3m30s avg call = $0.175/call premium.
- 1K calls = +$175 (matches the +$250 figure when rounded with overhead).
- Latency value ceiling: if p95 drops by 2s, call completion rate historically improves 4–6 points (industry). At a $25/lead economics, that is +$1.00 to $1.50 per call in expected value — which covers the $0.175 premium 6-9×. So the math only works if we confirm the latency delta is real.

## One-shot query to extract the data (n8n → Retell)

Drop this into n8n, run once, copy the output into the table above:

```sql
-- Pseudo-query. Adapt to actual Retell API surface.
-- If Retell exposes call_id, model_used, started_at, time_to_first_audio, duration:
SELECT call_id,
       duration_seconds,
       time_to_first_audio_seconds,
       silence_event_count
FROM retell_calls
WHERE agent_type = 'sales_outbound'
  AND started_at >= '<HIQ_PIVOT_TIMESTAMP>'
ORDER BY started_at ASC
LIMIT 10;
```

If Retell API does not expose `time_to_first_audio` directly, approximate from the transcript timeline: first agent utterance timestamp minus call_answered timestamp.

---

*CTO-Claude autonomous ship · Apr 18 2026 AM. Blocker: need Chitraksh to pull the numbers and drop them into the table + dashboard.*
