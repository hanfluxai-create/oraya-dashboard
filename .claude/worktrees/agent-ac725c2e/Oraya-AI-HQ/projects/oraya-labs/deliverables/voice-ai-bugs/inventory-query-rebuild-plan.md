# Inventory Query Rebuild Plan · Apr 18, 2026

**Status:** BLOCKS NEXT DEMO
**Owner:** Chitraksh (CTO) · review + approve
**Ships:** CTO-Claude drafts spec → dev queue executes → Chitraksh signs off on retest

---

## 1. Symptom

- Retell voice agent inventory query consumes **~8,000 tokens per call**, vs **~3,000 baseline** established in end-to-end test on Apr 11.
- **Price field is not loading** in the response payload the agent receives. The agent either omits price or says "let me check" and pivots off.
- Observed during Apr 17 dry-run. Confirmed Apr 18 AM. Reproduces on every VIN query.

## 2. Root cause hypothesis

The current flow passes the full 1,700-vehicle inventory snapshot into the LLM context on every call, then asks the LLM to "find" the vehicle and return its fields. That's:
- **O(n) token cost** on a read that should be O(1).
- **LLM-parsed fields** instead of **DB-native fields** — which is why price silently drops when the scraper writes it to a column the prompt doesn't reference.

Root cause = **we are using the LLM as a database**. We need to restore the LLM to language-layer only and hand data lookups to n8n.

## 3. Rebuild — three-part fix

### Part A · n8n HTTP lookup node

Replace the "inventory in prompt" pattern with a dedicated lookup node:

```
Trigger (Retell webhook: inventory_query intent)
 ↓
HTTP Request → Supabase REST: GET /rest/v1/inventory?vin=eq.{{vin}}&select=*
 ↓
Function node: field map (see Part B)
 ↓
Response → Retell custom tool output
```

The agent's system prompt gets the **lookup tool spec**, not the inventory. It calls the tool when it needs a vehicle, and the tool returns one row.

### Part B · Field map (canonical contract)

Every lookup must return these fields in this exact shape. If a field is missing from Supabase, the function node fills with `null` — never omits.

```
{
  "vin": string,
  "year": number,
  "make": string,
  "model": string,
  "trim": string | null,
  "exterior_color": string | null,
  "interior_color": string | null,
  "mileage": number | null,
  "price": number | null,          // <-- canonical price field
  "msrp": number | null,
  "stock_number": string | null,
  "body_style": string | null,
  "engine": string | null,
  "transmission": string | null,
  "drivetrain": string | null,
  "fuel_type": string | null,
  "features": string[] | null,
  "image_url": string | null,
  "listing_url": string | null,
  "status": "available" | "sold" | "pending" | "in_transit",
  "updated_at": ISO8601
}
```

**Non-negotiable:** `price` and `status` are never omitted. If Supabase returns null, the agent gets null and must say "let me grab that from the manager" — not hallucinate.

### Part C · Token guard

Three guardrails baked into the function node:

1. **Max payload size:** 2KB per lookup. Strip `features` array to top 10 if it overflows.
2. **Context eviction:** After each lookup, the prior lookup's full payload is dropped from LLM context. Only the current vehicle stays hot.
3. **Budget alarm:** If total tokens for a call exceed 4K, emit `token_budget_warn` event to Supabase `call_events` table. Dashboard picks it up.

Expected outcome: **3.0–3.5K tokens per call, steady state.**

## 4. Retest protocol

Before calling the fix shipped, Chitraksh runs:

1. **10 VIN smoke test** — 10 known VINs from Mercedes of South Bay, pre-verified prices in Supabase. Agent must state correct price on all 10.
2. **1 missing-field test** — force `price = null` for one VIN. Agent must say "let me grab that from the manager" verbatim.
3. **Token ceiling test** — 5 consecutive queries in one call. Max tokens across the full call ≤ 4K.
4. **Latency test** — p50 ≤ 800ms for the HTTP node round-trip (Retell → n8n → Supabase → Retell).

All four pass = fix shipped. Dashboard R13 flipped from OPEN to CLOSED.

## 5. Not in scope (intentionally)

- Not replacing the inventory crawler. Scraper is fine.
- Not touching the 5 n8n workflows that refresh inventory every 4hrs. Those write to Supabase — the fix reads from Supabase.
- Not moving off Supabase. Latency is already good.
- Not changing the agent voice or the sales-outbound LLM (HiQ). Orthogonal concerns.

## 6. Estimate

- Spec (this doc): done.
- Dev execute: 2–3 hours for a sharp dev, including the function node + token guard.
- Retest: 45 min.
- **Target ship:** EOD Apr 18 if queued by 2 PM PT. Fallback: AM Apr 19.

## 7. Why this matters

Mazzio call is blocked until this is green. Teresa's P2 demo is phone-only and doesn't hit the inventory path, so P2 is unblocked — but every P1 conversation is on pause until we can quote a price with confidence. One bug, one fix, two pipelines unlocked.
