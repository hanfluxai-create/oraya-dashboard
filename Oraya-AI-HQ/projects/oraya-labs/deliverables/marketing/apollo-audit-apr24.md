# Apollo Enrichment Audit · Apr 24 2026

**Owner:** Chitraksh (audit) · Frankie (downstream list pulls)
**Status:** scaffold drafted Apr 24 morning · audit fill-in by 1 PM PT today
**Trigger:** Mtg 23 (Apr 24 PM) confirmed Apollo plugin live on free tier from earlier prospecting. Need to know exact ceiling before paid-ads playbook v0.1 audience seed work begins.

---

## Audit checklist (Chitraksh, ~60 min)

1. **Account access:** Confirm login on `frankie@orayalabs.ai` Apollo workspace. Capture plan tier, monthly seat count, current credit balance.
2. **Free-tier ceiling:**
   - Monthly export limit (records / month)
   - Search-credit consumption rate (per filter type)
   - Email-finder credit ceiling
   - Phone-finder credit ceiling
   - List-build cadence allowed (lists per day, per workspace)
3. **Last 30 days usage:**
   - Total records exported
   - Total search credits consumed
   - Most-used filter combos
   - Lead segments built (insurance agents, dealership managers, other)
4. **Export the last 30 days of pulled leads as CSV** → save to `deliverables/marketing/apollo-leads-30d-apr24.csv` (do not commit raw PII into the repo if list contains personal data; gitignore if needed and store outside repo).

---

## Decision matrix (decide today)

| Scenario | Action |
|---|---|
| Free tier ceiling > current monthly need | Stay on free, no upgrade |
| Free tier ceiling at < 50 percent of paid-ads audience seed need | Upgrade to Apollo Basic ($49-79/mo per seat) |
| Free tier ceiling at < 20 percent of paid-ads need + need verified emails for cold campaigns | Upgrade to Apollo Professional ($99/mo per seat) |
| Apollo data quality below 60 percent verified-deliverable | Switch to a different enrichment tool (Hunter, Lusha, RocketReach) before scaling spend |

---

## What the audit unlocks

- **Paid-ads audience seed file:** the CSV of last 30 days becomes the lookalike seed for Meta + Google audiences.
- **Cold-email channel future re-evaluation:** if Apollo data verifies cleanly at >70 percent deliverable, we have a route back to cold-email-as-supplement (not primary), as discussed in Mtg 23.
- **George-style reactivation list:** Apollo can surface old contacts who are now in expansion-mode at new agencies. Frankie's book + Apollo enrichment = highest-yield reactivation campaign.

---

## Document the trigger to upgrade

Whatever decision today, document it here so we do not relitigate next month:

```
Decision date: 2026-04-24
Apollo plan: [free / basic / professional]
Monthly export ceiling: ___
Monthly credit ceiling: ___
Current usage rate: ___ / ___ (___ %)
Re-evaluation trigger: ___ (e.g., paid-ads audience seed exceeds 5K records/month)
Owner: Chitraksh
```

---

## Open question for Frankie

Does the Apollo workspace have a shared seat with anyone outside the partnership (intern, VA, prior consultant)? If yes, audit what they have access to and rotate credentials before any payment information is added at upgrade time.
