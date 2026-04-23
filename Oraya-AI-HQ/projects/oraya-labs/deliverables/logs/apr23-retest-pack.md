# Inventory Retest Pack · Apr 23 · 21 cases

**Owner:** Chitraksh · Sprint Day 2 of 4 (T1.1)
**Pass bar:** 21/21 green before single-graph production lock (T1.4 · Apr 25)
**Prereq:** v3 synonym map deployed, `FAMILY_MAP` env var set, empty branch wired, `.in('trim', trimArray)` swap complete.

Run each case through the n8n `Mercedes Inventory Query` workflow with the listed user utterance. Log actual output JSON vs expected. Mark pass/fail in the table at the bottom.

---

## Synonym expansion (7 cases)

| # | Utterance | Expected family | Expected min rows |
|---|-----------|-----------------|-------------------|
| S1 | "I want an S-Class" | S-Class | ≥ 3 |
| S2 | "Looking for an SClass" (no hyphen) | S-Class | ≥ 3 |
| S3 | "Do you have the S five eighty" | S-Class (S580 specific) | ≥ 1 |
| S4 | "Something like a GLC 300" | GLC | ≥ 2 |
| S5 | "An E-Class wagon" | E-Class | ≥ 1 (check body_style filter) |
| S6 | "AMG GT" | AMG-GT | ≥ 1 |
| S7 | "Maybach" (bare family) | Maybach-S | ≥ 1 |

---

## Utterance noise (3 cases)

| # | Utterance | Expected behavior |
|---|-----------|-------------------|
| N1 | "uhh, I guess, maybe, like, an S-Class?" | Normalizer strips hesitations, family=S-Class, returns ≥ 3 rows |
| N2 | "an s class or an e class" | Returns both families, top 3 each, no collision |
| N3 | "S-class? or something similar, I don't know" | Family=S-Class primary, "3 close alternatives" flag in response metadata |

---

## Empty-path (1 case)

| # | Utterance | Expected behavior |
|---|-----------|-------------------|
| E1 | "Do you have a Ford F-150" | No-data guard fires, agent speaks "I don't see any exact matches for that in our current inventory. Let me pull up the closest options I have on the lot." respond-to-webhook closes cleanly, no hang |

---

## VIN-specific (10 cases)

Pick 10 real VINs from current Supabase `vehicles` table (SELECT vin, model, trim FROM vehicles ORDER BY random() LIMIT 10). For each VIN:

| # | User utterance (templated) | Expected |
|---|----------------------------|----------|
| V1-V10 | "Tell me about VIN {last 6 digits}" | Exact row returned, price, stock_status, year populated |

Log each real VIN used at run time.

---

## Result table (fill during run)

| Case | Input | Expected | Actual | Pass/Fail | Notes |
|------|-------|----------|--------|-----------|-------|
| S1 | I want an S-Class | S-Class ≥3 | | | |
| S2 | Looking for an SClass | S-Class ≥3 | | | |
| S3 | Do you have the S five eighty | S-Class S580 ≥1 | | | |
| S4 | Something like a GLC 300 | GLC ≥2 | | | |
| S5 | An E-Class wagon | E-Class ≥1 | | | |
| S6 | AMG GT | AMG-GT ≥1 | | | |
| S7 | Maybach | Maybach-S ≥1 | | | |
| N1 | uhh S-Class? | S-Class ≥3 | | | |
| N2 | s class or e class | Both families top 3 | | | |
| N3 | S-class or similar | S-Class + alternatives flag | | | |
| E1 | Ford F-150 | No-data guard speaks | | | |
| V1 | VIN {...} | Row returned | | | |
| V2 | VIN {...} | Row returned | | | |
| V3 | VIN {...} | Row returned | | | |
| V4 | VIN {...} | Row returned | | | |
| V5 | VIN {...} | Row returned | | | |
| V6 | VIN {...} | Row returned | | | |
| V7 | VIN {...} | Row returned | | | |
| V8 | VIN {...} | Row returned | | | |
| V9 | VIN {...} | Row returned | | | |
| V10 | VIN {...} | Row returned | | | |

---

## Failure routing

- Any S-series fail: check FAMILY_MAP JSON for missing trim, add, redeploy code node.
- Any N-series fail: utterance normaliser regex miss — paste failing phrase into normaliser test, fix regex, rerun.
- E1 fail (no-data guard): empty branch not wired to respond-to-webhook. Fix wiring in n8n.
- Any V-series fail: Supabase query tool returning nothing despite row existing — query string mismatch, likely `.in('trim', ...)` vs `.eq('vin', ...)` order-of-filters bug.

Log every failure in `logs/apr23-retest-failures.md` with the workflow run URL from n8n so we can grep for it later.
