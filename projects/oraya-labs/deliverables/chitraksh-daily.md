# Chitraksh Daily Actions -- Sunday, March 29, 2026

**4 DAYS TO MERCEDES DEADLINE (April 2)**

---

## TODAY (Sunday, March 29)

### 1. DRAFT KHALID PERSONAL OFFER LETTER [CRITICAL -- Claude is generating]
10% net revenue commission, $700K max across 323 locations over 24 months. Contingent on facilitating C-suite introduction. Payment: net 60-90 days. Show the earnings ladder in the letter: 10 dealerships = $2K/mo, 50 = $10K/mo, 323 = full $700K cumulative. This makes the number feel achievable, not abstract. Use California law. Review tonight.

### 2. DRAFT SLA DOCUMENT [CRITICAL -- Claude is generating]
75% outbound connection baseline with proprietary N8N retry loop pushing to near-100% effective reach. 99% platform uptime. Speed-to-lead under 60 seconds. Include insurance case study metrics ($27K/week revenue, 15-20 appointments/day, 3-4 closings/day) as "demonstrated capability in adjacent vertical" with legal disclaimers in a dedicated section. Review tonight.

### 3. CLEAN MERCEDES EMAIL [CRITICAL]
Remove every em dash and en dash. Change "60-90 day pilot" to "30-45 day pilot." Add one sentence about insurance case study: "In a recent insurance deployment, our system generated 15-20 qualified appointments per day and closed 3-4 policies daily." Send cleaned version to Frankie. No recipient address yet.

### 4. EDIT DEALERSHIP OFFER LETTER [HIGH]
Every mention of LLC becomes C Corp or Corporation. Pilot duration: 30-45 days. Verify signature block, entity name, terms match Meeting 14 discussion.

### 5. HUMAN TRANSFER TEST WITH FRANKIE [HIGH]
Lock a time. Cold transfer works. Warm transfer connects but advisor gets no briefing. Isolate: is it Retell's transfer node config or the SIP handoff to Twilio?

### 6. MX + SPF RECORDS FOR founder@orayalabs.ai [MEDIUM]
Go to Vercel DNS for orayalabs.ai. Add 5 Google Workspace MX records + SPF TXT record. Do NOT change nameservers. 15-minute task. Frankie needs this email before April 2.

### 7. PUSH DASHBOARD TO VERCEL [MEDIUM]
Meeting 14 ingested. Daily Tasks tab live. Run:
```bash
cd ~/Downloads/Claude\ hq && cp projects/oraya-labs/deliverables/oraya-project-intelligence-dashboard.html index.html && git add index.html projects/oraya-labs/deliverables/oraya-project-intelligence-dashboard.html && git commit -m "Mar 29: Daily tasks upgraded, Meeting 14 final" && git push -f origin HEAD:main
```

---

## 3-DAY HORIZON (Mon Mar 30 to Wed Apr 1)

### Monday: Final Package Assembly
5 documents must be finalized: (1) Dealership Offer Letter (C Corp), (2) Khalid Offer Letter, (3) Compliance Report (Doc B v2, done), (4) SLA, (5) Pilot SOW. Claude can generate #2, #4, #5. You review and approve.

### Monday Evening: Document Review Meeting with Frankie
Walk through every attachment. If something is off, Tuesday is the fix day.

### Tuesday: Test Email Dress Rehearsal
Send full email with all attachments between yourselves 2-3 times. Check PDFs render, mobile readability, tone.

### Build N8N Outbound Retry Workflow
Failed outbound calls route to N8N, retrigger through same Retell agent via different trigger. The SLA differentiator. Claude can generate the import-ready JSON.

### Build N8N Nurture/Reschedule Workflow
Auto-schedule callback when prospect says "call me tomorrow at 4pm." Captures callback time from post-call extraction, stores in queue, triggers outbound at specified time. Not blocking April 2 but a selling point.

### Create "Why Now" One-Pager
Executive summary for Khalid: what changed since last contact, why Oraya is ready now, what Khalid gets, next step. One page. Claude will produce this as a PDF.

---

## 1-WEEK HORIZON (Through Sunday, April 6)

- **EIN expected April 2-3.** If nothing by Apr 3, call IRS (800) 829-4933. Chain: EIN > bank > Stripe > billing.
- **Demo video for SMB revenue pivot.** 45 sec to 2 min. Screen recording of voice agent + results.
- **Define pricing tiers.** Solopreneur / Small Business / Enterprise. Based on $30-40/client stack cost and 90%+ margins.
- **Gemini 3.1 Live research.** API availability, phone integration, per-minute cost vs current stack.
- **WhatsApp Business migration.** Connect Cloud API to N8N for auto-sync.
- **Insurance case study PDF.** Formalize $27K/week numbers into standalone "Proven Results" document.

---

## PARTNER NOTES: WHAT I THINK WE ARE MISSING

1. **No fallback if Mercedes says no.** Identify 5 independent Bay Area dealerships this week.
2. **$700K math not shown in the letter.** Show the earnings ladder. Make it tangible.
3. **No "Why Now" executive summary.** 5 attachments is a lot. Need one page that makes Khalid open everything else.
4. **No defined pilot success KPIs.** Suggestion: 10+ qualified appointments/week, 99% uptime, under 60s speed-to-lead within 30 days.
5. **E&O must be BOUND, not quoted.** The email says "in place." If Khalid asks for proof and the answer is "getting quotes," credibility drops.
6. **SAFE note ($10K) is unresolved legal risk.** Resolve before any enterprise contracts.
7. **Execution window is compressing.** If docs are not locked by Monday night, Tuesday becomes a scramble.

---

*Generated by Sentient Protocol. Next briefing: Monday, March 30.*
