# Stripe Live Mode · 3 Products v1 · Apr 24 2026

**Owner:** Frankie (Stripe Owner, `frankie@orayalabs.ai`) · Chitraksh (Admin, plumbing)
**Status:** spec drafted Apr 24 morning · live by EOD Apr 24
**Trigger:** Mtg 23 (Apr 24 PM) — fresh Stripe account spun up, three products queued. Old sandbox cooked.

---

## Why this matters today

Triple-send is at T+24h. Any "yes-pilot" reply that lands today needs a payment link to land on within the same email response. No products live = the partnership cannot send the close-out email until Monday. That is unacceptable inside the triple-send window.

---

## Three products

| SKU | Tier | Price | Billing | Trial | Refund | Audience |
|---|---|---|---|---|---|---|
| `oraya_intro_497` | Intro | $497/mo | Monthly recurring | 14-day free | 14-day money back | Solo agents, 1-2 producers, single-location dealership service desk |
| `oraya_standard_997` | Standard | $997/mo | Monthly recurring | 14-day free | 14-day money back | Multi-producer agencies, single-location MBSB-class dealerships |
| `oraya_enterprise_1997` | Enterprise | $1997/mo | Monthly recurring | None (sales-led) | 30-day money back | Multi-location dealerships, agency networks, custom inventory + qualifier |

All three:
- USD only at launch
- Auto-renew ON
- Default payment methods: card (Visa/MC/Amex/Discover) + ACH
- Payouts: Chase ••••6789, daily auto-payout
- Tax: Stripe Tax ON (US sales tax handled automatically)

---

## Feature matrix (what is included per tier)

### Intro $497/mo
- 1 voice agent (qualifier or appt-setter, pick one)
- Up to 500 outbound minutes/mo (Retell baseline)
- GoHighLevel CRM sync
- Email + SMS notifications
- Business-hours support (PT)
- Standard reporting (calls placed, calls answered, callbacks scheduled)

### Standard $997/mo
- Everything in Intro, plus
- 2 voice agents (qualifier + appt-setter, both)
- Up to 1500 outbound minutes/mo
- Inbound IVR replacement option
- Custom voice ID (pick from Retell library)
- Weekly performance dashboard
- Slack integration

### Enterprise $1997/mo
- Everything in Standard, plus
- Up to 5 voice agents (incl. inventory + custom flows)
- Up to 5000 outbound minutes/mo (overage $0.10/min)
- Custom inventory integration (Mercedes-style)
- Dedicated Supabase schema
- Custom CRM webhook routing
- 24/7 priority support
- White-label option (extra setup fee)

---

## Webhook plumbing (Chitraksh C2 owner)

n8n webhook endpoint: `https://orayacorporation.app.n8n.cloud/webhook/stripe-events`

**Events to subscribe (Stripe dashboard → Developers → Webhooks):**
- `checkout.session.completed` → create Supabase row in `subscriptions` + fire founder Slack/email notification
- `customer.subscription.updated` → update Supabase row + tag GHL contact with new tier
- `customer.subscription.deleted` → mark Supabase row `cancelled_at`, fire churn alert
- `invoice.payment_failed` → fire dunning sequence in GHL
- `invoice.payment_succeeded` → log to `invoices` table, fire receipt confirmation

**Signature verification:** use `STRIPE_WEBHOOK_SECRET` env var (placeholder `whsec_REPLACE_ME`). Never paste live secret in repo.

**Supabase `subscriptions` table schema:**
```sql
create table if not exists subscriptions (
  id uuid primary key default gen_random_uuid(),
  stripe_customer_id text not null,
  stripe_subscription_id text not null unique,
  email text not null,
  tier text not null check (tier in ('intro','standard','enterprise')),
  status text not null,
  current_period_start timestamptz,
  current_period_end timestamptz,
  cancelled_at timestamptz,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);
create index if not exists subscriptions_email_idx on subscriptions(email);
create index if not exists subscriptions_status_idx on subscriptions(status);
```

---

## Frankie-side checklist (today)

1. Log in to `frankie@orayalabs.ai` Stripe account.
2. Create three products + prices using the matrix above.
3. Generate three Payment Links: copy the URLs into the partnership thread.
4. Run a $1 test purchase with a non-Chase card on the Intro tier.
5. Confirm webhook fires and Supabase row appears (Chitraksh confirms).
6. Refund the test purchase.
7. Done. Any "yes-pilot" reply gets the matching tier link the same hour.

---

## Chitraksh-side checklist (today)

1. Create Supabase `subscriptions` table (SQL above).
2. Wire n8n webhook node, signature verification with `STRIPE_WEBHOOK_SECRET` env.
3. Test with Stripe CLI `stripe listen --forward-to ...` then `stripe trigger checkout.session.completed`.
4. Confirm Supabase write + Slack/email notification fires.
5. Document the GHL contact tagging step (which custom field gets the tier value).
6. Update dashboard with go-live confirmation.

---

## Risk

- **Stripe security blocked Claude Chrome RPA on payment pages (Mtg 23).** Tier-button wiring on the marketing site is hands-on-keyboard. Plan for that work item separately, do not block this spec on it.
- **Chase ••••6789 payout connection** must show "active" before first sale. If still in micro-deposit verification, route first-sale revenue to a backup card and reconcile manually.
- **Sales tax:** Stripe Tax requires US tax registration in the states where we collect. CA registered (EIN 93-3462113). Other states deferred until threshold.
