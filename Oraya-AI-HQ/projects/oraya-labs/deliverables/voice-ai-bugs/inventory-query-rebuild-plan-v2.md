# Inventory Query Rebuild Plan · v2 · Apr 20, 2026

**Status:** BENCHED from Tuesday Apr 21 email. Target: perfect before Apr 22–25 prospect-response window.
**Owner:** Chitraksh (CTO) · CTO-Claude ships paste-ready artifacts · Chitraksh executes in n8n
**Supersedes:** v1 (Apr 18). v1 addressed token bloat and price field; v2 addresses the Mtg 19 trio: synonym-map, no-data hang, sync-vs-query root cause.

---

## 1. Three P1 bugs from Mtg 19

| # | Bug | Observed | Root cause |
|---|---|---|---|
| P1-A | "S-Class" returns 5 of 42 | Agent claims only 5 cars when 42 exist | DB stores trim (S500, S580, S63). No "S-Class" string. Query is literal-string `eq(model,"S-Class")`. |
| P1-B | Agent goes silent when no results | Workflow halts mid-call. Dead air >5s. | Empty branch never hits respond-to-webhook. |
| P1-C | 2026 S-Class missing | Frankie saw 4 on site; sync reports fewer | Unknown: sync-miss vs query-tool fault. Needs diagnostic. |

---

## 2. Synonym map · family → trim array

Add an n8n **Code node** before the Supabase query. Input = user-uttered model family. Output = `trimArray` of actual DB trim values.

```js
// n8n Code node · "Expand family to trim array"
const familyToTrims = {
  "S-Class":     ["S500", "S550", "S560", "S580", "S580E", "S63", "S65", "Maybach-S", "S-Class"],
  "E-Class":     ["E350", "E450", "E53", "E63", "E-Class"],
  "C-Class":     ["C300", "C43", "C63", "C-Class"],
  "GLA":         ["GLA250", "GLA35", "GLA45", "GLA"],
  "GLB":         ["GLB250", "GLB35", "GLB"],
  "GLC":         ["GLC300", "GLC43", "GLC63", "GLC-Coupe", "GLC"],
  "GLE":         ["GLE350", "GLE450", "GLE53", "GLE63", "GLE-Coupe", "GLE"],
  "GLS":         ["GLS450", "GLS580", "GLS63", "Maybach-GLS", "GLS"],
  "AMG-GT":      ["AMG-GT", "GT53", "GT63", "AMG-GT-S"],
  "EQS":         ["EQS450", "EQS580", "EQS-SUV", "EQS"],
  "EQE":         ["EQE350", "EQE500", "EQE-SUV", "EQE"],
  "Sprinter":    ["Sprinter", "Sprinter-2500", "Sprinter-3500"]
};

// Normalise user utterance
const q = ($json.model_family || "").trim();
const key = Object.keys(familyToTrims).find(k =>
  k.toLowerCase() === q.toLowerCase() ||
  q.toLowerCase().includes(k.toLowerCase().replace("-", " ")) ||
  q.toLowerCase().includes(k.toLowerCase().replace("-", ""))
);

const trimArray = key ? familyToTrims[key] : [q]; // fallback: literal match
return [{ json: { ...$json, trimArray, resolvedFamily: key || null } }];
```

---

## 3. Supabase query · replace literal-string match

**Before (broken):**
```sql
-- What the old n8n query essentially does
select * from vehicles
where model = 'S-Class'
  and stock_status = 'available'
limit 5;
```

**After (correct):**
```sql
-- New query shape driven by trimArray from the Code node
select vin, year, make, model, trim, exterior_color, interior_color, mileage, price, stock_number
from vehicles
where trim = any($1::text[])       -- $1 = trimArray
  and stock_status = 'available'
order by year desc, price asc
limit 50;
```

In n8n Supabase node terms: replace the filter `.eq('model', '{{ $json.model_family }}')` with `.in('trim', '{{ $json.trimArray }}')`. Remove `.limit(5)` and set `.limit(50)` — let the LLM pick 3-5 to offer.

---

## 4. No-data guard · empty branch wiring

Currently: empty result set = workflow halts = agent dead-airs.

Add a second Code node immediately after the Supabase query, on the empty branch.

```js
// n8n Code node · "No-match speaking intent"
if (!$json.items || $json.items.length === 0) {
  return [{
    json: {
      speak: "Let me tell you what I can do — I don't see that exact spec on the lot right now, but I have a few close options I can pull up for you. Want to hear them?",
      intent: "no_exact_match",
      offer_close_alternatives: true,
      resolvedFamily: $json.resolvedFamily
    }
  }];
}
return $input.all();
```

Wire **both** the success branch and the empty branch into the `Respond-to-Webhook` node. Currently only the success branch is wired — that is why the agent goes silent.

---

## 5. Supabase diagnostic · sync-miss vs query-tool

Run these in Supabase SQL editor **before** blaming either side:

```sql
-- Q1 · Do S-class trims exist at all?
select count(*) as n_s_class, min(year) as min_yr, max(year) as max_yr
from vehicles
where trim ~ '^S[0-9]{3}' or trim in ('S-Class','S580E','S63','S65','Maybach-S');

-- Q2 · Are 2026 rows present?
select year, count(*), string_agg(distinct trim, ', ') as trims
from vehicles
where year = 2026
group by year;

-- Q3 · When was the vehicle table last synced?
select max(updated_at) as last_sync, count(*) as total_rows
from vehicles;

-- Q4 · Compare dealer-site-visible count to DB count (for S-Class family)
select count(*)
from vehicles
where trim = any(array['S500','S550','S560','S580','S580E','S63','S65','Maybach-S','S-Class'])
  and stock_status = 'available';
```

**Verdict decision tree:**
- Q2 rows = 0 → **sync-miss**. Fix the inventory-sync n8n cron + dealer-feed scope filter. Check if new-model-year filter excludes 2026.
- Q2 rows > 0 but Q4 count < dealer-site count → **query-tool fault**. Trim map missing synonyms OR stock_status filter too strict.
- Q3 last_sync > 24h old → sync cron failing silently. Check n8n execution log.

Paste the verdict into dashboard Risk row R13 same session.

---

## 6. Retest · 10-VIN regression + synonym cases

Once §2-§4 deployed:

1. **Synonym regression:** call with "S-Class", "E-Class", "GLC", "GLB", "GLE", "AMG GT", "EQS" — each must return ≥ 3 real vehicles if available, else hit the no-match speaking intent cleanly.
2. **Empty-path regression:** call with "2019 Sprinter 5500" (known-zero) — must hit no-match intent, no dead air.
3. **Specific-VIN regression:** 10 VINs with known prices — agent must quote price, year, trim, mileage correctly every time.
4. **Token budget:** confirm call stays at ~3,000 tokens, not 8,000. Synonym expansion happens in n8n (free), not in LLM context.

Pass criteria: 10/10 VIN lookups, 7/7 synonym lookups, 1/1 empty-path. Any miss → roll back to v1 and debug.

---

## 7. Ship order

| Step | Owner | Tool | Time |
|---|---|---|---|
| 1 | CTO (manual) | Run §5 SQL in Supabase | 5 min |
| 2 | CTO (manual) | Document §5 verdict in dashboard R13 | 2 min |
| 3 | CTO (via Chrome MCP) | Add synonym-map Code node to n8n workflow | 10 min |
| 4 | CTO (via Chrome MCP) | Swap Supabase query to `.in('trim', ...)` | 5 min |
| 5 | CTO (via Chrome MCP) | Add no-data guard Code node + wire empty branch | 10 min |
| 6 | CTO (manual) | Run §6 retest pack | 30 min |
| 7 | CTO-Claude | Log retest results in dashboard + push | 5 min |

**Window:** Apr 22–25 prospect-response days. Does NOT ship with Tuesday email — appt-setter only for the first prospect wave.
