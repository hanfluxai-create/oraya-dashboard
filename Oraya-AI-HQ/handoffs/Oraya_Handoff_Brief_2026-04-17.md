# Oraya AI — Dashboard Update Handoff Brief

> Paste this ENTIRE file into a new Claude session. It contains everything
> needed to update the Oraya AI dashboard and website without re-uploading
> any PDFs, screenshots, or chat exports.

---

## 1. ORIGINAL INSTRUCTION (verbatim, from Chitraksh, 2026-04-17)

READ All files in claude hq

upDate for our dashboard based on the WhatsApp charts and the meeting. Also, today, is seventeenth April. And every time I push to GitHub, there's problems I'm facing. So come up with the permanent solution for the GitHub push and sometimes dashboard is not updated entirely There are a lot of sections in the dashboard. Those are not updated. Also, like, the visuals of the dashboard, pretty bored of it. So create something with a white background. And insert a light mode in the Orion dashboard.

(The user refers to "Orion dashboard" but means the **Oraya AI** dashboard —
project folder `oraya-ai`, main component `src/components/HeroDashboard.tsx`.)

### Clarified answers from the user (during that session):
- **Dashboard target:** Yes, the Oraya dashboard (`HeroDashboard.tsx`)
- **GitHub fix approach:** Switch to SSH keys (Recommended)
- **Design style:** Stripe-style — clean white background + subtle shadows
- **What to update on the dashboard:** Mercedes of South Bay pilot status +
  revenue-operations KPI refresh

---

## 2. CONTEXT FROM SCREENSHOTS (described — originals not needed)

The user attached 12 screenshots that established the following facts; a new
session can rely on these descriptions instead of the originals:

- **Mercedes-Benz of South Bay follow-up email** from Chris Mazzio,
  Sales Manager, `Mazzioc@autonation.com`, 3311 Pacific Coast Highway,
  Torrance, CA 90505, tel 310.650.4826. C-Class inquiry follow-up; user
  decided to offer any vehicle, not just C-Class.
- **Stripe settings page** — CHASE Bank ••••6789 / 322271627 is the USD
  payout account. Automatic payouts are on.
- **Stripe team page (ORAYA AI sandbox)** — FRANKIE ALICEA is Owner
  (`manifestdestiny247@gmail.com`). chitrakshmayank3@gmail.com was
  invited as Administrator (pending).
- **Android Gmail notifications** — "New Agency Admin added to ORAYA AI"
  and "New Client Added to ORAYA AI" (GoHighLevel / `app.gohighlevel.com`).
- **iOS lock-screen Gmail notifications** — Chase "You're now sharing
  data with Stripe", Stripe 2FA back-up code, Stripe 2FA enabled, Zillow
  listing. Dates April 14.
- **SMS thread with (510) 520-4265** — sent "Barbershop Software |
  Booking & Management vagaro.com" card followed by
  "Oraya AI | Turn missed calls into booked revenue" with
  `share.google/RM8l3LmblmUpUJWhm` + `orayalabs.ai` preview.
- **Strategy Law LLP intake-form confirmation email** from Sophia Diaz,
  Client Support Specialist, 1 Almaden Blvd Suite 700, San Jose, CA 95113,
  `sdiaz@strategylaw.com`. Mentions conflict check + intake coordinator.
- **Insurance quote comparison** — Standard $46.00/mo (Professional
  Liability E&O) vs Plus $82.42/mo (E&O + Cyber Liability), both with
  $1,000 deductible and $1,000,000 limits, coverage starting 04/07/26.
- **Frankie Alicea handwritten signature** (envelope) — twice, for
  document execution.
- **Previous Claude-in-Chrome session output** — verified Oraya
  Corporation's California SoS filing: Principal Address 34837
  Winchester Place, Fremont, CA 94555 (Alameda County). Statement of
  Information due 08/31/2026.
- **Google Workspace help doc** on recovering administrator access
  (Google account recovery flow).

---

## 3. CURRENT DASHBOARD STATE (what's already in the repo, 2026-04-17)

Repo: `hanfluxai-create/oraya-ai` (Next.js 15 + Tailwind + TypeScript).
Main dashboard component: `src/components/HeroDashboard.tsx`.
Light-theme design tokens already defined in `src/app/globals.css`
(`--color-bg #f7f8fc`, `--color-surface #fff`, `--color-text #0b1324`,
`--color-cyan #0ea5e9`, `--color-violet #7c3aed`).
Utility classes: `.glass-panel`, `.surface-panel`, `.dashboard-glow`,
`.gradient-text`, `.grid-pattern`, `.pulse-dot`.

Components on the home page (in order):
Navbar → Hero (+ HeroDashboard + HeroOrb) → SocialProof → Services →
Process → VoiceAI → Platform → Security → Testimonials → Pricing → CTA →
Footer.

Known copy that needs refresh per Frankie's 2026-04-12 feedback:
- Replace plumbing example with **one automotive** + **one life-insurance**
  conversation (automotive already switched to Mercedes GLS; life-insurance
  not yet added).
- Add **more CTA buttons** to book appointments on the site.
- Add a **barbershop/vagaro-style large hero screenshot** of the product.
- Embed the **AI voice demo** on the website itself.
- Feature **Stripe payment link** on the website.

---

## 4. CANONICAL FACTS FOR THE DASHBOARD

These are the numbers / names a new session should hard-wire into
`HeroDashboard.tsx` unless newer data arrives:

- Pilot customer: **Mercedes-Benz of South Bay** (AutoNation group),
  champion **Greg**, sales manager **Christopher "Chris" Mazzio**.
- Voice stack: **Retell** at **$0.10/min** all-in (LLM + TTS + ASR).
  Average call ≈ **3 min 30 sec** → **≈ $0.35 / call**.
- Pilot call budget example: $30 ≈ **85 calls**.
- Workflow stack: **n8n** (workflow automation).
- CRM touched: HubSpot / GoHighLevel sub-accounts.
- Current KPIs to display: Avg response, Calls handled, Bookings set,
  Cost / call.
- Live-activity examples to show: after-hours GLS booking, web lead
  qualified by SMS, CRM write-back.
- Next-best-action example: "Confirm Thu · 10:00 AM — GLS private viewing."

---

## 5. GITHUB PUSH — PERMANENT FIX (already applied)

The old remote had a Personal Access Token embedded in the URL
(`github_pat_...@github.com/...`). That is the root cause of recurring
push failures (secret scanning, token expiry, rate limits).

Fix already committed to the repo:
- `scripts/setup-github-ssh.sh` — one-time SSH setup script
- `scripts/push.sh` — add / commit / push helper
- `GITHUB_SETUP.md` — full docs
- `.git/config` → remote `origin` rewritten to
  `git@github.com:hanfluxai-create/oraya-ai.git`

One-time user action:

```bash
cd oraya-ai
bash scripts/setup-github-ssh.sh     # generates key, opens GitHub settings
# paste public key into GitHub, press ENTER
git push
```

After that, every `git push` just works.

---

## 6. WHATSAPP CHAT EXPORT (full)

(Exported from Chitraksh × Frankie Alicea WhatsApp thread, 2026-03-03 → 2026-04-17)

```
[03/03/26, 2:02:34 AM] Frankie Alicea: ‎Messages and calls are end-to-end encrypted. Only people in this chat can read, listen to, or share them.
[03/03/26, 2:02:34 AM] Chitraksh: ‎Voice call, ‎3 min
[05/03/26, 8:31:04 PM] Frankie Alicea: ‎Missed voice call, ‎Tap to call back
[05/03/26, 8:32:50 PM] Frankie Alicea: Transfer went through brother
‎[05/03/26, 8:34:47 PM] Chitraksh: ‎<attached: 00000005-PHOTO-2026-03-05-20-34-47.jpg>
[05/03/26, 8:34:49 PM] Chitraksh: ‎Voice call, ‎10 min
[05/03/26, 8:48:31 PM] Chitraksh: We can set up a smart contract with Greg on the oracle event that ‘our bank receives $1997 from autonation bank account’
[05/03/26, 8:49:19 PM] Chitraksh: Or we can include him in the stripe payment link directly
[05/03/26, 8:50:54 PM] Chitraksh: Cryptos are more liquid than water bro, eventually we should aspire to do all banking in crypto
[05/03/26, 8:51:06 PM] Chitraksh: And have our own token
[05/03/26, 8:52:48 PM] Chitraksh: But when we have sufficient revenue till then we do 
Private banking - crypto 
With clients - Stripe/joint account
[06/03/26, 9:07:44 PM] Frankie Alicea: ‎Voice call, ‎12 min
[06/03/26, 9:20:41 PM] Chitraksh: ‎Voice call, ‎No answer
[06/03/26, 9:21:12 PM] Frankie Alicea: ‎Missed voice call, ‎Tap to call back
[06/03/26, 9:21:15 PM] Chitraksh: Is there some network issue on your end?
[06/03/26, 9:21:20 PM] Chitraksh: ‎Voice call, ‎19 min
[06/03/26, 10:12:18 PM] Chitraksh: For this $78

We will have 
$24 - Claude pro new
$9 - Comet with student discount 
$20 - for retell so that we have sufficient funds when doing the demos for oraya and Mercedes 
(We get $10 trial on the fresh account and we fund $20 that gives us $30 for retell etc)

$15 reserves for twillio just in case

That leaves us with $10 spare which I’ll fund in api credits for the n8n automations (we don’t require for voice ai but will need for LinkedIn and email outreach)
[06/03/26, 10:13:40 PM] Chitraksh: I’ll still hold the n8n as I am able to easily import into new trials will fund it right before we show it to guys at dealership so that we append the ‘automated by n8n’ message at the end
[06/03/26, 10:20:38 PM] Chitraksh: This is our cost on retell 0.1/min (total cost including LLM, TTS, etc) 

If we assume the average call duration as 3 min 30 sec 
We gate average cost per call $0.35


$30/0.35 = 85.71 calls of 3 mins 30 second each
[06/03/26, 10:20:52 PM] Chitraksh: That should be sufficient for initial views
[07/03/26, 2:46:03 AM] Frankie Alicea: Thank you for this update. Amazing news brother.
[07/03/26, 2:47:25 AM] Frankie Alicea: I will also send another $100-$150 on next Friday so we have a small surplus as a safety net.
[07/03/26, 2:48:21 AM] Frankie Alicea: Thank you as well for the breakdown + clarity, I agree, thats sufficient.
[07/03/26, 2:49:03 AM] Frankie Alicea: When will we remove it so we can test it to make sure before we show anyone? I dont even want Greg seeing it. ‎<This message was edited>
[07/03/26, 4:01:01 PM] Chitraksh: Okay I’ll get the n8n, 
we can have the twillio ($15), perplexity ($9) and $10 reserves from the next payment that gives us - 34
[07/03/26, 4:01:23 PM] Chitraksh: That is the approx cost of n8n with taxes in monthly billing
[07/03/26, 4:03:13 PM] Chitraksh: But make sure you show it to a lot of people as then only buying this makes sense, the most headache to reset again is retell that is why as soon as I read your mail and make another agent with that philosophy and a sample agent, we will start having funded accounts to make sure we don’t have to reset it everything meaning it works every time with all tools every time we give it a call
[07/03/26, 4:04:06 PM] Chitraksh: N8n is very easy to migrate I click less than 30 time to set up everything and connect it to retell, but retell itself is very hard to reset
[07/03/26, 10:31:13 PM] Frankie Alicea: ‎Missed voice call, ‎Tap to call back
[07/03/26, 10:31:28 PM] Frankie Alicea: ‎Voice call, ‎1 min
[07/03/26, 10:36:31 PM] Frankie Alicea: ‎Voice call, ‎1 min
[07/03/26, 11:06:40 PM] Frankie Alicea: https://meet.google.com/qmu-pbzo-ymc
[07/03/26, 11:06:50 PM] Frankie Alicea: I am ready brother
[07/03/26, 11:10:15 PM] Chitraksh: Coming in 2 mins bro
[07/03/26, 11:10:59 PM] Frankie Alicea: yessir
[08/03/26, 12:08:47 AM] Chitraksh: +1 (925) 940-1432
[08/03/26, 2:24:12 AM] Frankie Alicea: Can you send me those 2 emails or 2 documents for the Oraya X AutoNation pilot (legal docs) so I cN show Greg without losing time digging for it. Pls and thank you brother.
[08/03/26, 2:24:34 AM] Frankie Alicea: Just talked with Greg we are good to go meeting shortly
[08/03/26, 2:26:19 AM] Chitraksh: Okay
‎[08/03/26, 2:51:32 AM] Chitraksh: Dealership Report Client Version - Mercedes of South Bay.docx ‎<attached: 00000040-Dealership Report Client Version - Mercedes of South Bay.docx>
[08/03/26, 2:51:42 AM] Chitraksh: Here you go brother
[08/03/26, 3:23:21 AM] Frankie Alicea: Perfect now pls send over the link for outbound here so I can pin it in this chat
[08/03/26, 3:23:59 AM] Frankie Alicea: Arriving to destination in the next 15 mins
[08/03/26, 3:24:02 AM] Frankie Alicea: 🙏🏻
[08/03/26, 3:24:16 AM] Chitraksh: Sure
[08/03/26, 3:25:07 AM] Chitraksh: https://chitraksh3.app.n8n.cloud/form/a8835a31-99e0-4d68-ab44-4b2df49ecb02
[08/03/26, 3:46:10 AM] Frankie Alicea: Perfect
[08/03/26, 3:46:16 AM] Frankie Alicea: We are sooo cooking bro
[08/03/26, 3:46:19 AM] Frankie Alicea: 🍳
[08/03/26, 3:46:25 AM] Frankie Alicea: 👨‍🍳
[08/03/26, 4:02:28 AM] Chitraksh: Yes sir
[08/03/26, 4:10:28 AM] Frankie Alicea: ‎Silenced voice call, ‎Focus mode
[08/03/26, 4:10:41 AM] Frankie Alicea: Brother
[08/03/26, 4:10:47 AM] Frankie Alicea: Are u available
[08/03/26, 4:10:49 AM] Frankie Alicea: Im with Greg
[08/03/26, 4:10:55 AM] Frankie Alicea: I need you
[08/03/26, 5:03:23 AM] Frankie Alicea: No worries
[08/03/26, 5:03:58 AM] Frankie Alicea: We are gonna connect again tonight at 8pm and I hope you can attend the gmeet but if not I understand and we can reschedule the initial meet + greet
[08/03/26, 7:11:49 AM] Chitraksh: Bro I am so sorry
[08/03/26, 7:12:27 AM] Chitraksh: I waited, but slept accidentally it was 4am ‎<This message was edited>
[08/03/26, 7:20:55 AM] Chitraksh: ‎Voice call, ‎No answer
[08/03/26, 7:22:05 AM] Chitraksh: I have removed the sleep mode please call me 30 mins before the meet this time I’ll make sure to be there
[08/03/26, 9:29:35 AM] Frankie Alicea: No worries lets do tomorrow instead
[08/03/26, 9:29:44 AM] Frankie Alicea: Get some rest
[08/03/26, 9:30:25 AM] Frankie Alicea: We are great!
[08/03/26, 9:30:31 AM] Frankie Alicea: Greg's on board!
[08/03/26, 9:30:34 AM] Frankie Alicea: See you tomorrow
[08/03/26, 9:30:40 AM] Frankie Alicea: Ping me in the morning brother
[08/03/26, 10:17:57 AM] Chitraksh: Okay. Brother
[08/03/26, 10:18:01 AM] Chitraksh: Sounds good
[08/03/26, 10:18:15 AM] Chitraksh: Great news bro
[08/03/26, 10:18:20 AM] Chitraksh: Let’s go!!! ‎<This message was edited>
[08/03/26, 10:18:49 AM] Chitraksh: 🔥🔥🫟🤖🤖
[08/03/26, 10:26:56 AM] Chitraksh: ‎Voice call, ‎No answer
[08/03/26, 10:38:35 AM] Frankie Alicea: ‎Voice call, ‎14 min
[08/03/26, 1:35:20 PM] Chitraksh: 12pm Pst works for me best bro
[08/03/26, 1:35:46 PM] Chitraksh: If for someone reason you or Greg are busy I don’t mind 1 or 2pm as well
[08/03/26, 10:06:58 PM] Frankie Alicea: Ok let me lock it in right now bro
[08/03/26, 10:27:27 PM] Chitraksh: Okay bro
[08/03/26, 10:27:31 PM] Chitraksh: At 12?
[08/03/26, 10:39:03 PM] Frankie Alicea: Waiting on Greg to reply to lock in a time out of the times 12 / 1 / 2
[08/03/26, 11:09:22 PM] Frankie Alicea: Bro hasn't replied yet
[08/03/26, 11:09:26 PM] Frankie Alicea: Ill keep you posted
‎[08/03/26, 11:28:41 PM] Frankie Alicea: ‎<attached: 00000084-PHOTO-2026-03-08-23-28-41.jpg>
[08/03/26, 11:28:46 PM] Frankie Alicea: Current update
[08/03/26, 11:29:16 PM] Frankie Alicea: His fiance family flew in today and we are postponing until further notice for later today.
[08/03/26, 11:29:28 PM] Frankie Alicea: Get some rest brother I will ping u later
[09/03/26, 12:33:12 AM] Frankie Alicea: Lets lock in 8pm tomorrow brother
[09/03/26, 12:33:17 AM] Frankie Alicea: Can you make that work?
[09/03/26, 12:33:24 AM] Frankie Alicea: Me and Greg just locked it in rn
[09/03/26, 12:33:45 AM] Frankie Alicea: If you can make that, that would be perfect. So we can move to the next step.
[09/03/26, 12:33:53 AM] Frankie Alicea: Engage AutoNation
[09/03/26, 12:36:56 AM] Chitraksh: Okay bro
‎[09/03/26, 4:46:08 AM] Frankie Alicea: ‎<attached: 00000094-VIDEO-2026-03-09-04-46-08.mp4>
‎[09/03/26, 4:46:24 AM] Frankie Alicea: ‎video omitted
‎[09/03/26, 7:17:21 AM] Frankie Alicea: Blessings brother. Many blessings. Lets leverage it when we're ready. $1,000 on ads is huge. $500 on google ain't shit but $500 on linkedin has to be worth $5K-10K in selling our system bro. Lets lock this in when we can. ‎<attached: 00000096-PHOTO-2026-03-09-07-17-21.jpg>
‎[09/03/26, 7:17:23 AM] Frankie Alicea: Blessings brother. Many blessings. Lets leverage it when we're ready. $1,000 on ads is huge. $500 on google ain't shit but $500 on linkedin has to be worth $5K-10K in selling our system bro. Lets lock this in when we can. ‎<attached: 00000097-PHOTO-2026-03-09-07-17-23.jpg>
[09/03/26, 10:56:39 AM] Chitraksh: Bro I fucked up bad yesterday
[09/03/26, 10:59:43 AM] Chitraksh: I had one beer and just went out for a little spin near by, little did I know they started having breathalyser test there. Got my car seized yesterday night gotta pay $150 to get it released. Can I borrow that from you I’ll pay back because I can’t ask my family money for drunk and drive
[09/03/26, 12:55:40 PM] Chitraksh: I checked bro it did not show for me or maybe I was late
[09/03/26, 12:56:35 PM] Chitraksh: Do you wanna start running ad’s first for oraya or the insurance
[09/03/26, 12:56:52 PM] Chitraksh: We can create multiple accounts and have 2-3k in ads
[09/03/26, 1:23:57 PM] Chitraksh: If you have any logo for Oraya please send it or trying making up in Gemini (create image nano banana pro)
[09/03/26, 5:24:33 PM] Frankie Alicea: Bro im so happy youre okay and youre safe brother
[09/03/26, 5:24:55 PM] Frankie Alicea: Lets figure this out later so we can fix this
[09/03/26, 5:25:04 PM] Frankie Alicea: That should be fine brother
[09/03/26, 5:25:35 PM] Frankie Alicea: Just be careful and uber next time bro dont jeopardize your life and freedom brothet
[09/03/26, 5:25:50 PM] Frankie Alicea: 🙏🏻
[09/03/26, 6:54:11 PM] Chitraksh: Thankyou so much brother, I was not very drunk was it was a dumb move I realised it the hard way
[09/03/26, 6:54:45 PM] Chitraksh: I am working one the next iteration based on your mails and Oraya website
[09/03/26, 6:55:06 PM] Chitraksh: Can’t wait to show you
[09/03/26, 9:37:55 PM] Frankie Alicea: Good brother. Trust me, most of my life i have made horrible decisions. They will ruin your life if you continue to make those type of mistakes.
[09/03/26, 9:37:56 PM] Frankie Alicea: Be safe
[09/03/26, 9:44:10 PM] Chitraksh: Yes brother, thankyou
[09/03/26, 9:44:49 PM] Chitraksh: I know you genuinely want good for me that’s why you even put the effort of saying all this
[09/03/26, 9:46:07 PM] Chitraksh: I just realised 8pm will be 8:30am here I would be in college tomorrow, I thought of skipping but I have to go tomorrow
[09/03/26, 9:46:55 PM] Chitraksh: Do you think we can maybe shift it 10 if Greg and you are comfortable I am genuinely sorry for the confusion
[09/03/26, 9:47:13 PM] Chitraksh: Or like 5pm that would be early morning that also works for me
[09/03/26, 10:54:04 PM] Frankie Alicea: 💯
[09/03/26, 10:54:29 PM] Frankie Alicea: Don't skip
[09/03/26, 10:54:38 PM] Frankie Alicea: Lets do this instead
[09/03/26, 10:55:06 PM] Frankie Alicea: We need to make sure these meetings are convenient for you as well brother, without sacrificing your sleep or education.
[09/03/26, 10:55:29 PM] Frankie Alicea: Look at your schedule and give me 3 different times that work this week and we will make it work for you me and Greg's schedule
[09/03/26, 10:55:40 PM] Frankie Alicea: Everyone here is equally important including you
[09/03/26, 10:55:46 PM] Frankie Alicea: Lmk and we will make it happen
[09/03/26, 10:56:01 PM] Frankie Alicea: Don't worry
[09/03/26, 10:56:16 PM] Frankie Alicea: Let me look shortly and I will ping u brother
[09/03/26, 11:00:11 PM] Chitraksh: Sure let me know thanks for understanding
[09/03/26, 11:01:33 PM] Chitraksh: In the morning I can do anytime before 12 noon
[09/03/26, 11:02:11 PM] Chitraksh: And in the night anytime after 10
[09/03/26, 11:02:50 PM] Chitraksh: That goes throughout the month I can obviously make space in night for special meetings like greg art or someone else
[10/03/26, 2:14:29 AM] Frankie Alicea: Of course brother. Always.
[10/03/26, 2:14:51 AM] Frankie Alicea: Perfect I will circle back broski.
[10/03/26, 4:18:58 AM] Frankie Alicea: So does 10pm work? Tonight or tomorrow? Can we do either one of those times?
[10/03/26, 5:05:47 AM] Frankie Alicea: For an enterprise AI automation company like Oraya AI, your Terms Acceptance page should not look like a basic legal checkbox page. It should look like enterprise-grade compliance infrastructure — similar to onboarding flows used by companies like Stripe, Salesforce, or DocuSign.

The goal is three things simultaneously:

1. Legal enforceability


2. Frictionless enterprise UX


3. Audit trail for dispute protection



Think of it as a Contract Acceptance Gateway before users access the platform.


---

Oraya AI — Terms Acceptance Gateway (Enterprise Design)

Page Purpose

Before accessing the Oraya AI platform, users must:

• Review terms
• Explicitly agree to billing & arbitration policies
• Digitally acknowledge legally binding terms

Once accepted, the system:

• Stores a legal acceptance record • Logs IP address + timestamp • Stores user identity • Unlocks platform access

This protects you against:

• Refund disputes
• Chargebacks
• Legal claims
• Contract ambiguity


---

Page Layout (Silicon Valley Standard)

Header

Oraya AI Enterprise Automation Platform

Subheading:

"Before accessing the Oraya platform, please review and accept our service terms."

Minimalist design.

White background.
Dark text.
Enterprise typography.


---

Section 1 — Quick Summary (Human Readable)

Users rarely read legal pages.

Give them a simple 6-point summary first.

Key Terms Overview

By accessing Oraya AI you agree that:

1. Oraya AI provides AI automation and enterprise workflow infrastructure


2. All subscriptions are non-refundable


3. Payments are recurring unless cancelled


4. Service disputes must be resolved via binding arbitration


5. Oraya AI may update platform features over time


6. Platform misuse may result in account termination



Then:

Button:

"Read Full Terms"

Expandable.


---

Section 2 — Full Legal Terms

Scrollable container.

Important for enforceability.

Users must scroll through before accepting.

Key sections include:


---

1. Service Description

Oraya AI provides enterprise software for:

• AI workflow automation
• telephony orchestration
• CRM integrations
• AI agents
• operational automation

Services are provided as a software platform.


---

2. Subscription Billing

Users agree that:

• Services are billed monthly or annually
• Payments are automatically recurring
• Payment methods may be charged automatically
• Failure to pay may result in account suspension


---

3. No Refund Policy

All payments are final and non-refundable.

Including:

• setup fees
• subscription fees
• implementation fees
• custom automation work

Because services involve:

• engineering resources
• infrastructure provisioning
• AI training


---

4. Arbitration Agreement

All disputes must be resolved through binding arbitration.

No:

• class actions
• jury trials

Arbitration location:

California.


---

5. Limitation of Liability

Oraya AI is not liable for:

• business losses
• lost revenue
• indirect damages
• third-party integrations

Liability capped at fees paid in the last 90 days.


---

6. Acceptable Use Policy

Users may not use the platform for:

• illegal activity
• spam campaigns
• harassment
• fraud
• deceptive marketing

Violation may result in immediate termination.


---

7. Platform Updates

Oraya AI may:

• modify features
• improve infrastructure
• update pricing or capabilities

Users will be notified when material changes occur.


---

8. Data Processing

Users agree that Oraya AI may process data necessary to operate the platform.

Includes:

• CRM data
• call recordings
• automation logs

Data is handled under strict privacy standards.


---

9. Intellectual Property

All Oraya AI software, models, workflows, and automation systems remain the exclusive intellectual property of Oraya Corporation.

Customers receive a limited license to use the platform.


---

10. Termination

Accounts may be terminated for:

• violation of terms
• non-payment
• abuse of infrastructure

Termination does not void outstanding fees.


---

11. Governing Law

These terms are governed by the laws of the State of California.


---

Section 3 — Mandatory Legal Consent

After the scrollable terms:

Checkbox 1

"I have read and agree to the Oraya AI Terms of Service"

Required.


---

Checkbox 2

"I agree that all payments are non-refundable"

Required.


---

Checkbox 3

"I agree to binding arbitration for dispute resolution"

Required.


---

Checkbox 4

"I understand that Oraya AI is a software platform and outcomes are not guaranteed"

Required.


---

Section 4 — Digital Signature

Enterprise-grade protection.

Fields:

Full Name

Company Name

Email

Title

Then:

Checkbox:

"I confirm I am authorized to accept these terms on behalf of my organization."


---

Section 5 — Acceptance Button

Large enterprise button:

Accept Terms and Continue

When clicked:

System logs:

• timestamp
• IP address
• browser fingerprint
• email
• signature

Stored in database.


---

Backend Compliance Logging

Store:

user_id
full_name
company
email
ip_address
timestamp
terms_version
signature_hash
accepted = true

This creates legal proof of acceptance.

Used if disputes arise.


---

UX Behavior

User cannot continue until:

• all boxes checked
• signature filled
• scroll completed

Then unlocks:

Dashboard
Signup flow
Or platform access.


---

Page Design Inspiration

Model it visually after enterprise onboarding pages used by:

Stripe

Notion

DocuSign

OpenAI


Minimal.

Corporate.

High trust.


---

Extra 200 IQ Protection

Add this clause:

Chargeback Protection Clause

Users agree they will not initiate chargebacks without first contacting Oraya AI to resolve the dispute.

Violation may result in:

• collections
• legal recovery of fees


---

Next-Level Silicon Valley Move

Instead of static terms:

Create:

Versioned Legal Framework

Terms v1.0
Terms v1.1
Terms v2.0

Every acceptance is stored with the version.


---

Final UX Flow

1. Visitor enters website


2. Clicks Get Started


3. Terms Acceptance Page appears


4. User signs


5. System logs acceptance


6. Platform unlocks



This is how enterprise SaaS protects itself.


---

If you'd like, I can also give you:

1️⃣ The FULL legally written Terms document ready for lawyers
2️⃣ The React / Next.js code for the page
3️⃣ The database schema for storing acceptance records
4️⃣ The Stripe billing clause that prevents chargebacks

All designed specifically for Oraya AI.
[10/03/26, 5:05:55 AM] Frankie Alicea: Bro this is fucking HEAT
[10/03/26, 5:05:57 AM] Frankie Alicea: 🔥
[10/03/26, 5:06:17 AM] Frankie Alicea: Read the whole document
[10/03/26, 8:46:55 AM] Chitraksh: Yes it does
[10/03/26, 8:52:57 AM] Frankie Alicea: Ok let me arrange it with Greg, its easy for u and I. But getting a 3rd schedule time window is more difficult but I will reach out once I lock him down.
[10/03/26, 9:03:06 AM] Chitraksh: I get that bro let me know whatever time suits you I’ll be back in 1 hr 30min
[10/03/26, 9:03:18 AM] Chitraksh: Then I am free the whole night till next day let me know what suits him and you best ‎<This message was edited>
[10/03/26, 9:11:59 AM] Chitraksh: Again sorry for the confusion I know it’s hard to get hold of him and this is the 3rd reschedule for the 1st meeting 😭
[10/03/26, 9:12:53 AM] Chitraksh: You guys decide a time as I am available anytime for the next 36 hours tomorrow re quiz and group discussions are there in college which I already gave ‎<This message was edited>
[10/03/26, 6:10:22 PM] Frankie Alicea: Bro thats not your fault tho lmao that is a combination of hesitation, uncertainty, and being reluctant on his end, also and not being able to make quick decisions. All his things and his issues. Nothing to do with us, but because I love the guy and extremely valuable ill put up with it for a while until we cant anymore and then we draw the line in the sand. But for now, we accept it, and leverage it to land accounts.
[10/03/26, 6:10:43 PM] Frankie Alicea: Ill have an update this morning broski
[10/03/26, 6:15:34 PM] Chitraksh: Done brother looking forward
[10/03/26, 6:15:48 PM] Chitraksh: Have a great day
[10/03/26, 9:21:31 PM] Frankie Alicea: Thank u brother you have a great night
[10/03/26, 9:29:08 PM] Frankie Alicea: Greg's out
[10/03/26, 9:29:15 PM] Frankie Alicea: We're doing it without him
[10/03/26, 9:29:29 PM] Frankie Alicea: Im calling Shawn Khalid today
[10/03/26, 9:57:33 PM] Chitraksh: Okay brother no worries
[10/03/26, 9:57:45 PM] Chitraksh: I have set up the entire reminder workflow too
[10/03/26, 9:58:28 PM] Chitraksh: Everything is working well let me know when you show plan to show it to him
[10/03/26, 9:59:19 PM] Frankie Alicea: Perfect call you later broski
[10/03/26, 9:59:41 PM] Chitraksh: Sure bro
[11/03/26, 1:17:23 AM] Frankie Alicea: 📢 Emergency meeting today brother ⚠️
[11/03/26, 2:10:40 AM] Chitraksh: What time?
[11/03/26, 2:12:42 AM] Frankie Alicea: We could possibly avoid a full meeting if we can talk for a couple mins on WhatsApp
[11/03/26, 2:13:31 AM] Chitraksh: I’m good with anything
[11/03/26, 2:13:34 AM] Chitraksh: What’s up
[11/03/26, 2:18:23 AM] Frankie Alicea: ‎Silenced voice call, ‎Focus mode
[11/03/26, 2:18:29 AM] Frankie Alicea: ‎Voice call, ‎18 min
‎[11/03/26, 6:46:29 AM] Frankie Alicea: Thats crazy bro, look where we're at. We're at re entry right now ‎<attached: 00000165-PHOTO-2026-03-11-06-46-29.jpg>
[11/03/26, 9:30:03 AM] Chitraksh: Yes sir
[11/03/26, 9:30:24 AM] Chitraksh: Moving on to 6
[11/03/26, 9:31:09 AM] Frankie Alicea: 100% bro
[11/03/26, 11:28:54 AM] Frankie Alicea: ‎Missed video call, ‎Tap to call back
[11/03/26, 11:33:51 AM] Frankie Alicea: up?
[11/03/26, 11:35:47 AM] Frankie Alicea: trying to get u in godaddy
[11/03/26, 11:35:51 AM] Frankie Alicea: u already have access
[11/03/26, 11:35:57 AM] Frankie Alicea: try to reset password
[11/03/26, 11:36:19 AM] Frankie Alicea: it doesnt give me an option to change or reset your password
[11/03/26, 11:36:36 AM] Frankie Alicea: im going to sleep now brother its 11pm i have to be up at 430am
[11/03/26, 11:36:39 AM] Frankie Alicea: talk tomorrow
[11/03/26, 11:42:12 AM] Chitraksh: No problem brothers
[11/03/26, 11:42:17 AM] Chitraksh: We’ll do it in the morning
[11/03/26, 11:42:41 AM] Chitraksh: Anyways I have to push the codes to GitHub first so that will take some time before I can connect domain
[11/03/26, 11:52:25 AM] Frankie Alicea: Ok gn brother
[11/03/26, 6:24:30 PM] Chitraksh: Good morning
[11/03/26, 6:24:47 PM] Chitraksh: Let me know your thoughts
[11/03/26, 6:24:49 PM] Chitraksh: https://oraya-ai-h485.vercel.app/
[11/03/26, 6:24:58 PM] Chitraksh: I want you to see it on a PC first ‎<This message was edited>
[11/03/26, 7:43:07 PM] Frankie Alicea: Ok so i won't click the link yet lol 😂
[11/03/26, 7:43:12 PM] Frankie Alicea: Good morning brother
[11/03/26, 9:07:12 PM] Frankie Alicea: ‎Voice call, ‎12 min
[12/03/26, 1:56:39 AM] Frankie Alicea: ‎Silenced voice call, ‎Focus mode
[12/03/26, 1:56:45 AM] Frankie Alicea: ‎Missed voice call, ‎Tap to call back
[12/03/26, 1:57:12 AM] Frankie Alicea: Sorry if I bothered your sleep
[12/03/26, 1:57:23 AM] Frankie Alicea: I came home and I could get you into Twilio
[12/03/26, 1:57:39 AM] Frankie Alicea: If not no worries we can do it later today when I come back
[12/03/26, 9:08:53 AM] Chitraksh: No problem brother I slept it was 2 am
[12/03/26, 9:20:25 AM] Frankie Alicea: 😂 dam my bad bro
[12/03/26, 9:20:39 AM] Frankie Alicea: I could do it now if u have time
[12/03/26, 9:20:47 AM] Chitraksh: Can you check your mail
[12/03/26, 9:20:55 AM] Chitraksh: Bro I need the godaddy
[12/03/26, 9:20:58 AM] Chitraksh: Not the twillio
[12/03/26, 9:21:03 AM] Chitraksh: I already have the twillio
[12/03/26, 9:21:13 AM] Frankie Alicea: Oh yeah
[12/03/26, 9:21:34 AM] Frankie Alicea: Nothing bro
[12/03/26, 9:21:36 AM] Frankie Alicea: No email
[12/03/26, 9:22:07 AM] Chitraksh: I have shared a notebook access, listen to the audio whenever you get time I have done a deep research on what all will be required and made a podcast off that research it is like 40mins you can listen to it whenvever you get time
[12/03/26, 9:22:10 AM] Chitraksh: Sending again
[12/03/26, 9:23:02 AM] Frankie Alicea: Bro i wanna hear it
[12/03/26, 9:24:18 AM] Chitraksh: This is the study tool I use
[12/03/26, 9:24:19 AM] Chitraksh: https://notebooklm.google.com/notebook/f60484a1-2679-4b23-af19-01f8638eddfe
[12/03/26, 9:24:45 AM] Chitraksh: It has a video, slides, mind maps audio everything already made
[12/03/26, 9:24:52 AM] Chitraksh: Watch then as you get time
[12/03/26, 9:25:06 AM] Frankie Alicea: Watch this link?
[12/03/26, 9:25:18 AM] Frankie Alicea: Ok let me go look now
[12/03/26, 9:27:38 AM] Frankie Alicea: ‎Voice call, ‎9 sec
[12/03/26, 9:27:58 AM] Frankie Alicea: So sorry
[12/03/26, 9:28:14 AM] Frankie Alicea: I just called to say its really good bro
[12/03/26, 9:28:17 AM] Chitraksh: No problem you didn’t know
[12/03/26, 9:28:19 AM] Frankie Alicea: 🔥
[12/03/26, 9:28:29 AM] Frankie Alicea: Ok ima go back to listen
[12/03/26, 9:28:33 AM] Chitraksh: Yes sir
[12/03/26, 9:28:38 AM] Chitraksh: Look at the mind map too
[12/03/26, 9:28:48 AM] Frankie Alicea: I will look at everything bro
[12/03/26, 9:29:01 AM] Frankie Alicea: Ping me when you are finished to see if I am awake or asleep
[12/03/26, 9:31:14 AM] Chitraksh: Okay sure bro
[12/03/26, 9:32:44 AM] Chitraksh: ‎Voice call, ‎3 min
[12/03/26, 11:12:12 AM] Frankie Alicea: Bro this so so good brother
[12/03/26, 11:12:24 AM] Frankie Alicea: Im almost done with all of them
[12/03/26, 11:12:38 AM] Frankie Alicea: Amazing
[12/03/26, 11:12:44 AM] Frankie Alicea: 🚀
[12/03/26, 11:13:33 AM] Frankie Alicea: Gonna read the enterprise partnership architecture now
[12/03/26, 12:06:02 PM] Chitraksh: Yes sir
[12/03/26, 12:07:04 PM] Chitraksh: I think in our mail we should mention post pilot we will be providing all the major documents and prepare the most important ones like sample SLA, legal and other important documents pre pilot ‎<This message was edited>
[12/03/26, 12:07:52 PM] Chitraksh: If we addressed everything in our mail on our own that will build trust because they don’t have to teach us now we already addressed it and and agreed to present everything post pilot
[12/03/26, 12:09:16 PM] Chitraksh: Because sooner or later they are gonna ask everything or most of it
[12/03/26, 12:21:54 PM] Frankie Alicea: Driving i will read shortly
[13/03/26, 12:12:21 AM] Frankie Alicea: ‎Silenced voice call, ‎Focus mode
[13/03/26, 12:12:36 AM] Frankie Alicea: Call me after class
[13/03/26, 12:12:41 AM] Chitraksh: ‎Voice call, ‎1 hr
[13/03/26, 12:12:46 AM] Frankie Alicea: Everything looks amazing bro
[13/03/26, 12:12:48 AM] Frankie Alicea: 🔥
[13/03/26, 1:23:45 AM] Frankie Alicea: Bro that was a dope meeting
[13/03/26, 1:23:46 AM] Frankie Alicea: 🔥
[13/03/26, 1:25:12 AM] Chitraksh: Call cost - 💲 0.1 per Min
Average Duration - 3min 30secs

Average Call cost - 💲 0.35

Assuming 1000 calls per month (both inbound and outbound)

1000 x 3.5 = 3,500 Minutes 

3,500 x 0.1 = 💵 350 per month

We pay 100-150 at max including Twillio Supabase N8N etc

Total estimated cost for 3500 mins per month for us would look like 400-500 dollar a month at max
[13/03/26, 1:25:48 AM] Chitraksh: I’m I am being honest 3,500 mins a month sounds too generous for a 997 package
[13/03/26, 1:27:41 AM] Chitraksh: But since sales and service are in same system 3,500 minutes (1000 calls) for sales and service looks very very good now because the cost is 💵 500 fixed and revenue is 2k
[13/03/26, 1:28:40 AM] Chitraksh: We should research the market standing of other voice ai companies how much calls/mins they offering for how much price ‎<This message was edited>
[13/03/26, 1:31:24 AM] Chitraksh: Yes sir
[13/03/26, 1:32:42 AM] Chitraksh: I also gonna generate a progress report based on our meeting transcripts I have everything transcript for the last month or so I guess, I need your transcripts as well so that I can combine those with money to create a progress report and vision plan for us to follow
[13/03/26, 2:28:35 AM] Frankie Alicea: I will read all of your messages shortly and respond. 

I did read your first message and i have been wanting to talk to you about pricing and our offer for a few days so im happy we had this come up today.

Lets address this and lock in pricing.

Ive done some deep research and once we control the plane (control the data + their entire stack) $7000-$11,000 per month per location 

Lets build up to that once we takeover entire dms but for now raise our pricing to base $3K-4K or something like that, maybe even 5K, who knows, we will figure it out on our meeting.

For now we can agree we need to charge more and research how to price and position ourselves and lock in the offer / package / features / copy for the offer / mins per package etc

We're doing the hard work brother
[13/03/26, 8:04:11 AM] Frankie Alicea: Im doing a deep research rn brother ill keep you posted when I am finished
[13/03/26, 8:04:36 AM] Frankie Alicea: Incredible
‎[13/03/26, 8:04:48 AM] Frankie Alicea: ‎<attached: 00000250-GIF-2026-03-13-08-04-48.mp4>
[13/03/26, 10:11:32 AM] Frankie Alicea: I am home if you wanna do
[13/03/26, 10:11:50 AM] Frankie Alicea: godaddy rn
[13/03/26, 10:13:09 AM] Frankie Alicea: OUR WEBSITE IS SOOOOOO FIRE BROO
[13/03/26, 10:13:25 AM] Frankie Alicea: 🔥🔥🔥🔥🔥🔥🔥
[13/03/26, 10:47:00 AM] Chitraksh: Not it is optimised for phone tablets and pc ‎<This message was edited>
[13/03/26, 10:47:09 AM] Chitraksh: Now*
[13/03/26, 10:47:10 AM] Frankie Alicea: All 3?
[13/03/26, 10:47:12 AM] Frankie Alicea: Bet!
[13/03/26, 10:47:43 AM] Chitraksh: Yes the orb will not be like too much in phone since the screen are short we just have 1orb for asthetics
[13/03/26, 10:47:54 AM] Frankie Alicea: Can we do video call really quick
[13/03/26, 10:48:10 AM] Frankie Alicea: If yr tired dont worry bro
[13/03/26, 10:48:12 AM] Chitraksh: Yea give me 5mins
[13/03/26, 10:48:15 AM] Frankie Alicea: Ok
[13/03/26, 10:55:51 AM] Chitraksh: https://meet.google.com/foj-hpjw-vwn
[13/03/26, 10:57:38 AM] Chitraksh: you can even join in through phone dosen’t matter
‎[13/03/26, 11:44:57 AM] Chitraksh: ComplianceCollectionBrief.docx ‎<attached: 00000266-ComplianceCollectionBrief.docx>
‎[13/03/26, 11:51:12 AM] Chitraksh: ComplianceCollectionBrief_FIXED.docx ‎<attached: 00000267-ComplianceCollectionBrief_FIXED.docx>
[13/03/26, 11:51:19 AM] Frankie Alicea: The dealership software stack is large, fragmented, and sticky.
Dealers are forced to operate across multiple systems with poor data flow, slow response times, and high operational friction.
Oraya enters through revenue-critical communication workflows, proves ROI fast, then expands into the orchestration layer that consolidates workflow execution across the dealership stack.
Over time, that creates the control plane from which deeper DMS replacement becomes possible
[13/03/26, 11:51:49 AM] Chitraksh: Dealers are forced to operate across multiple systems with poor data flow, slow response times, and high operational friction.
Oraya enters through revenue-critical communication workflows, proves ROI fast, then expands into the orchestration layer that consolidates workflow execution across the dealership stack.
[13/03/26, 12:03:11 PM] Chitraksh: ‎Voice call, ‎No answer
[13/03/26, 12:03:53 PM] Chitraksh: I am a caveman bro
[13/03/26, 12:04:22 PM] Chitraksh: Power cut I am waiting for the backup or main line to come up
[13/03/26, 12:05:11 PM] Chitraksh: ‎Voice call, ‎No answer
[13/03/26, 12:03:46 PM] Frankie Alicea: i left and came back in cus you froze
[13/03/26, 12:03:53 PM] Frankie Alicea: r u coming back in?
[13/03/26, 12:03:58 PM] Frankie Alicea: or can u see me?
[13/03/26, 12:04:10 PM] Frankie Alicea: maybe your phone died?
[13/03/26, 12:04:37 PM] Frankie Alicea: text me or call me in the next few mins and we can continue if not i will sleep i have to be up in a few hours
[13/03/26, 12:04:43 PM] Frankie Alicea: great meeting brother
[13/03/26, 12:04:48 PM] Frankie Alicea: goodnight
[13/03/26, 12:07:38 PM] Chitraksh: Bro I had a poweroutage
[13/03/26, 12:07:43 PM] Chitraksh: still on backup wifi
[13/03/26, 12:08:08 PM] Chitraksh: It is not very stable
[13/03/26, 12:09:00 PM] Frankie Alicea: No worries
[13/03/26, 12:09:16 PM] Frankie Alicea: Be safe and get things settled and get some rest
[13/03/26, 12:09:35 PM] Frankie Alicea: We have a lot of work to do this weekend and im so excited to work on it with you
[13/03/26, 12:09:38 PM] Frankie Alicea: Goodnight brother
[13/03/26, 12:10:12 PM] Chitraksh: Let’s meet tommorow with the master plan and few documents and the domain connected
[13/03/26, 12:10:12 PM] Chitraksh: these 3 things are the agenda for next next
‎[13/03/26, 12:17:41 PM] Frankie Alicea: in my opinion the reply to leads in under a min + Recover missed call etc needs to be way bigger. fire ass features so we highlight them more ‎<attached: 00000290-PHOTO-2026-03-13-12-17-41.jpg>
[13/03/26, 12:17:48 PM] Frankie Alicea: ok i gotta sleep lol
[13/03/26, 12:18:16 PM] Frankie Alicea: caveman co-founder is goated
[13/03/26, 12:18:26 PM] Frankie Alicea: 🐐
[13/03/26, 12:26:48 PM] Chitraksh: 😭😂
[13/03/26, 12:26:54 PM] Chitraksh: Good night brother
[13/03/26, 12:26:57 PM] Chitraksh: Noted
‎[14/03/26, 6:49:35 PM] Chitraksh: ‎<attached: 00000297-PHOTO-2026-03-14-18-49-34.jpg>
[14/03/26, 9:50:31 PM] Chitraksh: Are you up
[15/03/26, 1:16:50 AM] Frankie Alicea: i woke up late i needed to sleep i have been up early and up late. lets work in the evening brother if you can
[15/03/26, 1:16:55 AM] Frankie Alicea: can u?
[15/03/26, 1:19:52 AM] Frankie Alicea: this is absolutely insane and we should offer this and put it on our website and ad a lead magnet, put stripe on our site with our offer and then automate traffic to our funnel. unpaid initially then paid in addition to non paid for multiple channels. this is isane. thx for sharing. wtf bro. lets meet tonight and put in work, 3-6 hours if possible. i'll be refreshed and rested by later. let go.
[15/03/26, 8:35:32 AM] Frankie Alicea: Im up if you want to work
[15/03/26, 8:35:33 AM] Frankie Alicea: Lmk
[15/03/26, 8:35:41 AM] Frankie Alicea: Im up for a few hours brother
[15/03/26, 8:35:48 AM] Frankie Alicea: 🚀
[15/03/26, 8:37:32 AM] Frankie Alicea: If not im available all day and night tomorrow
[15/03/26, 8:37:38 AM] Frankie Alicea: Thats fine too
[15/03/26, 10:55:56 AM] Chitraksh: Hi bro rest well let’s catch up in the morning
[15/03/26, 10:56:06 AM] Chitraksh: The dashboard is ready
[15/03/26, 10:56:37 AM] Chitraksh: And it is insane
[15/03/26, 10:57:11 AM] Chitraksh: I am working on documents to let’s meet morning and address the document budget and dashboard
[15/03/26, 6:36:54 PM] Chitraksh: Orayalabs.ai
[15/03/26, 8:37:49 PM] Frankie Alicea: I am up bro
[15/03/26, 8:37:52 PM] Frankie Alicea: What a day
[15/03/26, 8:39:21 PM] Frankie Alicea: Ok perfect
[15/03/26, 8:39:26 PM] Frankie Alicea: Let me  know brothet
[15/03/26, 8:39:32 PM] Frankie Alicea: Im all day here for us
[15/03/26, 8:39:36 PM] Frankie Alicea: Im gonna shower rn
[15/03/26, 8:42:40 PM] Frankie Alicea: Absolutely fire brother
[15/03/26, 8:42:41 PM] Frankie Alicea: 🔥
[15/03/26, 9:04:36 PM] Chitraksh: Let me know when you’re done let’s do a quick meet
[15/03/26, 9:24:58 PM] Frankie Alicea: send link
[15/03/26, 9:25:04 PM] Frankie Alicea: broski
[15/03/26, 9:27:50 PM] Chitraksh: 10mins
[15/03/26, 9:29:13 PM] Frankie Alicea: bet
[15/03/26, 9:38:32 PM] Chitraksh: https://meet.google.com/knk-qopj-tcz
‎[16/03/26, 12:52:18 AM] Chitraksh: look at the top right, I just uplaoded transcript told it to update dashboard ‎<attached: 00000327-PHOTO-2026-03-16-00-52-18.jpg>
[16/03/26, 12:53:28 AM] Frankie Alicea: Thats crazzzzyyy bro
[16/03/26, 12:53:41 AM] Frankie Alicea: 😮
[16/03/26, 1:00:17 AM] Chitraksh: ‎Voice call, ‎3 min
[16/03/26, 1:05:37 AM] Chitraksh: manifestdestiny247@gmail.com
[16/03/26, 1:05:41 AM] Chitraksh: @Oraya2026
‎[16/03/26, 1:10:10 AM] Chitraksh: Frustration went from 15 to 12 because this was a good meet ‎<attached: 00000333-PHOTO-2026-03-16-01-10-09.jpg>
[16/03/26, 1:52:02 AM] Frankie Alicea: I feel less frustrated after as well bro
[16/03/26, 1:52:24 AM] Frankie Alicea: Data is very telling and we are doing very well in the overall quality of our projects
[16/03/26, 2:05:05 AM] Chitraksh: Yes sir
‎[16/03/26, 9:42:01 PM] Chitraksh: Oraya-AI-Pilot-Offer-Mercedes-South-Bay.pdf • ‎2 pages ‎<attached: 00000337-Oraya-AI-Pilot-Offer-Mercedes-South-Bay.pdf>
[16/03/26, 9:42:28 PM] Chitraksh: Here we go brother
‎[16/03/26, 9:42:54 PM] Chitraksh: Document-B-Compliance-Verification-Report.docx ‎<attached: 00000339-Document-B-Compliance-Verification-Report.docx>
[16/03/26, 10:03:58 PM] Frankie Alicea: Lfg!
[16/03/26, 10:04:07 PM] Frankie Alicea: Text u soon brother
[16/03/26, 10:05:19 PM] Chitraksh: the dashboard is updated read the dashboard as well so that you know how we came up with this document. these are not random ai generated documents a lot went into this
[16/03/26, 10:06:29 PM] Frankie Alicea: Ok i will review it shortly n text back
[17/03/26, 12:39:16 AM] Frankie Alicea: Ok im done i could read now
[17/03/26, 12:39:17 AM] Frankie Alicea: Hold up
[17/03/26, 12:39:35 AM] Frankie Alicea: If ur up lmao
[17/03/26, 12:39:58 AM] Frankie Alicea: ‎Silenced voice call, ‎Focus mode
[17/03/26, 12:40:17 AM] Frankie Alicea: Ok rest brother call me when you wake up
[17/03/26, 12:52:55 AM] Frankie Alicea: Wow, I am in awe. This document is amazing. You're incredible. Onto the next document now.
[17/03/26, 1:28:31 AM] Frankie Alicea: Brother email it my piece of shit phone won't read it.
[17/03/26, 1:29:40 AM] Frankie Alicea: Im gonna go print it soon, so I can read it now. No more procrastinating.
[17/03/26, 1:29:42 AM] Frankie Alicea: 💯
[17/03/26, 1:29:52 AM] Frankie Alicea: Send it asap
‎[17/03/26, 1:30:53 AM] Frankie Alicea: Update on this chargeback. Almost there bro, we're almost cooking. ‎<attached: 00000354-PHOTO-2026-03-17-01-30-53.jpg>
[17/03/26, 1:41:12 AM] Chitraksh: Sorry bro I was out
[17/03/26, 1:41:24 AM] Chitraksh: Sending in one minute both of them
[17/03/26, 1:42:48 AM] Frankie Alicea: No worries bro
[17/03/26, 1:43:01 AM] Frankie Alicea: Don't wake up in the middle of the night bro
[17/03/26, 1:43:06 AM] Frankie Alicea: Just turn off your notifications
[17/03/26, 1:43:13 AM] Frankie Alicea: And do it when u wake up
[17/03/26, 1:47:14 AM] Chitraksh: Sent bro I’m gonna go now meanwhile you can check out the documents there one of them is internal for us you can look that later
[17/03/26, 1:47:22 AM] Chitraksh: Check document B and offer letter
[17/03/26, 1:47:27 AM] Chitraksh: And dashboard
[17/03/26, 1:47:34 AM] Chitraksh: We’ll catch up tomorrow
[17/03/26, 1:47:59 AM] Chitraksh: It was my friend’s birthday just came from his home
[17/03/26, 1:49:51 AM] Frankie Alicea: Be safe brother
[17/03/26, 1:50:24 AM] Chitraksh: Yes sir fully sober
[17/03/26, 1:50:36 AM] Chitraksh: Well not now I smoked a small j
[17/03/26, 1:51:08 AM] Frankie Alicea: Lol just dont drive bro. Call a fucking uber. Be safe.
[17/03/26, 4:49:10 AM] Frankie Alicea: Lets decide which days will be which project next time we meet.
[17/03/26, 4:59:23 AM] Frankie Alicea: I also don't like hubspot just yet so im gonna swap it out for GHL and give you admin access so we can use that account for now to run insurance + oraya pipelines.
[17/03/26, 5:18:37 AM] Frankie Alicea: Eventually We need a map of san jose on our system, with all major dealerships on them (google maps) pins 📌 with name address phone number (so i can optimize for logistics) then we update our system after so it puts notes on each a account etc, demo'd, waiting signature, etc. We're getting close bro, its almost time for me to start cold calling and knocking on doors to businesses. This would be major if we could do it. Doesn't need to be right now
[17/03/26, 9:12:41 AM] Frankie Alicea: i can work for an hour right now if you can. if not im going to sleep brother
[17/03/26, 9:12:50 AM] Frankie Alicea: and we can meet tomorrow
[17/03/26, 10:33:46 AM] Chitraksh: Yes sir
[17/03/26, 10:34:06 AM] Chitraksh: I’ll our chats also in dashboard
[17/03/26, 10:34:21 AM] Chitraksh: So that we don’t miss out
[17/03/26, 10:34:36 AM] Chitraksh: Let’s meet in the morning
[17/03/26, 10:36:04 AM] Chitraksh: I’m leaving for Goa tomorrow night meaning I am available for the next 36hours
[17/03/26, 10:36:38 AM] Chitraksh: I was thinking we should atleast Send the mail and call Khaled before that
[17/03/26, 10:37:19 AM] Chitraksh: Because I am assuming we get to do the demo a few days after the mail has been sent
[17/03/26, 10:38:14 AM] Chitraksh: I’ll be back by 23rd and I will have my laptop there as well
[17/03/26, 10:38:33 AM] Chitraksh: Let me know what do you think I think we are prepared to send the mail
[17/03/26, 4:55:34 PM] Frankie Alicea: and I think we need to discuss offer, mins,package etc before sending.
[17/03/26, 5:42:05 PM] Chitraksh: You’re right bro, let’s not rush it
[17/03/26, 5:42:12 PM] Chitraksh: We have waited for too long
[17/03/26, 5:42:22 PM] Chitraksh: Let’s do it right
[17/03/26, 7:28:47 PM] Frankie Alicea: 🙏🏻
[17/03/26, 7:29:09 PM] Frankie Alicea: 💯
[17/03/26, 7:29:17 PM] Frankie Alicea: 💯
[17/03/26, 7:29:31 PM] Frankie Alicea: 💯
[17/03/26, 10:23:10 PM] Chitraksh: But I want to put a deadline to it right now
[17/03/26, 10:23:17 PM] Chitraksh: I propose we mail on April 2
[17/03/26, 10:23:38 PM] Chitraksh: Gives us a week to heavily scrutinise everything
[17/03/26, 10:24:32 PM] Chitraksh: I want you to be ruthless in things if you we need to address before the mail so that I can correct all, we can agree then send mail maximum by April 2
[17/03/26, 10:25:28 PM] Chitraksh: Provided I correct everything you told and human transfer and everything works which it will
[17/03/26, 10:55:55 PM] Frankie Alicea: Bet
[17/03/26, 10:56:10 PM] Frankie Alicea: And including the mins offer etc in deadline
‎[18/03/26, 1:25:17 AM] Frankie Alicea: Another payment made for our insurance project brother ‎<attached: 00000399-PHOTO-2026-03-18-01-25-17.jpg>
[18/03/26, 2:51:01 AM] Frankie Alicea: 1 chargeback paid 

License renewal paid 

Contracting with insurance carrier initiated 

What's left:

• 1 additional chargeback - $1600

• Marketing retainer + ad budget = $2,500

• Setup CRM - Integrate Oraya + Meta Ads Account ‎<This message was edited>
‎[18/03/26, 5:25:57 AM] Frankie Alicea: ‎<attached: 00000401-PHOTO-2026-03-18-05-25-57.jpg>
[18/03/26, 5:26:01 AM] Frankie Alicea: We're cooking bro
‎[18/03/26, 5:26:37 AM] Frankie Alicea: ‎<attached: 00000403-GIF-2026-03-18-05-26-37.mp4>
[20/03/26, 11:12:03 AM] Chitraksh: Yes sir I will get right back to it Tuesday onwards
[20/03/26, 11:12:26 AM] Chitraksh: So happy bro!
[20/03/26, 11:12:44 AM] Chitraksh: We gotta start stress testing the insurance voice agent
[20/03/26, 11:13:03 AM] Chitraksh: 🔥🔥🔥❤️
[20/03/26, 11:21:22 AM] Frankie Alicea: Yes sir talk soon brother
[20/03/26, 11:21:25 AM] Frankie Alicea: 🙏🏻
[23/03/26, 12:45:24 AM] Frankie Alicea: https://claude.ai/public/artifacts/551f0d7e-18ac-448d-9bd0-c6508d7537af
‎[23/03/26, 1:12:28 AM] Frankie Alicea: ‎<attached: 00000411-GIF-2026-03-23-01-12-28.mp4>
[23/03/26, 3:52:40 PM] Chitraksh: Yes sir
[23/03/26, 3:52:43 PM] Chitraksh: I’m back
[23/03/26, 3:53:46 PM] Chitraksh: I drove like 850-900 miles will rest today from tomorrow we are on
[23/03/26, 4:56:09 PM] Frankie Alicea: All good brother be safe driving
[23/03/26, 6:03:52 PM] Chitraksh: Yes bro
[23/03/26, 6:03:57 PM] Chitraksh: Owner of this page texted me
[23/03/26, 6:04:05 PM] Chitraksh: Says he wants to help us with social media
[23/03/26, 6:04:07 PM] Chitraksh: https://www.instagram.com/memeowcats?igsh=ZmpnMWUyM3p0cWt3
[23/03/26, 6:04:24 PM] Chitraksh: Wanna schedule a short meet with him to see what we got
[23/03/26, 6:26:59 PM] Frankie Alicea: Of course brother lets do it
[23/03/26, 6:28:03 PM] Frankie Alicea: 50K from meming cats is crazy bro
[23/03/26, 6:28:08 PM] Frankie Alicea: What a savage lmao
[23/03/26, 6:28:39 PM] Frankie Alicea: I have a few more updates when we meet brother
[23/03/26, 6:28:45 PM] Frankie Alicea: I have missed you bro
[23/03/26, 6:29:06 PM] Frankie Alicea: This has been the most quiet week I have had work wise with you since we met
[23/03/26, 6:29:15 PM] Frankie Alicea: I was lowkey sad
[23/03/26, 6:29:20 PM] Frankie Alicea: 😔
[23/03/26, 6:29:23 PM] Frankie Alicea: lmao
[23/03/26, 6:29:30 PM] Frankie Alicea: Welcome back brother
[23/03/26, 6:29:32 PM] Frankie Alicea: 🙏🏻
‎[23/03/26, 8:26:44 PM] Frankie Alicea: Wish me luck bro, tried last week. They never answered. They just opened rn. Should have resolved soon. ‎<attached: 00000432-PHOTO-2026-03-23-20-26-44.jpg>
[23/03/26, 8:27:56 PM] Chitraksh: That’s true for me as well bro
[23/03/26, 8:28:07 PM] Chitraksh: We are so back don’t worry
[23/03/26, 8:28:26 PM] Chitraksh: Thankyou bro
[23/03/26, 8:28:56 PM] Chitraksh: Let me do some research on it I’ll update you at night
[23/03/26, 8:29:31 PM] Frankie Alicea: Bet bro
[23/03/26, 8:29:46 PM] Chitraksh: We have a crazy update
[23/03/26, 8:29:58 PM] Chitraksh: Google just launched stitch
[23/03/26, 8:29:57 PM] Frankie Alicea: Good??
[23/03/26, 8:30:16 PM] Chitraksh: It is directly accessible in google ai studio
[23/03/26, 8:30:41 PM] Chitraksh: You can prompt UI/UX in it for our app and website there
[23/03/26, 8:30:49 PM] Frankie Alicea: Dammm
[23/03/26, 8:30:50 PM] Frankie Alicea: Tuff
[23/03/26, 8:30:58 PM] Frankie Alicea: Thats sick bro
[23/03/26, 8:31:00 PM] Chitraksh: And I can directly connect it to your backend systems
[23/03/26, 8:31:03 PM] Frankie Alicea: 🔥
[23/03/26, 8:31:24 PM] Frankie Alicea: Soooooo sick
[23/03/26, 8:31:34 PM] Chitraksh: Let’s make a ios and android app for our custom dashboard for our clients
[23/03/26, 8:31:43 PM] Frankie Alicea: Yesssssssssss
[23/03/26, 8:31:56 PM] Chitraksh: We can add some premium features like a dedicated chatbot on their data and the entire dashboard for them
[23/03/26, 8:32:21 PM] Chitraksh: They can ask how many inbound call with positive sentiment in last 3 days and stuff like that ‎<This message was edited>
[23/03/26, 8:32:27 PM] Frankie Alicea: That's so dope bro
[23/03/26, 8:32:46 PM] Frankie Alicea: Thsts with google stitch?
[23/03/26, 8:33:20 PM] Chitraksh: Stitch is for front end UI /UX
[23/03/26, 8:33:33 PM] Chitraksh: And it can easily be connected to any google ai studio app
[23/03/26, 8:33:37 PM] Chitraksh: Which is our dashboard
[23/03/26, 8:33:47 PM] Frankie Alicea: Got it
[23/03/26, 8:33:49 PM] Chitraksh: And website and other stuff we’ll make
[23/03/26, 8:34:02 PM] Frankie Alicea: Lfg!
[23/03/26, 8:34:07 PM] Chitraksh: Yes sir
[23/03/26, 8:34:46 PM] Frankie Alicea: Bro i been working on Claude all week lol I love it
[23/03/26, 8:35:45 PM] Frankie Alicea: Did u like the lead gen funnel bro?? I think its so sick
[23/03/26, 8:36:09 PM] Chitraksh: Once we get a max subscription we can share the account and in the $200/month we get computing power worth $4000-4500
[23/03/26, 8:36:31 PM] Frankie Alicea: Really??
[23/03/26, 8:36:44 PM] Chitraksh: That is crazy limit to make it do a lot of autonomous tasks we can set a lot of recurring jobs through the day personal business both
[23/03/26, 8:37:41 PM] Chitraksh: Yes bro limits recharge daily people generally don’t use so aggressively so they have budget like this but if fully utilised which we will do it’s worth that
[23/03/26, 8:39:26 PM] Frankie Alicea: Bro Claude is insane I prompted it to the backend and of a funnel and I said to include checkout cart and stripe and bro it did it so fast snd then asked me for my stripe api so it could integrate it lmao wtf bro I didn't have a stripe api but that shit is crazy lmao
[23/03/26, 8:40:18 PM] Chitraksh: Bro in 1-2hr time there will be no CTO
[23/03/26, 8:40:36 PM] Chitraksh: You and me both will be prompting a openclaw and Claude codes
[23/03/26, 8:40:42 PM] Chitraksh: And that will be it
[23/03/26, 8:40:47 PM] Chitraksh: Yr
[23/03/26, 8:40:49 PM] Chitraksh: *
[23/03/26, 8:40:54 PM] Frankie Alicea: Thats craztyyy
[23/03/26, 8:41:03 PM] Frankie Alicea: Insane
[23/03/26, 8:41:09 PM] Frankie Alicea: Literally
[23/03/26, 8:41:34 PM] Frankie Alicea: Meet tomorrow?
[23/03/26, 8:41:46 PM] Chitraksh: Nivida released the data that job range 75k-250k are most in danger
[23/03/26, 8:41:53 PM] Chitraksh: Yes let me know the time
[23/03/26, 8:42:03 PM] Chitraksh: And also for the cat guy
[23/03/26, 8:42:29 PM] Frankie Alicea: Did they release that data this past week or two? Nvidia just had a massive conference here in san jose
[23/03/26, 8:42:40 PM] Chitraksh: Yes
[23/03/26, 8:42:41 PM] Frankie Alicea: Worldwide tech attendees
[23/03/26, 8:42:46 PM] Frankie Alicea: Got it
[23/03/26, 8:43:08 PM] Frankie Alicea: Ok for sure will do
[23/03/26, 8:43:18 PM] Frankie Alicea: Cat guy is such a savage lmao
[23/03/26, 8:43:37 PM] Chitraksh: Less paying jobs are less prone as of now they said but any job involving a pc is 60-70% in danger and that is not a projection
[23/03/26, 8:43:45 PM] Chitraksh: That is current data
[23/03/26, 8:44:29 PM] Frankie Alicea: Holy fuck
[23/03/26, 8:44:51 PM] Frankie Alicea: Thsts not good for most of the economy
[23/03/26, 8:45:08 PM] Frankie Alicea: This is gonna create a huge wealth gap
[23/03/26, 8:45:32 PM] Frankie Alicea: Im just grateful to God we are moving with this tech wave brother
[23/03/26, 8:45:35 PM] Frankie Alicea: 💯
[23/03/26, 8:45:56 PM] Chitraksh: No bro Elon said very very recently like this week, without the world war three economy gonna 10x in few years
[23/03/26, 8:46:08 PM] Chitraksh: Yes bro
[23/03/26, 8:46:25 PM] Frankie Alicea: 10x is so insane
[23/03/26, 8:46:30 PM] Frankie Alicea: Wow
[23/03/26, 8:46:37 PM] Chitraksh: Hard work and experience will pay of let’s do the best we can
[23/03/26, 8:50:47 PM] Frankie Alicea: 💯
[23/03/26, 8:50:51 PM] Frankie Alicea: 🚀
[23/03/26, 9:35:34 PM] Frankie Alicea: https://share.google/9CMcCJTDF2wk8stN9
[23/03/26, 9:35:51 PM] Frankie Alicea: This is the form we need
[23/03/26, 9:36:03 PM] Frankie Alicea: Im gonna print it snd fill oit today
[23/03/26, 9:36:35 PM] Frankie Alicea: I fax it to my government and wait 4 days and we should have our ein in 4-5 days
[23/03/26, 9:37:34 PM] Frankie Alicea: Lets do it together to make sure it is correct before submitting
[23/03/26, 9:38:55 PM] Frankie Alicea: After this we open bank account
[23/03/26, 9:39:31 PM] Frankie Alicea: Then we add you to the s Corp
[23/03/26, 9:39:48 PM] Frankie Alicea: Then we show your passport and add you to the bank account
[23/03/26, 9:39:55 PM] Frankie Alicea: (I think)
[24/03/26, 5:23:10 AM] Frankie Alicea: https://www.reddit.com/r/vibecoding/s/rXHuesdTix
[24/03/26, 5:23:16 AM] Frankie Alicea: Bro what in the fuck
[24/03/26, 5:23:23 AM] Frankie Alicea: 👀👀👀
[24/03/26, 10:43:36 AM] Frankie Alicea: nevermind its hype
[24/03/26, 12:20:02 PM] Chitraksh: Sure bro
[24/03/26, 12:20:31 PM] Chitraksh: I will consult my ca today
[24/03/26, 12:21:44 PM] Chitraksh: That is why I stopped trading bro these AIs are getting better and better so competition rose a lot for retail traders like me
[24/03/26, 12:22:33 PM] Chitraksh: But once we start generating revenue we can spare 3-400 dollars on diff strategies and let a few agents trade on a budget
[24/03/26, 12:22:52 PM] Chitraksh: I’m definitely planning to do that once we have revenue
[24/03/26, 12:23:09 PM] Chitraksh: And from my experience there a high probability of being profitable
[24/03/26, 12:23:34 PM] Chitraksh: Because I have already learnt the hard lessons like leverage Risk reward entry volumes and everything
[24/03/26, 12:23:53 PM] Chitraksh: So I will feed all my experience and trading journal so that it has some data
[24/03/26, 5:02:55 PM] Frankie Alicea: Absolutely savage bro
[24/03/26, 5:02:58 PM] Frankie Alicea: 🔥
[24/03/26, 7:34:15 PM] Frankie Alicea: Bro I never knew you traded
[24/03/26, 7:34:17 PM] Frankie Alicea: Thats so dope
[24/03/26, 7:47:14 PM] Frankie Alicea: Lmk if u can talk for a few seconds
[24/03/26, 7:47:55 PM] Chitraksh: Yes I am free
[24/03/26, 7:47:57 PM] Chitraksh: ‎Voice call, ‎20 min
[24/03/26, 8:40:44 PM] Chitraksh: Bro
[24/03/26, 8:41:00 PM] Chitraksh: Oraya is S corp or C corp?
[24/03/26, 8:45:57 PM] Frankie Alicea: ‎Voice call, ‎4 min
[24/03/26, 9:00:57 PM] Frankie Alicea: Just emailed the lawyer and asked him bro lmao wtf y didn't we think of that lol
[24/03/26, 9:04:06 PM] Chitraksh: ‎Voice call, ‎11 min
[24/03/26, 9:04:21 PM] Chitraksh: It’s a C corp for sure
[24/03/26, 9:31:01 PM] Chitraksh: I sent him the documents he is reviewing it
[24/03/26, 9:34:22 PM] Frankie Alicea: Perfect
[24/03/26, 9:34:26 PM] Frankie Alicea: Keep me posted
[24/03/26, 10:11:55 PM] Chitraksh: Yes sir
[24/03/26, 10:27:11 PM] Frankie Alicea: Do u have a second
[24/03/26, 10:27:36 PM] Chitraksh: Yes bro
[24/03/26, 10:27:40 PM] Chitraksh: ‎Voice call, ‎No answer
[24/03/26, 10:28:30 PM] Frankie Alicea: ‎Voice call, ‎7 min
[24/03/26, 11:09:41 PM] Chitraksh: ‎Voice call, ‎54 sec
[25/03/26, 7:37:58 AM] Frankie Alicea: Any update brother?
[25/03/26, 8:03:40 AM] Chitraksh: Not yet bro
[25/03/26, 8:04:03 AM] Chitraksh: I guess he came late because I didn’t get any call or something
[25/03/26, 8:04:07 AM] Chitraksh: I am in uni
[25/03/26, 8:04:19 AM] Chitraksh: Will get this sorted as soon as I reach home
[25/03/26, 8:04:33 AM] Chitraksh: Will have everything ready in morning
[25/03/26, 8:10:13 AM] Frankie Alicea: No worries
[25/03/26, 8:10:20 AM] Frankie Alicea: Lets catch up tomorrow
[25/03/26, 8:10:27 AM] Frankie Alicea: I can catch up like that every day
[25/03/26, 8:10:31 AM] Frankie Alicea: On the phone
[25/03/26, 8:10:34 AM] Frankie Alicea: Like we did today
[25/03/26, 8:10:42 AM] Chitraksh: Okay bro
[25/03/26, 8:10:44 AM] Frankie Alicea: So we can always put our tasks together
[25/03/26, 8:11:06 AM] Frankie Alicea: Enjoy brother
[25/03/26, 8:11:09 AM] Chitraksh: All this will also be updated on dashboard so no worries
[25/03/26, 8:11:22 AM] Frankie Alicea: Why? You integrated your WhatsApp bro????
[25/03/26, 8:11:25 AM] Chitraksh: Sure bro good night
[25/03/26, 8:11:41 AM] Chitraksh: I can export our chats there
[25/03/26, 8:11:46 AM] Frankie Alicea: 🤣
[25/03/26, 8:11:52 AM] Frankie Alicea: Bro u r so savage
[25/03/26, 8:11:56 AM] Frankie Alicea: I love it
[25/03/26, 8:11:58 AM] Frankie Alicea: 🔥
[25/03/26, 8:12:00 AM] Chitraksh: Soon I will natively integrate everything
[25/03/26, 8:12:08 AM] Frankie Alicea: Perfect!
[25/03/26, 8:12:12 AM] Frankie Alicea: 🙏🏻
[25/03/26, 8:12:27 AM] Frankie Alicea: Go get that law degree lined up broski
[25/03/26, 8:12:32 AM] Frankie Alicea: Talk tomorrow brother
[25/03/26, 8:12:38 AM] Chitraksh: Yes sir
[25/03/26, 8:12:41 AM] Chitraksh: 🙏
[25/03/26, 9:50:01 AM] Frankie Alicea: See the cheapest you can get our docs fixed for with your guy. I know many Indians brother, none of them pay full price.
[25/03/26, 9:50:04 AM] Frankie Alicea: 😂
[25/03/26, 9:50:14 AM] Frankie Alicea: Pls help me not pay full price
[25/03/26, 9:50:29 AM] Chitraksh: Don’t worry I gonna compare it to some other lawyers as well
[25/03/26, 9:50:36 AM] Chitraksh: Getting the best deal is in our genes
[25/03/26, 9:50:39 AM] Frankie Alicea: Perfect bro
[25/03/26, 9:50:56 AM] Chitraksh: Don’t worry about that
[25/03/26, 9:50:56 AM] Frankie Alicea: Exactly lmao
[25/03/26, 9:52:06 AM] Frankie Alicea: Goodnight sir
[25/03/26, 9:52:16 AM] Chitraksh: Good night bro
‎[26/03/26, 12:28:22 PM] Chitraksh: ‎<attached: 00000583-AUDIO-2026-03-26-12-28-21.opus>
[26/03/26, 12:32:41 PM] Chitraksh: Oraya is registered in which county in California? ‎<This message was edited>
[26/03/26, 3:52:41 PM] Chitraksh: Also let’s test human transfer in the morning just a few calls let me know whenever you get 10-15mins
[26/03/26, 3:55:47 PM] Chitraksh: What I found was since we set the human transfer to agentic 2 way transfer (in which admin can talk with the ai before the actual transfer and till then human is on hold with a soft music) 

That needed a separate call transfer ai agent which I didn’t know so for now I have set it cold transfer after 3 attempts directly
[26/03/26, 3:56:02 PM] Chitraksh: It should work in theory let’s test it
[26/03/26, 5:23:25 PM] Frankie Alicea: Alameda I believe, good question. I actually dont know bro. How do we find out? The lawyer did everything
[26/03/26, 5:24:20 PM] Frankie Alicea: Done im good around 8-10am ill shoot a text when im almost ready so we can coordinate
[26/03/26, 5:44:23 PM] Frankie Alicea: Thats wild bro, okay lets test it.
[26/03/26, 6:14:46 PM] Chitraksh: Let me see if the documents give any hints and ask the accountant if required
[26/03/26, 6:16:24 PM] Frankie Alicea: I can email the lawyer and ask if we need. He responds quickly.
[26/03/26, 6:16:32 PM] Frankie Alicea: Matter of fact I have an idea
[26/03/26, 6:16:35 PM] Chitraksh: Let’s do that then
[26/03/26, 6:16:41 PM] Frankie Alicea: Lets have a quick call
[26/03/26, 6:16:47 PM] Frankie Alicea: Do u have a second rn or busy?
[26/03/26, 6:16:52 PM] Frankie Alicea: 2 seconds?
[26/03/26, 6:16:55 PM] Chitraksh: I am fee
[26/03/26, 6:16:57 PM] Chitraksh: ‎Voice call, ‎No answer
[26/03/26, 6:16:58 PM] Frankie Alicea: ‎Voice call, ‎6 min
[26/03/26, 6:30:16 PM] Frankie Alicea: Pls check email brother
[26/03/26, 6:30:29 PM] Chitraksh: Received brother
[26/03/26, 6:31:13 PM] Chitraksh: No investment was done right? Monetarily
[26/03/26, 6:35:50 PM] Frankie Alicea: $5,000 from Greg's brother Jared 


$5,000 from Abdo Melek

It was intended for engineering to build the platform / system 

We were in the process of getting contract for them

It was gonna be a convertible safe note if youre familiar with the term. I think I might have that document. 


However, I am 99% sure he never signed and im 100% sure we never signed or notarized it. 

Let me find the documents  / contract
[26/03/26, 6:36:36 PM] Chitraksh: I understand brother
[26/03/26, 6:36:54 PM] Chitraksh: Let’s look for the document that might cost us a lot later
[26/03/26, 6:41:36 PM] Frankie Alicea: I think its in a different email because i searched mine for 10 mins now I will look again later brother
[26/03/26, 6:49:17 PM] Chitraksh: No problem
[27/03/26, 2:25:25 AM] Frankie Alicea: Wyd broski
[27/03/26, 2:51:00 AM] Frankie Alicea: text me when you get up, lets plan our next meeting
‎[27/03/26, 4:18:37 AM] Frankie Alicea: I need my Gmail connected so we can access that account I believe that's where the agreement is brother. It looks like we need to do what screenshot says so we can activate my Gmail workspace account. Pls take care of this asap so we can move forward with this. Thank you broski ‎<attached: 00000611-PHOTO-2026-03-27-04-18-37.jpg>
[27/03/26, 5:58:28 AM] Chitraksh: Okay brother
[27/03/26, 5:58:41 AM] Frankie Alicea: I know its early there bro dont worry for right now
[27/03/26, 5:58:44 AM] Frankie Alicea: Later brother
[27/03/26, 5:59:04 AM] Chitraksh: Okay no worries
[27/03/26, 5:59:15 AM] Chitraksh: Let me look into it
[27/03/26, 5:59:38 AM] Frankie Alicea: Yesir
[27/03/26, 9:34:02 AM] Chitraksh: Bro the insurance voice agent is ready for initial testing
[27/03/26, 9:34:23 AM] Chitraksh: And it’s good bro
[27/03/26, 9:34:51 AM] Frankie Alicea: Fr?
[27/03/26, 9:34:59 AM] Chitraksh: Yes sir
[27/03/26, 9:35:02 AM] Frankie Alicea: Lfg!
[27/03/26, 9:35:05 AM] Frankie Alicea: 🔥
[27/03/26, 9:35:10 AM] Frankie Alicea: 🐦
[27/03/26, 9:35:18 AM] Frankie Alicea: 🤣
[27/03/26, 9:35:23 AM] Chitraksh: Backend is not connected yet but we are ready to test the voice flow itself
[27/03/26, 9:35:31 AM] Frankie Alicea: Now?
[27/03/26, 9:35:34 AM] Frankie Alicea: Or when?
[27/03/26, 9:35:43 AM] Chitraksh: When are you free?
[27/03/26, 9:35:50 AM] Frankie Alicea: Im always free for u broski
[27/03/26, 9:35:53 AM] Frankie Alicea: Send link
[27/03/26, 9:36:14 AM] Chitraksh: Give me 10mins
[27/03/26, 9:36:17 AM] Frankie Alicea: Yesir
[27/03/26, 9:36:23 AM] Chitraksh: Let me connect to the number and set the meet link
[27/03/26, 9:36:29 AM] Frankie Alicea: Sounds good
[27/03/26, 9:36:43 AM] Chitraksh: Also I need to find a space I am in uni got bored at home
[27/03/26, 9:36:42 AM] Frankie Alicea: No rush im up for a while
[27/03/26, 9:36:51 AM] Frankie Alicea: No worries
[27/03/26, 9:36:53 AM] Chitraksh: Okay bro sounds good
[27/03/26, 9:50:12 AM] Chitraksh: ‎You deleted this message.
[27/03/26, 9:50:13 AM] Chitraksh: ‎You deleted this message.
[27/03/26, 9:50:19 AM] Chitraksh: https://meet.google.com/zcc-juvu-pjp
[27/03/26, 9:50:25 AM] Chitraksh: join this bro
[27/03/26, 9:54:46 AM] Chitraksh: ‎Voice call, ‎19 sec
[27/03/26, 9:55:52 AM] Chitraksh: +19259401432
[27/03/26, 10:57:01 AM] Frankie Alicea: oh i forgot to ask about gmail?
[27/03/26, 10:57:19 AM] Frankie Alicea: MX records
[27/03/26, 10:57:25 AM] Chitraksh: What was the exact mail Frankie@orayalabs.ai?
[27/03/26, 10:57:39 AM] Frankie Alicea: Founder@orayalabs.ai
[27/03/26, 10:57:42 AM] Chitraksh: Got it
[27/03/26, 10:57:49 AM] Chitraksh: Let me look into it
[27/03/26, 10:57:55 AM] Frankie Alicea: bet
[27/03/26, 10:58:01 AM] Chitraksh: Will update you in morning
[27/03/26, 10:58:11 AM] Frankie Alicea: we could change it to frankie@ if we need to. i like founder better tho lmao
[27/03/26, 10:58:20 AM] Chitraksh: The automation mail is very soon brother
[27/03/26, 10:58:27 AM] Chitraksh: Tech wise we are ready
[27/03/26, 10:58:34 AM] Chitraksh: Auto nation*
[27/03/26, 10:58:59 AM] Frankie Alicea: send me the draft so i can review it in its entirety?
[27/03/26, 10:58:59 AM] Chitraksh: Let’s get everything else sorted out
[27/03/26, 10:59:07 AM] Chitraksh: Okay bet
[27/03/26, 10:59:11 AM] Frankie Alicea: or we make it together?
[27/03/26, 10:59:15 AM] Frankie Alicea: either way
[27/03/26, 10:59:21 AM] Chitraksh: Let’s do it together
[27/03/26, 10:59:29 AM] Frankie Alicea: lets review it tomorrow?
[27/03/26, 10:59:37 AM] Chitraksh: We can just discuss the mail and our Claude code will make it itself
[27/03/26, 10:59:46 AM] Chitraksh: On the basis of whatever we discuss
[27/03/26, 10:59:55 AM] Chitraksh: Yes sir
[27/03/26, 11:00:07 AM] Frankie Alicea: hook up whatsapp to our oraya dashboard so it has all of our conversations too right? lmao
[27/03/26, 11:00:08 AM] Chitraksh: I’ll have a base to discuss upon atleast
[27/03/26, 11:00:28 AM] Chitraksh: Yes sir not automatically yet but I am exporting everything
[27/03/26, 11:00:38 AM] Frankie Alicea: got it
[27/03/26, 11:00:44 AM] Frankie Alicea: goodnight brother
[27/03/26, 11:01:02 AM] Chitraksh: Good Night Brother
[27/03/26, 5:47:56 PM] Frankie Alicea: Good morning brother we need to submit form ss4 today if possible please remind me and ensure we make this a top priority today in the event I forget.

 Thank you
[27/03/26, 6:04:00 PM] Frankie Alicea: I want to add a feature:

Our AI insurance agent says at some point

 "since I have you on the line and it only takes a few mins to see if you qualify, can I transfer you to a licensed agent now?"

This alone will increase contact rate, transfer rate, opportunity rate, sit rate, conversion rate etc. And we can obviously track this data and measure the impact and use that data for ourselves as well as a selling point for our clients and prospective clients
[27/03/26, 6:04:41 PM] Frankie Alicea: This will increase appointments and same day sales brother
‎[27/03/26, 6:05:55 PM] Frankie Alicea: ‎<attached: 00000677-GIF-2026-03-27-18-05-55.mp4>
[28/03/26, 12:20:00 AM] Frankie Alicea: Also do we have to share our tech stack with dealerships? What if they try to build our stack once they see it?
[28/03/26, 12:22:23 AM] Frankie Alicea: Also. Are we ready to finalize partnership / LLC? 

So we can finally move forward with 


• EIN
• Founders + Equity Agreement 
• LLC + DOCS
• BANK ACCOUNT 

this will be a massive W when we pull this off. Let all of these items I have mentioned in this chat be the subjects of our next meeting today.
[28/03/26, 12:43:05 AM] Frankie Alicea: And, please kindly remove Greg's name from every mention in our project dashboard at your earliest convenience. I am tired of reading his name everyday. 

Thank you broski 🙏🏻
[28/03/26, 1:19:46 AM] Frankie Alicea: MX DNS records too
[28/03/26, 1:47:06 AM] Frankie Alicea: and work on email together for AutoNation
[28/03/26, 2:13:48 AM] Frankie Alicea: Lets make a new SOP

Every meeting we have, we must pull up our dashboard and follow recommendations + tasks to be more efficient and move faster, looking and checking off tasks in real time to move the needle further ‎<This message was edited>
[28/03/26, 2:15:06 AM] Frankie Alicea: Minutes + package = final offer
[28/03/26, 2:44:59 AM] Frankie Alicea: Finish connecting all buttons on our own website orayalabs.ai
[28/03/26, 2:47:18 AM] Frankie Alicea: We estimate how much mins a dealership and a insurance agent should use per month and we put it in AI and let it word it and position it nice and clean so its all black and white on website with no Grey areas or confusing pricing.
[28/03/26, 9:40:13 AM] Chitraksh: We just need the county I am looking into it other than that we are good to go
[28/03/26, 9:40:31 AM] Chitraksh: Trying to recover mail or find through docs
[28/03/26, 9:41:00 AM] Chitraksh: You’re right bro
[28/03/26, 9:41:17 AM] Chitraksh: Will add that before next testing
[28/03/26, 9:41:51 AM] Chitraksh: We don’t share shit bro they don’t see any back end
[28/03/26, 9:42:24 AM] Chitraksh: We let them see the dashboard texts and mails and they can do actual testing through phone calls
[28/03/26, 9:43:40 AM] Chitraksh: Conversion to partnership will cost 3-4K 🤖 let’s not do it
[28/03/26, 9:44:05 AM] Chitraksh: I am on it, let’s finalise throughout this weekend
[28/03/26, 9:44:13 AM] Chitraksh: Will do
[28/03/26, 9:44:42 AM] Chitraksh: Sure
‎[28/03/26, 4:50:59 PM] Chitraksh: ‎<attached: 00000697-PHOTO-2026-03-28-16-50-58.jpg>
[28/03/26, 7:53:02 PM] Frankie Alicea: Ok that makes me feel so much better bro lmao But just telling them our stack won't compromise us?
[28/03/26, 7:54:19 PM] Frankie Alicea: Your boy that lives in your apartment is charging 3-4K for docs bro??
[28/03/26, 7:54:25 PM] Frankie Alicea: Thats insane
[28/03/26, 7:56:08 PM] Frankie Alicea: Bro lawyers here do it for way less and we have a company called legal zoom that will do it for a couple hundred dollars. All legal. Lawful, up to date, transparent pricing. And produce documents very fast. Lets go with them. I need you and want you on that call.
[28/03/26, 7:56:48 PM] Frankie Alicea: Perfect, clarify which route we are taking so we are on same page.
[28/03/26, 7:57:40 PM] Frankie Alicea: Perfect
[28/03/26, 7:57:42 PM] Frankie Alicea: 🔥
[28/03/26, 7:58:07 PM] Frankie Alicea: 😂
[28/03/26, 7:58:24 PM] Frankie Alicea: 🙏🏻
[28/03/26, 8:42:12 PM] Chitraksh: Majority of it is fees
[28/03/26, 8:42:26 PM] Chitraksh: But it is shady
[28/03/26, 8:43:09 PM] Chitraksh: He has people in USA who work with him they quoted this number but let’s not even consider it
[28/03/26, 8:43:54 PM] Chitraksh: Let’s keep the corporation we’ll send the form today I am working on the mail we send to the lawyer
‎[28/03/26, 8:44:20 PM] Chitraksh: ‎<attached: 00000711-PHOTO-2026-03-28-20-44-20.jpg>
[28/03/26, 8:45:35 PM] Chitraksh: Ok bro
[28/03/26, 8:58:02 PM] Frankie Alicea: Bro I would laugh at that guy and never do business or talk to him again
[28/03/26, 8:58:09 PM] Frankie Alicea: Thats a disrespectful insult
[28/03/26, 8:58:18 PM] Frankie Alicea: I would never even consider it
[28/03/26, 8:58:47 PM] Frankie Alicea: The rich jew worth hundred of millions of dollars didnt even try to charge me that
[28/03/26, 8:59:36 PM] Frankie Alicea: He said $300 for the entire corporation prepared by another rich Jewish lawyer and thats how I got my c corp bro
[28/03/26, 8:59:44 PM] Frankie Alicea: That guy's a fucking scammer
[28/03/26, 8:59:47 PM] Frankie Alicea: Fuck that guy
[28/03/26, 9:00:22 PM] Chitraksh: I mean asking 3-4K after saying it won’t cost much is insane bro
[28/03/26, 9:00:27 PM] Chitraksh: You’re right
[28/03/26, 9:00:31 PM] Frankie Alicea: Insane brother
[28/03/26, 9:00:40 PM] Frankie Alicea: But people like that usually never aquire real wealth
[28/03/26, 9:00:43 PM] Frankie Alicea: Maybe they get rich
[28/03/26, 9:00:48 PM] Frankie Alicea: But not usually wealthy
[28/03/26, 9:00:54 PM] Frankie Alicea: Pure greed
[28/03/26, 9:01:28 PM] Chitraksh: Let’s not involve him any more bro his friend is such a good person and he only recommended him so I thought he might be good I mean his friend does the works and forgets to ask for payement
[28/03/26, 9:01:37 PM] Chitraksh: He has done that multiple times
[28/03/26, 9:01:42 PM] Frankie Alicea: Done
[28/03/26, 9:01:45 PM] Chitraksh: I haven’t even met him yet
[28/03/26, 9:01:45 PM] Frankie Alicea: He's cut lmao
[28/03/26, 9:01:48 PM] Frankie Alicea: Bet
[28/03/26, 9:01:53 PM] Frankie Alicea: Lets keep it that way
[28/03/26, 9:01:56 PM] Frankie Alicea: Lol
[28/03/26, 9:02:07 PM] Frankie Alicea: Wanna work?
[28/03/26, 9:02:14 PM] Frankie Alicea: Im available if you are
[28/03/26, 9:02:35 PM] Chitraksh: Let’s do a meet now
[28/03/26, 9:02:41 PM] Chitraksh: I have updates as well
[28/03/26, 9:02:40 PM] Frankie Alicea: Bet
[28/03/26, 9:02:59 PM] Frankie Alicea: Perfect send link, im gonna take the meeting on my phone
[28/03/26, 9:03:21 PM] Chitraksh: Okay
[28/03/26, 9:03:21 PM] Frankie Alicea: If it doesn't work good we can do videocall here
[28/03/26, 9:04:10 PM] Chitraksh: https://meet.google.com/mzz-ctoo-gcw
[28/03/26, 9:42:49 PM] Frankie Alicea: Subject: Ready to relaunch — pilot at Mercedes-Benz South Bay

Khalid — I’m reaching out directly because we owe you clarity: we missed the original timeline, tore the system down, rebuilt it with a technical co-founder, and now Oraya is production-ready for a controlled pilot at Mercedes-Benz South Bay. We’re operating as a C-corp with full compliance, SLAs, and tech E&O in place, and we’ve attached the documents and pilot SOW for your review. This is a focused 60–90 day pilot to prove measurable lift in speed-to-lead, appointments, and service bookings—if it hits agreed KPIs, we scale across the network. With Greg no longer involved, I’m reallocating his economics to you: $700,000 USD tied to a successful rollout across the 323 locations, detailed in your offer letter. I know we dropped the ball before—this is the rebuilt version, and we’re ready to execute. If you’re open to it, I’d value 20 minutes this week to walk you through the pilot and get your green light.
[28/03/26, 10:45:20 PM] Chitraksh: bro
[28/03/26, 10:45:33 PM] Chitraksh: i think you phone went off
[28/03/26, 10:48:28 PM] Frankie Alicea: ‎Video call, ‎7 min
[28/03/26, 11:15:01 PM] Frankie Alicea: Such a great meeting bro
[28/03/26, 11:15:03 PM] Frankie Alicea: 🔥
[28/03/26, 11:21:40 PM] Chitraksh: Yes bro this makes me feel more confident towards the revenue generation phase
[28/03/26, 11:22:26 PM] Chitraksh: Let’s pray to god and just go through it with the best we can
[28/03/26, 11:47:43 PM] Frankie Alicea: Hanji hanji
[28/03/26, 11:47:45 PM] Frankie Alicea: 🙏🏻
[28/03/26, 11:48:04 PM] Chitraksh: 😭you caught me off guard
[28/03/26, 11:48:10 PM] Frankie Alicea: LMFAO
[28/03/26, 11:48:12 PM] Chitraksh: I was tripping
[28/03/26, 11:48:16 PM] Frankie Alicea: BRO WAS LIKE
[28/03/26, 11:48:20 PM] Frankie Alicea: Who am I texting??
[28/03/26, 11:48:26 PM] Frankie Alicea: 😂
[28/03/26, 11:48:34 PM] Chitraksh: I got SO confused bro
[28/03/26, 11:48:36 PM] Chitraksh: Good one
[28/03/26, 11:48:39 PM] Frankie Alicea: Bro thought chats got integrated
[28/03/26, 11:48:43 PM] Frankie Alicea: lmaooo
[28/03/26, 11:49:11 PM] Chitraksh: I’m gonna switch to business what’sapp that will be automatically synced
[28/03/26, 11:49:19 PM] Chitraksh: Including files photos and audio
[28/03/26, 11:49:29 PM] Frankie Alicea: Auto synced to what?
[28/03/26, 11:49:34 PM] Frankie Alicea: Our system?
[28/03/26, 11:49:37 PM] Chitraksh: Our Claude system
[28/03/26, 11:49:41 PM] Frankie Alicea: Dam son
[28/03/26, 11:49:43 PM] Chitraksh: Yes dashboard tasks everything
[28/03/26, 11:49:44 PM] Frankie Alicea: Thats wild
[28/03/26, 11:49:48 PM] Frankie Alicea: Fire bro
[28/03/26, 11:50:09 PM] Frankie Alicea: I just took a shower and thought about our meeting the whole shower lmao
[28/03/26, 11:50:13 PM] Frankie Alicea: This is good bro
[28/03/26, 11:50:26 PM] Chitraksh: I’m gonna sleep but gonna wake up early and get some work done
[28/03/26, 11:50:31 PM] Frankie Alicea: Bet
[28/03/26, 11:50:33 PM] Frankie Alicea: Go rest broski
[28/03/26, 11:50:44 PM] Chitraksh: So expect texts at around 8-10pm
[28/03/26, 11:50:50 PM] Chitraksh: Yes sir
[28/03/26, 11:51:07 PM] Chitraksh: You have a great day with your family brother
[28/03/26, 11:51:26 PM] Frankie Alicea: Sounds good brother thank you so much
[28/03/26, 11:51:31 PM] Frankie Alicea: Sleep well
[28/03/26, 11:51:35 PM] Frankie Alicea: Thank you brother
‎[29/03/26, 9:13:34 PM] Chitraksh: ‎<attached: 00000784-PHOTO-2026-03-29-21-13-34.jpg>
[29/03/26, 9:14:05 PM] Chitraksh: I have added all the records you can recover the email
[29/03/26, 9:25:07 PM] Chitraksh: the brief was wild today I did not like the dark UI keeping blank for today
[29/03/26, 9:32:13 PM] Frankie Alicea: Perfect keep you posted today broski
[29/03/26, 9:32:27 PM] Frankie Alicea: Bet
[29/03/26, 9:32:50 PM] Chitraksh: okay bro
[29/03/26, 9:35:16 PM] Chitraksh: We can’t send his offer on the mail bro

Risk 1: Felony criminal exposure for both founders and Khalid.
If Mercedes discovers this arrangement, files a complaint, or if this surfaces during any future due diligence on Oraya, you are looking at a felony record. Not a fine. Not a civil lawsuit. A felony. This would end the company.
Risk 2: The deal gets voided and you get blacklisted from Mercedes entirely.
If Mercedes finds out after the fact that you secured access through a paid arrangement with their employee without disclosure, every contract you signed with them becomes voidable. You'd be banned from every one of their 323 locations permanently.
Risk 3: Khalid's employment agreement almost certainly has an outside compensation clause.
Large corporations like Mercedes-Benz universally include provisions prohibiting employees from receiving outside compensation related to company business without written HR approval. If Khalid signs your offer letter and collects a check, he likely gets fired and potentially sued by Mercedes. That creates a very unhappy person who now has every incentive to report the arrangement.
Risk 4: It poisons your April 2 email package.
If the Khalid letter is ever seen alongside your pilot proposal, it looks like you are trying to buy access rather than earn it on merit. That's the opposite of the message you need to send to a corporate like Mercedes-Benz.
[29/03/26, 9:36:16 PM] Chitraksh: regarding the outside compensation clause that is 100% certain
[29/03/26, 9:36:58 PM] Chitraksh: we have to come up with a smart contract/ Crypto arrangement through another company I will look into it
[29/03/26, 9:38:33 PM] Chitraksh: You have to convince him that we will give him the best arrangement possible but I guess mail should only be sent to dealership officially and his offer can be communicated separately
[29/03/26, 9:38:44 PM] Chitraksh: what do you think
[29/03/26, 9:40:20 PM] Chitraksh: I have all the documents already prepared will mail them to you in a few mins including his offer and SLA ‎<This message was edited>
[29/03/26, 9:47:31 PM] Frankie Alicea: This is absolutely insane bro, no way we are conspiring felons lmao from trying to give someone a commission 😂
[29/03/26, 9:48:24 PM] Frankie Alicea: Ohhhhhhh shit got it broooo
[29/03/26, 9:48:37 PM] Frankie Alicea: Im so glad youre finding a way around it
[29/03/26, 9:48:57 PM] Frankie Alicea: Perfect
[29/03/26, 9:49:51 PM] Frankie Alicea: I think you're thinking is exactly what we need right now and I am happy with everything
[29/03/26, 9:50:00 PM] Frankie Alicea: Perfect!
‎[29/03/26, 10:02:10 PM] Chitraksh: It located our company on government website through corporation number ‎<attached: 00000802-PHOTO-2026-03-29-22-02-10.jpg>
[29/03/26, 10:02:30 PM] Chitraksh: County is Alameda I am sending the SS 4
[29/03/26, 10:02:34 PM] Chitraksh: Send it today
[29/03/26, 10:53:34 PM] Frankie Alicea: Bro this is so fire
[29/03/26, 10:53:36 PM] Frankie Alicea: 🔥
[29/03/26, 11:14:53 PM] Chitraksh: I sent the EIN for as well
[29/03/26, 11:14:57 PM] Chitraksh: Check out mail
[29/03/26, 11:19:03 PM] Frankie Alicea: ok let me check
[29/03/26, 11:25:59 PM] Frankie Alicea: 93-3462113
[29/03/26, 11:26:02 PM] Frankie Alicea: EIN
[29/03/26, 11:26:27 PM] Frankie Alicea: ‎Voice call, ‎3 min
‎[29/03/26, 11:32:22 PM] Frankie Alicea: ‎<attached: 00000813-PHOTO-2026-03-29-23-32-22.jpg>
‎[29/03/26, 11:32:25 PM] Frankie Alicea: ‎<attached: 00000814-PHOTO-2026-03-29-23-32-25.jpg>
[29/03/26, 11:32:28 PM] Frankie Alicea: Can u crop that?
[29/03/26, 11:32:38 PM] Chitraksh: Yes this works
[29/03/26, 11:32:41 PM] Frankie Alicea: Perfect
[29/03/26, 11:33:15 PM] Frankie Alicea: Bro lets get 20 paid subs and move you out here so we can grind majorly bro
[29/03/26, 11:33:28 PM] Frankie Alicea: 20 subs @ $499
[29/03/26, 11:33:33 PM] Frankie Alicea: It's a start bro
[29/03/26, 11:34:17 PM] Chitraksh: yes sir
[29/03/26, 11:34:29 PM] Chitraksh: i am so in brother
‎[29/03/26, 11:34:35 PM] Chitraksh: ‎<attached: 00000823-PHOTO-2026-03-29-23-34-35.jpg>
[29/03/26, 11:36:21 PM] Frankie Alicea: Perfect bro
[29/03/26, 11:36:25 PM] Frankie Alicea: Perfect
[29/03/26, 11:42:48 PM] Chitraksh: What’s your fax number
[29/03/26, 11:44:21 PM] Frankie Alicea: Bro no one has a fax number lmao
[29/03/26, 11:44:48 PM] Frankie Alicea: I am 41 and the technology was already obsolete when I became an adult at 18
[29/03/26, 11:44:52 PM] Frankie Alicea: 😂
[29/03/26, 11:45:19 PM] Frankie Alicea: I think they have e-fax numbers we can use tho. Like pay per fax or some shit
[29/03/26, 11:45:22 PM] Frankie Alicea: Let me look
[29/03/26, 11:45:29 PM] Frankie Alicea: Im on phone with Legal Zoom
[29/03/26, 11:45:42 PM] Chitraksh: I don’t think it’s necessary
[29/03/26, 11:45:49 PM] Frankie Alicea: They said they are setting me up with an attorney to add you to our c corp
[29/03/26, 11:45:57 PM] Frankie Alicea: Im gonna get a quote rn
[29/03/26, 11:46:04 PM] Chitraksh: That’s great brother
[29/03/26, 11:46:17 PM] Frankie Alicea: Its like a few dollars only
[29/03/26, 11:46:19 PM] Frankie Alicea: But lmk
[29/03/26, 11:47:18 PM] Chitraksh: No bro it’s fine
[29/03/26, 11:47:47 PM] Frankie Alicea: How will we fax it then?
[29/03/26, 11:48:39 PM] Chitraksh: We can use a service like fax plus or something
[29/03/26, 11:48:56 PM] Chitraksh: If it’s mandatory to fax which I guess it is from what I remember
[29/03/26, 11:51:44 PM] Chitraksh: I think we’ll need it
[29/03/26, 11:52:03 PM] Chitraksh: Because fax plus is not giving us a fax number just sending fact
[29/03/26, 11:52:08 PM] Chitraksh: x*
[29/03/26, 11:52:41 PM] Chitraksh: I feel so old doing this conversation bro I don’t even know how fax works
[29/03/26, 11:54:33 PM] Frankie Alicea: ‎Voice call, ‎5 min
[30/03/26, 12:17:43 AM] Frankie Alicea: lmfao
[30/03/26, 12:18:03 AM] Frankie Alicea: A fax is basically an email with startup dial for connection
[30/03/26, 12:18:35 AM] Frankie Alicea: Thats how the internet first started. A phone number would connect you to the internet.
[30/03/26, 12:18:53 AM] Frankie Alicea: Crazy how far its come
[30/03/26, 12:19:05 AM] Frankie Alicea: Anyways
[30/03/26, 12:20:09 AM] Frankie Alicea: The legal zoom wouldn't guarantee that our money spent would result in you being added to the company c corp so I didnt sign up
[30/03/26, 12:20:19 AM] Frankie Alicea: Calling another lawyer keep u posted
[30/03/26, 3:43:22 PM] Chitraksh: Okay brother
[30/03/26, 4:35:12 PM] Chitraksh: I just need the Fax and the ss4 is done finally
[30/03/26, 7:59:06 PM] Frankie Alicea: Ok let me get it today!
[31/03/26, 12:55:57 AM] Frankie Alicea: 855-641-6935.
[31/03/26, 12:56:04 AM] Frankie Alicea: Send it broski
[31/03/26, 6:40:07 AM] Chitraksh: Okay bro
[31/03/26, 7:07:46 AM] Frankie Alicea: Im so excited
[31/03/26, 7:08:24 AM] Frankie Alicea: Lmk if you get like a transaction confirmation or some sort of time stamp that we submitted it so we can track it and trace it if necessary
[31/03/26, 1:33:04 PM] Chitraksh: It’s better that you send it they will be skeptical if I send let me send you the final document ss4 in a few mins
[31/03/26, 1:33:21 PM] Chitraksh: Let’s send it 1st thing in the morning
[31/03/26, 7:19:44 PM] Frankie Alicea: Yesir
[31/03/26, 10:39:09 PM] Chitraksh: Hi bro
[31/03/26, 10:39:44 PM] Chitraksh: It is not letting me send the Fax to IRS because maybe indian IP kindly send it
[31/03/26, 10:41:41 PM] Chitraksh: You can make a Fax Plus account we are allowed to send IRS fax using this
[31/03/26, 10:41:42 PM] Chitraksh: https://www.youtube.com/watch?v=RK-gVmQRPhY
[31/03/26, 10:42:08 PM] Chitraksh: I have sent the latest SS4 you don’t have to edit anything
[31/03/26, 10:51:35 PM] Frankie Alicea: Ok i will send it in a couple hours and ping u after bro
‎[01/04/26, 9:53:29 AM] Frankie Alicea: fss4 oraya corporation.pdf • ‎2 pages ‎<attached: 00000872-fss4 oraya corporation.pdf>
[01/04/26, 9:53:53 AM] Frankie Alicea: this is the most recent one i received i just need to make sure before i send it
[01/04/26, 9:53:58 AM] Frankie Alicea: pls confirm
[01/04/26, 9:54:02 AM] Frankie Alicea: i made the account
[01/04/26, 9:54:07 AM] Frankie Alicea: ready to fax now
[01/04/26, 9:55:56 AM] Frankie Alicea: ‎Voice call, ‎3 min
[01/04/26, 9:56:22 AM] Frankie Alicea: r u in uni bro?
‎[01/04/26, 10:10:30 AM] Frankie Alicea: ‎<attached: 00000879-PHOTO-2026-04-01-10-10-30.jpg>
[01/04/26, 10:10:35 AM] Frankie Alicea: done bro
[01/04/26, 10:10:48 AM] Frankie Alicea: update our dashboard pls
[01/04/26, 10:12:29 AM] Frankie Alicea: also i need help with my email when u have a second
[01/04/26, 10:12:39 AM] Frankie Alicea: it still doesnt let me access it bro
[01/04/26, 10:12:50 AM] Frankie Alicea: 😭
‎[01/04/26, 10:18:48 AM] Frankie Alicea: Screenshot_31-3-2026_214838_workspace.google.com.jpeg ‎<attached: 00000885-Screenshot_31-3-2026_214838_workspace.google.com.jpg>
[01/04/26, 10:19:31 AM] Frankie Alicea: gmail is missing bro wtf
[01/04/26, 10:19:48 AM] Frankie Alicea: if we cant figure it out ima just cancel it fuck it
‎[01/04/26, 10:24:47 AM] Frankie Alicea: Screenshot_31-3-2026_215439_mail.google.com.jpeg ‎<attached: 00000888-Screenshot_31-3-2026_215439_mail.google.com.jpg>
[01/04/26, 10:25:56 AM] Frankie Alicea: we're cooking bro
[01/04/26, 10:54:35 AM] Chitraksh: I have my dissertation interview will read in a while
[01/04/26, 10:54:46 AM] Chitraksh: give me like 1hr
[01/04/26, 11:00:18 AM] Frankie Alicea: No worries brother
[01/04/26, 11:00:25 AM] Frankie Alicea: Just letting you know
[01/04/26, 11:00:30 AM] Frankie Alicea: Going to sleep now
[01/04/26, 11:00:34 AM] Frankie Alicea: Talk tomorrow
[01/04/26, 5:43:02 PM] Frankie Alicea: Hey bro just checking in to see if you're good
[01/04/26, 5:45:35 PM] Frankie Alicea: The dashboard says you're high risk of burnout and thats 100% not good. Not sure if that looks like frustration and friction only. Or quiting the project so just wanted to ask you directly.
[01/04/26, 5:46:08 PM] Frankie Alicea: Im sorry if I am contributing to that.
[01/04/26, 5:46:13 PM] Frankie Alicea: Have a good day bro
[01/04/26, 5:46:50 PM] Frankie Alicea: Pls lmk asap so we're on the same page
[01/04/26, 8:04:24 PM] Chitraksh: I’m good bro it’s good that we mentioned it it’s been that way at the time I was putting 7-8hrs it depends upon work brother I’m pretty chill we are good
[01/04/26, 8:04:35 PM] Chitraksh: 😭no bro not at all
[01/04/26, 8:10:36 PM] Frankie Alicea: Bet bet bro
‎[01/04/26, 8:10:38 PM] Frankie Alicea: ‎<attached: 00000904-GIF-2026-04-01-20-10-38.mp4>
[01/04/26, 8:10:48 PM] Frankie Alicea: 😂
[01/04/26, 8:11:34 PM] Chitraksh: Bro I am onto something let’s extend the deadline till 4, mail was supposed to be tomorrow
[01/04/26, 8:11:46 PM] Frankie Alicea: Let me call to c if they have our fax
[01/04/26, 8:12:00 PM] Chitraksh: Is fax instant?
[01/04/26, 8:12:04 PM] Frankie Alicea: Yes
[01/04/26, 8:12:09 PM] Chitraksh: Oh okay
[01/04/26, 8:12:12 PM] Chitraksh: Then you can
[01/04/26, 8:12:18 PM] Frankie Alicea: I just want confirmation
[01/04/26, 8:12:44 PM] Chitraksh: Also any update on lawyer? Do you want me to look for good affordable options near you so that you can give them a call
[01/04/26, 8:13:29 PM] Frankie Alicea: Yes n yes im following up this morning
[01/04/26, 8:13:51 PM] Chitraksh: I will update you tomorrow around same time I will have clarity by then if what I am thinking is possible or not
[01/04/26, 8:13:51 PM] Frankie Alicea: LA San Francisco or San Jose pls
[01/04/26, 8:13:56 PM] Chitraksh: .
[01/04/26, 8:14:12 PM] Chitraksh: Ok bro
[01/04/26, 8:14:33 PM] Chitraksh: Can you do a short meet tomorrow morning or at night?
[01/04/26, 8:14:44 PM] Frankie Alicea: Yesir
[01/04/26, 8:15:29 PM] Chitraksh: Okay bro let me know what works best for you I have some final obligations pending in college I am submit and get through those tomorrow then I am free from uni till May when we have final exams
[01/04/26, 8:15:47 PM] Frankie Alicea: All good brother
[01/04/26, 8:15:50 PM] Frankie Alicea: 🙏🏻
[01/04/26, 8:15:57 PM] Frankie Alicea: Text u time today
[01/04/26, 8:16:11 PM] Chitraksh: Yes sir 🙏
[01/04/26, 8:16:15 PM] Chitraksh: Have a great day
[01/04/26, 8:16:20 PM] Chitraksh: Good morning by the way
[01/04/26, 8:16:52 PM] Frankie Alicea: U too bro have a great night and good morning brother
[01/04/26, 8:19:35 PM] Chitraksh: Also brooo
[01/04/26, 8:19:51 PM] Chitraksh: I have a insane tool to make 7-8 min demo videos for us
[01/04/26, 8:20:02 PM] Chitraksh: I’m gonna cook something for you
[01/04/26, 8:20:24 PM] Chitraksh: It is insane it is like paying a fiver guy 200 minimum for one video it is at that level
[01/04/26, 8:20:39 PM] Chitraksh: You boy has it for Free
[01/04/26, 8:22:11 PM] Frankie Alicea: Letssssss fucken goo brooooooooooo
[01/04/26, 8:22:16 PM] Frankie Alicea: 🚀
‎[01/04/26, 8:22:41 PM] Frankie Alicea: ‎<attached: 00000936-GIF-2026-04-01-20-22-41.mp4>
[01/04/26, 8:22:43 PM] Frankie Alicea: Cook my boy
[01/04/26, 8:38:53 PM] Frankie Alicea: https://share.google/aimode/QzkklR1It8Ump06VY
[01/04/26, 8:39:31 PM] Frankie Alicea: read this when u have a few mins no rush but curious about if we need or  can leverage it
[01/04/26, 10:34:07 PM] Frankie Alicea: Called IRS they said it takes 15 days to process ss4
[01/04/26, 11:40:45 PM] Frankie Alicea: Great news call me
[02/04/26, 1:21:49 AM] Chitraksh: ‎Voice call, ‎8 min
[02/04/26, 1:48:47 AM] Frankie Alicea: check email broski
[02/04/26, 1:48:54 AM] Frankie Alicea: if ur up
[02/04/26, 1:49:00 AM] Frankie Alicea: nevermind go to sleep
[02/04/26, 2:12:29 AM] Chitraksh: Just saw it bro
[02/04/26, 2:12:35 AM] Frankie Alicea: Perfect
[02/04/26, 2:12:40 AM] Chitraksh: Great job brother
[02/04/26, 2:12:47 AM] Frankie Alicea: Yes sir thank you brother
[02/04/26, 2:12:49 AM] Frankie Alicea: 🙏🏻
[02/04/26, 2:12:53 AM] Chitraksh: That’s a lot of points for us on the dashboard 😭
[02/04/26, 2:13:07 AM] Frankie Alicea: Please update our dashboard
[02/04/26, 2:13:11 AM] Frankie Alicea: I need it for my sanity
[02/04/26, 2:13:14 AM] Frankie Alicea: 😂
[02/04/26, 2:13:26 AM] Frankie Alicea: I need to feel good right now
[02/04/26, 2:13:45 AM] Chitraksh: Yes sir🫡😂
‎[02/04/26, 2:14:48 AM] Frankie Alicea: Getting all my contracts taken care of and all my errors and ommissions insurance and my government trainings. Everything is coming along broski. ‎<attached: 00000957-PHOTO-2026-04-02-02-14-48.jpg>
‎[02/04/26, 2:14:50 AM] Frankie Alicea: Getting all my contracts taken care of and all my errors and ommissions insurance and my government trainings. Everything is coming along broski. ‎<attached: 00000958-PHOTO-2026-04-02-02-14-50.jpg>
[02/04/26, 2:24:22 AM] Frankie Alicea: can u send me the outbound link?
[02/04/26, 2:24:31 AM] Frankie Alicea: i tried it and it said it was gone
[02/04/26, 2:24:52 AM] Chitraksh: 🫵👌🏻that’s what we need bro
‎[02/04/26, 2:24:56 AM] Frankie Alicea: Screenshot_1-4-2026_135446_chitraksh3.app.n8n.cloud.jpeg ‎<attached: 00000962-Screenshot_1-4-2026_135446_chitraksh3.app.n8n.cloud.jpg>
[02/04/26, 2:25:24 AM] Frankie Alicea: 100%
[02/04/26, 2:25:45 AM] Frankie Alicea: i also tried to call the number but it didnt work either
[02/04/26, 2:26:22 AM] Chitraksh: I did not receive the PayPal money yet I kept it running on me just recently ran out in retell
[02/04/26, 2:26:29 AM] Frankie Alicea: ohhh
[02/04/26, 2:26:32 AM] Chitraksh: It is expected in 2days
[02/04/26, 2:26:34 AM] Frankie Alicea: got it
[02/04/26, 2:26:37 AM] Frankie Alicea: wait
[02/04/26, 2:26:39 AM] Frankie Alicea: what?
[02/04/26, 2:26:43 AM] Frankie Alicea: the money i sent u??
[02/04/26, 2:27:19 AM] Chitraksh: Yes bro they did a terrible job even after 2 resolutions through phone calls
[02/04/26, 2:27:34 AM] Chitraksh: It is ‘standard’ for all PayPal users
[02/04/26, 2:28:00 AM] Frankie Alicea: thats fucking trash bro
[02/04/26, 2:28:08 AM] Frankie Alicea: never again will we use that
[02/04/26, 2:28:11 AM] Frankie Alicea: never
[02/04/26, 2:28:24 AM] Frankie Alicea: soon we will have our own business bank account bro
[02/04/26, 2:28:26 AM] Frankie Alicea: dont worry
[02/04/26, 2:28:31 AM] Chitraksh: I recently applied for a us bank account link that also takes a week but has a flat 9$ but a guaranteed 7 day and just a link for you
[02/04/26, 2:28:37 AM] Chitraksh: That’s fine bro
[02/04/26, 2:28:48 AM] Chitraksh: I was going to update you in our next meet
[02/04/26, 2:28:51 AM] Frankie Alicea: we will have our subscriptions come out of that account so u dont have to worry anymore
[02/04/26, 2:28:58 AM] Frankie Alicea: all good broski
[02/04/26, 2:29:27 AM] Frankie Alicea: i'll update u later
[02/04/26, 2:29:36 AM] Chitraksh: Yes bro
[02/04/26, 2:29:58 AM] Chitraksh: After your money hits my bank account we will be good for another 1.5 weeks
[02/04/26, 2:30:10 AM] Chitraksh: So that’s good we don’t have to worry about it
[02/04/26, 2:30:38 AM] Frankie Alicea: ok lets make a list of all costs so we can have that in one place
[02/04/26, 2:30:42 AM] Chitraksh: Maybe we can upgrade the claud because since our memory is getting stored it keeps using more tokens but still it’s good for us
[02/04/26, 2:30:52 AM] Chitraksh: I’m gonna hook it up to paper clip
[02/04/26, 2:30:54 AM] Chitraksh: Look it up
[02/04/26, 2:31:03 AM] Frankie Alicea: lets chat about this later
[02/04/26, 2:31:05 AM] Frankie Alicea: and ok i will
[02/04/26, 2:31:12 AM] Chitraksh: Okay bro
[02/04/26, 2:31:55 AM] Chitraksh: Good night I’ll update you with something good tonight
[02/04/26, 2:32:03 AM] Chitraksh: (Yours)
[02/04/26, 2:38:13 AM] Frankie Alicea: Goodnight brother
‎[02/04/26, 5:30:45 PM] Chitraksh: ‎<attached: 00000998-VIDEO-2026-04-02-17-30-45.mp4>
[02/04/26, 5:31:37 PM] Chitraksh: Check this out I am not saying we post this but now we are able to make this level of video in a single prompt with 2 video daily limit on my pro plan
[02/04/26, 5:32:09 PM] Chitraksh: You will help me out with the prompt background or like anyidea you have for a video that would be great
[02/04/26, 5:53:30 PM] Frankie Alicea: Okay broski let me look
[02/04/26, 5:58:08 PM] Frankie Alicea: Dam
[02/04/26, 5:58:11 PM] Frankie Alicea: Thats crazy bro
[02/04/26, 5:58:21 PM] Frankie Alicea: We're gonna make this shit look so dam good
[02/04/26, 5:58:26 PM] Frankie Alicea: Good shit brother
[02/04/26, 5:58:28 PM] Frankie Alicea: 🔥
[02/04/26, 5:58:58 PM] Frankie Alicea: You weren't lying
[02/04/26, 5:59:03 PM] Frankie Alicea: You cooked
‎[02/04/26, 5:59:12 PM] Frankie Alicea: ‎<attached: 00001009-GIF-2026-04-02-17-59-12.mp4>
‎[02/04/26, 10:18:19 PM] Frankie Alicea: This is gold in our defense of Oraya ip and ownership proving no association ‎<attached: 00001010-PHOTO-2026-04-02-22-18-19.jpg>
[02/04/26, 10:18:47 PM] Chitraksh: Yes bro
[02/04/26, 10:19:00 PM] Chitraksh: This was not even the starters
[02/04/26, 10:20:00 PM] Chitraksh: I’m almost sure I can show you why I postponed the mail I just need few hours to be 100% don’t wanna over commit and under deliver
[02/04/26, 10:20:30 PM] Frankie Alicea: No worries I trust your judgment brother
[02/04/26, 10:20:33 PM] Chitraksh: Yes bro
[02/04/26, 10:21:00 PM] Chitraksh: Let’s make a legal folder in our Claud with non sensitive documents
[02/04/26, 10:21:06 PM] Chitraksh: So that we can later keep track
[02/04/26, 10:21:15 PM] Frankie Alicea: 100%
[02/04/26, 10:22:04 PM] Frankie Alicea: ‎Voice call, ‎7 min
[02/04/26, 10:31:05 PM] Chitraksh: https://www.instagram.com/p/DWoVzyGDS18/?img_index=1&igsh=MTUxeHlqbTBjc3NncQ==
[03/04/26, 12:31:03 AM] Frankie Alicea: One hour good for you?
[03/04/26, 12:31:06 AM] Frankie Alicea: 1pm?
[03/04/26, 12:34:04 AM] Chitraksh: Yes bro works
[03/04/26, 12:39:34 AM] Frankie Alicea: Perfect send link see u then broski
[03/04/26, 1:33:24 AM] Chitraksh: Bro just give me 15mins
[03/04/26, 1:33:24 AM] Frankie Alicea: Can I use my credit card to pay for the retell so we can have it working 24/7?




Finishing up a phone call with insurance carrier bro. One second.
[03/04/26, 1:33:28 AM] Frankie Alicea: Perfect
[03/04/26, 1:33:32 AM] Frankie Alicea: Better for me too
[03/04/26, 1:33:47 AM] Chitraksh: Yes we definitely can
[03/04/26, 1:33:54 AM] Frankie Alicea: Perfect fucking Perfect
[03/04/26, 1:33:57 AM] Frankie Alicea: 🔥
[03/04/26, 1:33:59 AM] Frankie Alicea: Today?
[03/04/26, 1:42:26 AM] Chitraksh: Yes bro
[03/04/26, 1:51:01 AM] Chitraksh: https://meet.google.com/axt-pzra-ynw
[03/04/26, 1:53:32 AM] Frankie Alicea: coming rn
[03/04/26, 3:05:31 AM] Chitraksh: ‎Voice call, ‎2 min
[03/04/26, 6:57:07 PM] Frankie Alicea: ‎Missed voice call, ‎Tap to call back
[03/04/26, 6:58:09 PM] Frankie Alicea: Is that you requesting twilio or we getting hacked??
‎[03/04/26, 6:58:58 PM] Frankie Alicea: ‎<attached: 00001039-PHOTO-2026-04-03-18-58-58.jpg>
[03/04/26, 7:44:08 PM] Frankie Alicea: 👀
[03/04/26, 7:44:20 PM] Chitraksh: Sorry I thought I replied
[03/04/26, 7:44:23 PM] Chitraksh: It was me bro
[03/04/26, 7:44:29 PM] Frankie Alicea: Bet lol
[03/04/26, 7:44:57 PM] Frankie Alicea: Do it again if u need it
[03/04/26, 7:45:05 PM] Chitraksh: One of my browser doesn’t need the otp for 30days but Ig it expired it was asking
[03/04/26, 7:45:10 PM] Chitraksh: Yes just one sec bro
[03/04/26, 7:45:12 PM] Frankie Alicea: Got it
[03/04/26, 7:45:57 PM] Chitraksh: Check for it bro
[03/04/26, 7:46:10 PM] Frankie Alicea: 865406
[03/04/26, 7:46:26 PM] Chitraksh: Thanks bro
[03/04/26, 7:46:31 PM] Frankie Alicea: Yesir
[03/04/26, 7:46:53 PM] Frankie Alicea: Did you update our dashboard from yesterday's meeting brother?
[03/04/26, 7:47:01 PM] Frankie Alicea: Not urgent
[03/04/26, 7:47:06 PM] Chitraksh: I will send you the form in a bit for outbound it’s already connected to back end just doing twillio
[03/04/26, 7:47:20 PM] Chitraksh: It hit the rate limit bro
[03/04/26, 7:47:20 PM] Frankie Alicea: Perfect thx bro
[03/04/26, 7:47:30 PM] Chitraksh: Claude has been acting shit for past week
[03/04/26, 7:47:30 PM] Frankie Alicea: What limit is that
[03/04/26, 7:47:35 PM] Frankie Alicea: Oh
[03/04/26, 7:47:38 PM] Chitraksh: Token limit
[03/04/26, 7:47:45 PM] Chitraksh: For 5 hr session
[03/04/26, 7:47:47 PM] Frankie Alicea: How do we fix that
[03/04/26, 7:47:51 PM] Frankie Alicea: Or we cant?
[03/04/26, 7:48:10 PM] Chitraksh: It’s their fault everyone’s facing it bro
[03/04/26, 7:48:22 PM] Frankie Alicea: Think it will be resolved?
[03/04/26, 7:48:26 PM] Frankie Alicea: Has to right?
[03/04/26, 7:48:32 PM] Chitraksh: Very very few limits in a session and models acting a little dumb
[03/04/26, 7:48:39 PM] Chitraksh: Yes of course
[03/04/26, 7:48:44 PM] Frankie Alicea: Okay cool
[03/04/26, 7:48:56 PM] Chitraksh: I think there’s making way for the new ones sonnet 4.8 is already there
[03/04/26, 7:49:04 PM] Chitraksh: It was mentioned in the source code
[03/04/26, 7:49:07 PM] Chitraksh: So we know
[03/04/26, 7:49:36 PM] Chitraksh: They might be tuning it down slowly so that when we try the new ones we will be like holy fuck
[03/04/26, 7:50:31 PM] Chitraksh: They do this shit
[03/04/26, 7:51:37 PM] Frankie Alicea: Ohhhhhh
[03/04/26, 7:51:45 PM] Frankie Alicea: That makes sense
[03/04/26, 7:51:50 PM] Frankie Alicea: They're gonna update
[03/04/26, 7:52:11 PM] Frankie Alicea: Makes perfect sense bro
[03/04/26, 7:52:24 PM] Frankie Alicea: They learned that shit from apple probably bro
[03/04/26, 7:52:31 PM] Frankie Alicea: I think they invented that shit
[03/04/26, 7:53:04 PM] Chitraksh: Except one model update atleast in the coming 2 weeks be it sonnet the new opus whatever they call it now
[03/04/26, 7:55:35 PM] Frankie Alicea: You use opus to code?
[03/04/26, 7:56:22 PM] Frankie Alicea: Or Claude code? Or its same?
[03/04/26, 7:56:23 PM] Chitraksh: I use a combination of codex opus and the Gemini for general bug fix but for simpler tasks sonnet is sufficient
[03/04/26, 7:56:35 PM] Frankie Alicea: Got it
[03/04/26, 7:57:07 PM] Chitraksh: Claude code is basically a feature that let’s opus and sonnet work through your pc so browser control terminal access now they has browser computer as well
[03/04/26, 7:57:33 PM] Frankie Alicea: Bro u explained that so well lol
[03/04/26, 7:57:35 PM] Frankie Alicea: Thx
[03/04/26, 7:57:59 PM] Chitraksh: No problem brother in 2 yrs we both will be the CTO
[03/04/26, 7:58:17 PM] Chitraksh: Actually 1 - 1.5 max
[03/04/26, 8:01:01 PM] Frankie Alicea: I love the way that sounds bro
[03/04/26, 8:01:20 PM] Frankie Alicea: We're gonna run a lean company bro
[03/04/26, 8:01:31 PM] Frankie Alicea: Lean as fuck
[03/04/26, 8:01:36 PM] Frankie Alicea: 💯
[03/04/26, 8:02:18 PM] Chitraksh: Human wise very lean, operational capacity wise massive with 100s of agents
‎[03/04/26, 8:03:34 PM] Frankie Alicea: ‎<attached: 00001096-GIF-2026-04-03-20-03-34.mp4>
[03/04/26, 9:26:59 PM] Chitraksh: https://orayalabsai.app.n8n.cloud/form/f021b34f-c138-43d0-8f6e-e123ca87302d
[03/04/26, 9:28:03 PM] Chitraksh: Inbound is also set brother can you try calling our number for the inbound and this for for the outbound. let me know if you start getting texts
[03/04/26, 9:28:14 PM] Chitraksh: probably 1 admin you must have got
[03/04/26, 9:38:51 PM] Frankie Alicea: I got it
[03/04/26, 9:39:32 PM] Frankie Alicea: Perfect bro
[03/04/26, 9:39:35 PM] Frankie Alicea: 🔥
[03/04/26, 9:39:40 PM] Frankie Alicea: 🔥
‎[03/04/26, 9:47:47 PM] Chitraksh: This is all for our entire system of Mercedes of south bay ‎<attached: 00001104-PHOTO-2026-04-03-21-47-46.jpg>
[03/04/26, 9:47:55 PM] Frankie Alicea: So right now this is a  Mercedes-Benz AutoNation agent correct?
[03/04/26, 9:48:02 PM] Chitraksh: Yes bro
[03/04/26, 9:48:07 PM] Frankie Alicea: Ok perfect
[03/04/26, 9:48:15 PM] Frankie Alicea: Ok let me look
[03/04/26, 9:48:29 PM] Chitraksh: Try the form first
[03/04/26, 9:49:13 PM] Frankie Alicea: Ok bet
[03/04/26, 9:50:21 PM] Frankie Alicea: Check for an error
[03/04/26, 9:50:28 PM] Frankie Alicea: Or check execution log
‎[03/04/26, 9:51:22 PM] Chitraksh: ‎<attached: 00001113-PHOTO-2026-04-03-21-51-21.jpg>
[03/04/26, 9:51:35 PM] Frankie Alicea: I need the one
[03/04/26, 9:51:37 PM] Frankie Alicea: Ok
[03/04/26, 9:51:40 PM] Chitraksh: The number is supposed to be +1 the
[03/04/26, 9:51:40 PM] Frankie Alicea: One second
[03/04/26, 9:51:44 PM] Frankie Alicea: Thats right
[03/04/26, 9:51:45 PM] Chitraksh: And no space
[03/04/26, 9:52:00 PM] Frankie Alicea: No dash?
[03/04/26, 9:52:04 PM] Chitraksh: No
[03/04/26, 9:52:07 PM] Frankie Alicea: Got it
[03/04/26, 9:52:10 PM] Frankie Alicea: Thx
[03/04/26, 9:52:25 PM] Chitraksh: I will add a code node to do the formatting for you the next time
[03/04/26, 9:53:02 PM] Chitraksh: So that you can put it however with dash no dash plus or not it’s gonna auto correct before sending
[03/04/26, 9:57:25 PM] Frankie Alicea: Bro that was so fucking fire
[03/04/26, 9:57:29 PM] Frankie Alicea: 😭
[03/04/26, 9:57:35 PM] Frankie Alicea: We did it bro
[03/04/26, 9:58:09 PM] Frankie Alicea: So use that last call transcript and feed it back into our AI so it can make the minor changes i mentioned on the recorded call
[03/04/26, 9:58:15 PM] Frankie Alicea: This is amazing
[03/04/26, 9:58:20 PM] Frankie Alicea: Insane how good it is bro
[03/04/26, 9:58:23 PM] Chitraksh: Okay
[03/04/26, 9:58:22 PM] Frankie Alicea: 🔥
[03/04/26, 9:58:26 PM] Frankie Alicea: 🚀
[03/04/26, 9:58:28 PM] Chitraksh: You getting all the texts?
[03/04/26, 9:58:37 PM] Chitraksh: Admin and customer
[03/04/26, 9:58:57 PM] Frankie Alicea: Yesss for admin let me see for customer
[03/04/26, 9:59:28 PM] Frankie Alicea: Not customer facing text
[03/04/26, 9:59:30 PM] Frankie Alicea: Only admin
[03/04/26, 9:59:46 PM] Chitraksh: okay let me see
[03/04/26, 10:00:03 PM] Frankie Alicea: I got the customer email tho
[03/04/26, 10:09:21 PM] Chitraksh: Yep got it
[03/04/26, 10:09:58 PM] Chitraksh: I accidentally used put inbound n8n webhook
[03/04/26, 10:10:33 PM] Chitraksh: I am so happy this is the last time I am switching up accounts and finally setting it up then we can focus on more important things build tech and move on
[03/04/26, 10:12:48 PM] Chitraksh: Bro
[03/04/26, 10:13:25 PM] Chitraksh: I put inbound agent link on form so you just talked to our inbound that is why it must have said thanks for calling
[03/04/26, 10:13:33 PM] Chitraksh: Now check it out
[03/04/26, 10:17:51 PM] Frankie Alicea: I thought so bro
[03/04/26, 10:17:52 PM] Frankie Alicea: LMAO
[03/04/26, 10:18:02 PM] Frankie Alicea: Ok hold on
[03/04/26, 10:18:15 PM] Chitraksh: I GOT SO Confused because I didn’t do that
[03/04/26, 10:23:43 PM] Frankie Alicea: Use transcript from the call right now to correct the one issue and I think its fucking pretty close to flawless bro
[03/04/26, 10:23:53 PM] Frankie Alicea: 9.9 out of 10
[03/04/26, 10:23:57 PM] Frankie Alicea: 🚀
[03/04/26, 10:25:47 PM] Frankie Alicea: I got customer and admin text this time broski
[03/04/26, 10:25:56 PM] Frankie Alicea: 🔥
[03/04/26, 10:26:33 PM] Chitraksh: Because I put a inbound workflow it was trying to send itself message now
[03/04/26, 10:26:37 PM] Chitraksh: Everything will work
[03/04/26, 10:26:46 PM] Chitraksh: In inbound as well
[03/04/26, 10:28:50 PM] Chitraksh: Got it
[03/04/26, 10:28:58 PM] Chitraksh: Question mark will be gone
[03/04/26, 10:30:31 PM] Frankie Alicea: Perfect
[03/04/26, 10:30:59 PM] Frankie Alicea: 👌🏻
[03/04/26, 10:38:11 PM] Chitraksh: dashboard is updated too
[03/04/26, 10:53:51 PM] Frankie Alicea: perfect i will look at it now
[03/04/26, 11:32:34 PM] Frankie Alicea: If I understand this correctly, it is incorrect. We can sell the leads as they would be opted-in or we could sell them as confirmed appointments and charge even more $50-$100 per "confirmed" appointments

Compliance strategy: Lead resale — unlicensed broker activity	Selling publicly-sourced, arranged data to licensed insurers is a gray area. Needs legal review before scale.
[03/04/26, 11:33:25 PM] Frankie Alicea: it shows unresolved, we can update it if i understand this correctly to resolved
[03/04/26, 11:34:36 PM] Chitraksh: Okay bro this is from which section
[03/04/26, 11:35:07 PM] Frankie Alicea: also $2 million E&O is for my personal life insurance license not oraya, so we can update that if u would like so its accurate. it doesnt bother me. just for clarity
[03/04/26, 11:35:31 PM] Frankie Alicea: Insurance project tab
[03/04/26, 11:35:38 PM] Chitraksh: Okay
[03/04/26, 11:36:04 PM] Frankie Alicea: i am gonna call today to get an accurate quote for oraya
[03/04/26, 11:36:15 PM] Chitraksh: Okay bro
[03/04/26, 11:36:37 PM] Chitraksh: Let me know if you need anything
[03/04/26, 11:36:48 PM] Frankie Alicea: yesir likewise
[03/04/26, 11:36:57 PM] Frankie Alicea: thx for everything bro
[04/04/26, 3:59:59 PM] Chitraksh: Likewise brother ‎<This message was edited>
[04/04/26, 4:01:34 PM] Chitraksh: And about the video bro I have google ai pro which gives the pro video which you saw a daily limit of 2 so we should not waste these and have atleast 2 prompts daily to utilise bro because it doesn’t add up if we do not produce videos
[04/04/26, 4:01:54 PM] Chitraksh: Regular notebook lm doesn’t have it
[04/04/26, 4:02:23 PM] Chitraksh: We should utilise it might take up scenes from these one of these whatever we like and include in a custom video
[04/04/26, 4:03:04 PM] Chitraksh: Which has best parts of all of then or just upload them as it is by removing the watermark
[04/04/26, 9:41:13 PM] Frankie Alicea: Ok ill start working on a fire prompt here shortly
[04/04/26, 9:41:27 PM] Frankie Alicea: Are you available to meet in an hour or so?
[04/04/26, 9:41:35 PM] Frankie Alicea: Good morning brother
[04/04/26, 10:15:52 PM] Chitraksh: Good morning brother
[04/04/26, 10:16:15 PM] Chitraksh: Can we do 12:30 or 1 pm
[04/04/26, 10:19:05 PM] Frankie Alicea: Lets lock in 1pm brother
[04/04/26, 10:29:13 PM] Chitraksh: Done
[05/04/26, 1:31:14 AM] Chitraksh: https://meet.google.com/ktp-nttc-msh
[05/04/26, 1:51:54 PM] Chitraksh: Brother whenever you wake up can you do me a favour and go through all the Mercedes documents which I sent you
[05/04/26, 1:52:46 PM] Chitraksh: Because as soon as I connect inventory and we do the testing and validate it
[05/04/26, 1:53:13 PM] Chitraksh: Documents will remain same with few minor changes likes minutes and all that so we should be prepared
[05/04/26, 1:53:18 PM] Chitraksh: We are close
[05/04/26, 7:03:31 PM] Frankie Alicea: 100% brother
[05/04/26, 7:04:37 PM] Frankie Alicea: Today is a holiday for us, so Im gonna get my kids ready and then go wirh the family but I will 100% read them and give feedback before mid day.
[05/04/26, 7:04:44 PM] Frankie Alicea: I will ping you soon.
[05/04/26, 7:04:49 PM] Frankie Alicea: So close bro
[05/04/26, 7:05:11 PM] Frankie Alicea: 🤏🏻
[05/04/26, 8:51:36 PM] Frankie Alicea: Can you kindly convert the documents from word to PDF pls? My android won't pull the documents up. I have reviewed the letter and it looks really good. Only thing we need to change is the LLC to Inc. (I think) lmao
[05/04/26, 8:56:43 PM] Chitraksh: Yes
[05/04/26, 8:57:42 PM] Chitraksh: Just review the main content
[05/04/26, 9:00:55 PM] Frankie Alicea: Brother I cant
[05/04/26, 9:01:02 PM] Frankie Alicea: 😭
[05/04/26, 9:01:25 PM] Frankie Alicea: I only can review the email document
[05/04/26, 9:01:37 PM] Frankie Alicea: The others say file is corrupted
[05/04/26, 9:02:06 PM] Chitraksh: Okayy I will send the pdf for all
[05/04/26, 9:02:17 PM] Frankie Alicea: Thx broski
[05/04/26, 9:02:22 PM] Chitraksh: That would be easier give me like 1.5 hrs I am out somewhere
[05/04/26, 9:02:30 PM] Frankie Alicea: No worries
[05/04/26, 9:02:39 PM] Frankie Alicea: Im available all day and night
[05/04/26, 9:03:59 PM] Chitraksh: It’s good that you pointed out because this was Claude generate doc problem with those is that sometimes it runs on word sometimes it runs on google doc we can make it to run all platforms
[05/04/26, 9:04:10 PM] Chitraksh: That is not the case with pdf
[05/04/26, 9:10:59 PM] Frankie Alicea: Ok so pdf for everything going forward?
[05/04/26, 11:35:01 PM] Chitraksh: Yes
[05/04/26, 11:35:03 PM] Chitraksh: Hey bro
[05/04/26, 11:35:21 PM] Chitraksh: I’m actually testing the inventory
[06/04/26, 12:31:17 AM] Chitraksh: When it works it’s insane
[06/04/26, 12:31:33 AM] Chitraksh: Still have to debug it more
[06/04/26, 2:19:39 AM] Frankie Alicea: Tell me how
[06/04/26, 2:19:43 AM] Frankie Alicea: Like what do you mean
[06/04/26, 2:19:50 AM] Frankie Alicea: Insane like good right?
[06/04/26, 2:19:58 AM] Frankie Alicea: Bet
‎[06/04/26, 8:20:10 PM] Chitraksh: ‎<attached: 00001223-AUDIO-2026-04-06-20-20-09.opus>
‎[06/04/26, 9:12:43 PM] Frankie Alicea: ‎<attached: 00001224-AUDIO-2026-04-06-21-12-43.opus>
[07/04/26, 12:03:06 AM] Chitraksh: I’m free now brother
[07/04/26, 12:03:51 AM] Frankie Alicea: I will be home in 20 mins broski
‎[07/04/26, 12:31:11 AM] Frankie Alicea: ‎<attached: 00001227-AUDIO-2026-04-07-00-31-11.opus>
[07/04/26, 12:46:46 AM] Frankie Alicea: u busy or ready
[07/04/26, 12:47:11 AM] Frankie Alicea: or you sleep? if you're tired we can do it when you wake up
[07/04/26, 12:47:49 AM] Chitraksh: Yes bro just give me 5 mins my storage is full I can’t access my apps if it takes time we can run it tomorrow
[07/04/26, 12:48:14 AM] Frankie Alicea: take ur time broski im here waiting for you brother no rush
‎[07/04/26, 12:48:21 AM] Chitraksh: ‎image omitted
[07/04/26, 12:49:30 AM] Frankie Alicea: We always need more storage
[07/04/26, 12:49:35 AM] Frankie Alicea: 😭
[07/04/26, 12:56:22 AM] Chitraksh: Bro let’s do it tomorrow it’s gonna take time and I have to wake up early
[07/04/26, 1:09:47 AM] Frankie Alicea: no worries brother
[07/04/26, 1:09:50 AM] Frankie Alicea: get rest
‎[07/04/26, 1:26:59 AM] Frankie Alicea: Update our AI, if this is correct our e&o / cyber liability is cheap af bro ‎<attached: 00001238-PHOTO-2026-04-07-01-26-59.jpg>
‎[07/04/26, 1:27:02 AM] Frankie Alicea: Update our AI, if this is correct our e&o / cyber liability is cheap af bro ‎<attached: 00001239-PHOTO-2026-04-07-01-27-02.jpg>
‎[07/04/26, 2:49:48 AM] Frankie Alicea: ‎<attached: 00001240-PHOTO-2026-04-07-02-49-48.jpg>
[07/04/26, 3:43:49 AM] Frankie Alicea: bro i have never been excited to read documents prepared by lawyers lmao these docs are so fucken fire.. idgaf if u used ai or not lmao you gotta know how to use this shit or it doesnt matter lol u know that bro.. these are insanely good bro. i am so impressed. I will go finish last doc now



lets talk about this next meet:

Pls Remove "Oraya AI a AI Voice Platform" & replace with "Oraya AI Revenue Intelligence Infrastructure Layer"
[07/04/26, 3:46:31 AM] Frankie Alicea: "AI-Powered Revenue Intelligence Platform for Automotive Dealership Operations"
[07/04/26, 4:14:28 AM] Frankie Alicea: brooooooooooooooooooooooooooooooooo
[07/04/26, 4:14:38 AM] Frankie Alicea: that email package is absolutely insane
[07/04/26, 4:14:45 AM] Frankie Alicea: u know ball
‎[07/04/26, 4:15:17 AM] Frankie Alicea: ‎<attached: 00001246-GIF-2026-04-07-04-15-17.mp4>
[07/04/26, 6:13:18 AM] Frankie Alicea: And our dashboard is sooo sick bro, love the new updates!
[08/04/26, 12:02:59 AM] Frankie Alicea: Bro I have a great idea! Im gonna get my friends leads and put them in our system so we can run our first batch of real opted in leads!
[08/04/26, 12:11:42 AM] Frankie Alicea: "The enterprise security world is scrambling to catch up. NVIDIA launched NemoClaw, an enterprise-grade extension adding privacy controls and network guardrails on top of OpenClaw. Most early enterprise adopters have landed on human-in-the-loop setups, where agents handle routine tasks autonomously but flag anything high-stakes for human review."
[09/04/26, 12:47:12 AM] Chitraksh: ‎Voice call, ‎No answer
[09/04/26, 12:49:14 AM] Chitraksh: Yes sir 🫡
[09/04/26, 12:49:32 AM] Chitraksh: Bro that’s crazy you already got it
[09/04/26, 12:50:00 AM] Chitraksh: 🔥it’s coming along
[09/04/26, 12:51:45 AM] Chitraksh: You know what that’s is a great idea
[09/04/26, 12:52:02 AM] Chitraksh: We will know how it behaves in real world
[09/04/26, 2:06:21 AM] Frankie Alicea: I was getting a haircut broski
[09/04/26, 2:06:34 AM] Frankie Alicea: Did you see the email from Tyler?
[09/04/26, 2:08:28 AM] Frankie Alicea: Its the best for us anyways. I already found a replacement here in san jose. Im waiting to hear back. They said 24-48 hours from today.
[09/04/26, 2:08:42 AM] Frankie Alicea: Ill update you with that today or friday at the latest.
[09/04/26, 2:10:37 AM] Frankie Alicea: I didnt purchase it, I got a quote. We have to do it together to make sure i answer all the questions about our tech accurately. But the good news is its cheap and instant. We can purchase the insurance instantly. Its 100% automated. Go figure. There's no human needed to purchase their insurance. See how that works? We can do that for all the other insurance verticals eventually.
[09/04/26, 2:11:00 AM] Frankie Alicea: Its own by Warren Buffet. If you're familiar with him.
[09/04/26, 2:11:27 AM] Frankie Alicea: Bet, let me setup a meeting with my friend Theresa. Its time for you to meet eachother.
‎[09/04/26, 2:11:48 AM] Frankie Alicea: ‎<attached: 00001263-GIF-2026-04-09-02-11-48.mp4>
‎[09/04/26, 2:34:56 AM] Frankie Alicea: Strategy-Law-LLP-Intake-Form.pdf • ‎2 pages ‎<attached: 00001264-Strategy-Law-LLP-Intake-Form.pdf>
[09/04/26, 2:38:30 AM] Frankie Alicea: Ok shes on standby so we can meet, are you good for 15-30 mins with her tomorrow? This is gonna be a great meeting for you and I bro.
‎[09/04/26, 2:45:10 AM] Frankie Alicea: ‎<attached: 00001266-PHOTO-2026-04-09-02-45-10.jpg>
[09/04/26, 2:45:27 AM] Frankie Alicea: Attorney info in case you want to research them
[09/04/26, 3:32:07 AM] Frankie Alicea: Check email asap and respond  with morning availability for tomorrow friday or monday brother.

Whatever time is good for you I should be able to make work. 

I just wanna finalize our corporation docs so we can launch our company! ‎<This message was edited>
[09/04/26, 3:32:08 AM] Frankie Alicea: 🚀
[09/04/26, 3:36:40 AM] Frankie Alicea: Im gonna lock in 9am tomorrow hopefully you can make it but if you're busy I completely understand. But I really hope you can be there since its all lawyer shit. 

Either way its all good. 

I will 100% get everything taken care of if you cant make it broski.
[09/04/26, 5:20:25 AM] Frankie Alicea: How often does our whatsapp get ingested into our system?
[09/04/26, 12:46:27 PM] Chitraksh: Yes I did
[09/04/26, 12:46:36 PM] Chitraksh: Yes sir
[09/04/26, 12:47:06 PM] Chitraksh: Obviously brother
[09/04/26, 12:47:32 PM] Chitraksh: I will look it up
[09/04/26, 12:49:22 PM] Chitraksh: Whenever you say brother
[09/04/26, 12:49:39 PM] Chitraksh: This is 🔥🔥
[09/04/26, 12:50:07 PM] Chitraksh: Yes bro let me know the timings
[09/04/26, 12:51:26 PM] Chitraksh: I will make it brother
[09/04/26, 12:52:57 PM] Chitraksh: About that I checked I need a WhatsApp business api to get that ingested automatically this is my personal WhatsApp I own another number which is for business +919234660000 I will connect that today and we’ll chat in this number to get it automatic everytime
[09/04/26, 5:00:25 PM] Frankie Alicea: Just making sure lmao
[09/04/26, 5:02:25 PM] Frankie Alicea: Ok bet I will look for a time that works today brother
[09/04/26, 5:02:46 PM] Frankie Alicea: 💯
[09/04/26, 5:03:05 PM] Frankie Alicea: 👌🏻
[09/04/26, 5:03:26 PM] Frankie Alicea: Bro you're goated
[09/04/26, 5:03:30 PM] Frankie Alicea: 🐐
[09/04/26, 5:03:41 PM] Frankie Alicea: Hit you in a few hours broski
[09/04/26, 5:03:44 PM] Frankie Alicea: 🫡
[09/04/26, 5:04:35 PM] Chitraksh: Okay bro
[09/04/26, 5:04:37 PM] Chitraksh: Good morning
[09/04/26, 5:05:13 PM] Frankie Alicea: Good morning brother
[09/04/26, 5:05:41 PM] Frankie Alicea: Brother how is the dissertation?
[09/04/26, 7:48:12 PM] Frankie Alicea: Did you receive the zoom link from attorney?
[09/04/26, 7:49:09 PM] Chitraksh: yes bro
[09/04/26, 7:49:41 PM] Chitraksh: it is done bro my farewell is also done just 30 days until uni ends and I can go all in with you
[09/04/26, 8:19:55 PM] Frankie Alicea: Good shit. How do you feel you did brother?
[09/04/26, 8:20:35 PM] Frankie Alicea: I cant wait bro!!!
[09/04/26, 8:20:42 PM] Frankie Alicea: 🚀
[09/04/26, 9:20:37 PM] Frankie Alicea: About to park and hop on
[09/04/26, 9:20:40 PM] Frankie Alicea: U ready?
[09/04/26, 9:23:35 PM] Frankie Alicea: ‎Missed voice call, ‎Tap to call back
[09/04/26, 9:24:49 PM] Frankie Alicea: Broski
[09/04/26, 9:25:12 PM] Frankie Alicea: Join to make sure we are all connected
[09/04/26, 9:26:18 PM] Frankie Alicea: Im on brother
[09/04/26, 9:27:25 PM] Chitraksh: 1 sec bro
[09/04/26, 9:30:40 PM] Frankie Alicea: Bro my internet is so bad you might have to run the meeting
[09/04/26, 9:30:49 PM] Chitraksh: No problem
[09/04/26, 9:30:51 PM] Chitraksh: I am in
[09/04/26, 9:30:59 PM] Chitraksh: Try to join if you can
[09/04/26, 9:31:00 PM] Frankie Alicea: Im gonna do sound only and if he doesn't show up I will leave soon
[09/04/26, 9:31:13 PM] Chitraksh: Okay try audio only
[09/04/26, 9:31:25 PM] Frankie Alicea: Im in waiting room
[09/04/26, 9:31:32 PM] Frankie Alicea: R u inside with attorney?
[09/04/26, 9:31:47 PM] Chitraksh: No bro I am also in the waiting
‎[09/04/26, 9:31:57 PM] Chitraksh: ‎image omitted
[09/04/26, 9:32:34 PM] Frankie Alicea: Ok bet
[09/04/26, 9:32:41 PM] Frankie Alicea: 2 mins more to wait if not we leave
[09/04/26, 9:32:46 PM] Frankie Alicea: 5 min max
[09/04/26, 9:33:05 PM] Chitraksh: Let’s stay till 37 atleast
[09/04/26, 9:33:24 PM] Frankie Alicea: Its 903am
[09/04/26, 9:33:31 PM] Frankie Alicea: What time here?
[09/04/26, 9:33:46 PM] Chitraksh: No my bad it’s 9:33 pm
[09/04/26, 9:33:54 PM] Chitraksh: So I meant 9:07am
[09/04/26, 9:33:59 PM] Frankie Alicea: Got it
[09/04/26, 9:34:35 PM] Frankie Alicea: He just emailed
[09/04/26, 9:34:45 PM] Frankie Alicea: He's a couple mins behind
[09/04/26, 9:34:49 PM] Frankie Alicea: Be here soon
[09/04/26, 9:34:55 PM] Chitraksh: Okay
[09/04/26, 9:35:00 PM] Chitraksh: Let him come then
[09/04/26, 9:35:23 PM] Chitraksh: Did he give any estimate on how much is he going to charge?
[09/04/26, 9:37:45 PM] Frankie Alicea: No
[09/04/26, 9:37:48 PM] Frankie Alicea: We will see now
[09/04/26, 9:38:03 PM] Frankie Alicea: Guarantee you its less than 3-4k
[09/04/26, 9:38:12 PM] Frankie Alicea: 🤣
[09/04/26, 9:38:41 PM] Chitraksh: Bro he’s here
[09/04/26, 9:38:46 PM] Chitraksh: Hop in
[09/04/26, 10:05:38 PM] Frankie Alicea: Im so sorry
[09/04/26, 10:05:41 PM] Frankie Alicea: 😭
[09/04/26, 10:05:54 PM] Frankie Alicea: Im gonna cry when we get off the phone
[09/04/26, 10:10:29 PM] Chitraksh: I have a idea
[09/04/26, 10:10:42 PM] Chitraksh: Will let you know after he’s done
[09/04/26, 10:21:25 PM] Frankie Alicea: ‎Voice call, ‎13 min
‎[10/04/26, 1:03:10 AM] Chitraksh: ‎<attached: 00001343-PHOTO-2026-04-10-01-03-10.jpg>
[10/04/26, 1:34:01 AM] Frankie Alicea: ‎Voice call, ‎3 min
[10/04/26, 1:50:00 AM] Chitraksh: When will you reach?
[10/04/26, 1:59:38 AM] Frankie Alicea: 25 mins if its too late go rest brother
[10/04/26, 1:59:46 AM] Frankie Alicea: Alot of traffic
[10/04/26, 2:19:28 AM] Frankie Alicea: Walking in my house now if ur up
[10/04/26, 2:19:48 AM] Frankie Alicea: I need to use bathroom first then im good
[10/04/26, 2:37:24 AM] Chitraksh: Bro give me 15-20mins
[10/04/26, 2:37:27 AM] Chitraksh: Max
[10/04/26, 2:42:28 AM] Frankie Alicea: All good broski
[10/04/26, 2:42:35 AM] Frankie Alicea: Send link when youre ready
[10/04/26, 2:42:38 AM] Frankie Alicea: Ima smoke rn
[10/04/26, 3:05:03 AM] Frankie Alicea: Im ready when you are brother
[10/04/26, 3:05:08 AM] Frankie Alicea: I have to leave in 1 hour
[10/04/26, 3:06:09 AM] Chitraksh: sending
[10/04/26, 3:07:05 AM] Frankie Alicea: thx bro
[10/04/26, 3:07:44 AM] Chitraksh: https://meet.google.com/rwd-yhww-yeu
[10/04/26, 4:09:42 AM] Frankie Alicea: ‎Missed voice call, ‎Tap to call back
[10/04/26, 4:10:11 AM] Frankie Alicea: the meeting froze brother
[10/04/26, 4:10:23 AM] Frankie Alicea: i didnt hear what u said before the call ended
[10/04/26, 4:10:36 AM] Chitraksh: ‎Voice call, ‎1 min
[10/04/26, 7:30:52 AM] Frankie Alicea: r u up brother
‎[10/04/26, 7:37:54 AM] Frankie Alicea: LegalZoom_Strategy_Brief.pdf • ‎2 pages ‎<attached: 00001365-LegalZoom_Strategy_Brief.pdf>
[10/04/26, 7:39:16 AM] Frankie Alicea: thoughts?
[10/04/26, 7:39:35 AM] Frankie Alicea: https://www.legalzoom.com/attorneys/
[10/04/26, 7:41:07 AM] Frankie Alicea: lets call them  next time you have 15 mins which hopefully soon haha
[11/04/26, 2:45:33 PM] Chitraksh: Good morning brother
[11/04/26, 2:45:49 PM] Chitraksh: Sorry I got wrapped around in some work
[11/04/26, 2:46:14 PM] Chitraksh: Let’s test the workflow with inventory today
[11/04/26, 2:46:48 PM] Chitraksh: I think it is up for initial testing before I tweak it more based on your feedback and our discussion
[11/04/26, 8:16:58 PM] Frankie Alicea: No worries I know if ur not messaging me ur busy
[11/04/26, 8:17:13 PM] Frankie Alicea: Good morning brother
[11/04/26, 8:17:30 PM] Frankie Alicea: Let me know when ur ready and its done
[11/04/26, 8:17:53 PM] Frankie Alicea: We have to hurry up and launch im tired of this fucking job we need some mrr
[11/04/26, 8:18:19 PM] Frankie Alicea: Even just 10k-20k mrr so we could work full time
[11/04/26, 8:18:23 PM] Frankie Alicea: Lets fucking go bro
[11/04/26, 8:18:34 PM] Frankie Alicea: 🚀
[11/04/26, 8:20:10 PM] Chitraksh: I am for sure ready for our 1st phase of testing today
[11/04/26, 8:20:30 PM] Chitraksh: When will you be free let me know
[11/04/26, 8:24:30 PM] Frankie Alicea: Im ready now i am ready whenever you are brother. I only have one commitment today. I need to bring my daughters to meet my mom so they can go with her for the day. It is a round trip of 1 hour. In about 3-4 hours, other than that I am available all day and night bro
[11/04/26, 8:25:49 PM] Chitraksh: Okay let’s do a few calls quick I have a commitment but in like an hour
[11/04/26, 8:26:25 PM] Chitraksh: Or we can do it at 10-10:30ish
[11/04/26, 8:26:32 PM] Chitraksh: Whatever you prefer
[11/04/26, 8:27:14 PM] Frankie Alicea: Lets do it broski, let me grab something to drink and I will hop on gmeet with u
[11/04/26, 8:27:18 PM] Frankie Alicea: Send link broski
[11/04/26, 8:27:25 PM] Chitraksh: Sending
[11/04/26, 8:27:28 PM] Frankie Alicea: Bet
[11/04/26, 8:31:56 PM] Chitraksh: https://meet.google.com/ugd-eegn-oxu
[11/04/26, 8:39:55 PM] Frankie Alicea: ur frozen bro
[11/04/26, 8:40:41 PM] Chitraksh: Yes I think it’s because of storage
[11/04/26, 8:40:45 PM] Chitraksh: Give me 2 mins
[11/04/26, 8:40:55 PM] Chitraksh: I am re starting my laptop
[11/04/26, 8:41:38 PM] Frankie Alicea: bet
[11/04/26, 8:41:59 PM] Frankie Alicea: bro the agent is tweeking
[11/04/26, 8:42:13 PM] Frankie Alicea: listen to my call when u get back online
[11/04/26, 11:21:26 PM] Chitraksh: Hey bro
[11/04/26, 11:21:29 PM] Chitraksh: I am free now
[11/04/26, 11:21:54 PM] Chitraksh: Do you wanna discuss now or do it at night after I have some time to go through transcripts and make adjustments
[11/04/26, 11:22:07 PM] Chitraksh: I think that would be more efficient what do you think
[11/04/26, 11:50:56 PM] Frankie Alicea: More efficient later or now brother?
[11/04/26, 11:51:09 PM] Frankie Alicea: Oh yes
[11/04/26, 11:51:10 PM] Frankie Alicea: I agree
[11/04/26, 11:51:16 PM] Frankie Alicea: Lets do it after
[11/04/26, 11:51:22 PM] Frankie Alicea: Ping me
[12/04/26, 10:08:12 PM] Frankie Alicea: Barbershop Software | Booking & Management https://share.google/Cx2uxF0NhGj6Cj5lc
[12/04/26, 10:08:28 PM] Frankie Alicea: We need these type of screenshots on our site too
[12/04/26, 10:08:33 PM] Frankie Alicea: This is fire
[12/04/26, 10:08:38 PM] Frankie Alicea: 🔥
[12/04/26, 10:08:52 PM] Frankie Alicea: Lmk when you're ready to work brother
[12/04/26, 10:09:02 PM] Frankie Alicea: Good morning
[12/04/26, 10:09:06 PM] Frankie Alicea: 🫡
[12/04/26, 10:09:47 PM] Frankie Alicea: Also how do we create a thumbnail for our site / link?
[12/04/26, 10:13:03 PM] Frankie Alicea: Lets change the example from plumbing to:

1 example conversation in automotive 

1 example of life insurance
[12/04/26, 10:13:23 PM] Frankie Alicea: On our site
[12/04/26, 10:14:46 PM] Frankie Alicea: We need more CTA buttons
[12/04/26, 10:15:08 PM] Frankie Alicea: To book appointments on our site as well. We never set that up.
[12/04/26, 10:15:49 PM] Frankie Alicea: And I also wanna work on the ai agents alone, nothing else for a an hour or two. No rushing. Just dialing it in. Everything. So we can finally launch.
[12/04/26, 10:16:55 PM] Frankie Alicea: Lets wrap up everything soon brother. Im thinking we actually work together like we had proposed before. Lets hop on gmeet and work for a full day. The entire day. 2 days of that and we will get so much shit done bro.
[12/04/26, 10:17:05 PM] Frankie Alicea: We're very close and we need one big final push.
[12/04/26, 10:17:13 PM] Frankie Alicea: Talk soon brother
[12/04/26, 10:17:17 PM] Frankie Alicea: 🚀
[12/04/26, 10:19:53 PM] Frankie Alicea: The ai voice in our website as well
[12/04/26, 10:20:20 PM] Frankie Alicea: Im gonna go grab breakfast + coffee so ill be ready to lock in when you text me
‎[12/04/26, 10:23:14 PM] Frankie Alicea: ‎<attached: 00001426-PHOTO-2026-04-12-22-23-14.jpg>
[12/04/26, 10:23:40 PM] Frankie Alicea: I want to have something similar with a large image like the one here but from our site
[12/04/26, 11:29:51 PM] Frankie Alicea: I see the inventory is holding us back too. We can totally disconnect it for now and then begin to work on it again after we launch pilot. I think that would be more effective unless we can have it fixed by today. What are your thoughts? Let me know when youre done testing brother. Im available all day and night. Talk soon.
[12/04/26, 11:32:33 PM] Chitraksh: Hi bro I will ready in a bit I was testing a few things here and there
[12/04/26, 11:32:45 PM] Chitraksh: I think you’re right
[12/04/26, 11:34:08 PM] Frankie Alicea: Im only trying to think and act like a ceo and support the cto bro
[12/04/26, 11:34:11 PM] Frankie Alicea: No more emotions
[12/04/26, 11:34:14 PM] Frankie Alicea: Or at least less
[12/04/26, 11:34:18 PM] Frankie Alicea: All strategy
[12/04/26, 11:34:21 PM] Frankie Alicea: To get us launched
[12/04/26, 11:34:24 PM] Chitraksh: Let’s do everything we can to fix it today or else we’ll launch without the inventory and show them that we have it figured out we’ll let you test you before we add it
[12/04/26, 11:34:34 PM] Frankie Alicea: 100% agree brother
[12/04/26, 11:35:20 PM] Chitraksh: It’s a great feature to have but If I don’t have atleast 2 weeks of testing data with this I cannot commit 100% functionality
[12/04/26, 11:35:29 PM] Chitraksh: Just like how I can for other things
[12/04/26, 11:35:47 PM] Frankie Alicea: Yup that makes sense
[12/04/26, 11:36:02 PM] Frankie Alicea: We can deploy it after
[12/04/26, 11:36:06 PM] Frankie Alicea: 💯
[12/04/26, 11:36:22 PM] Frankie Alicea: When are you available to work on gmeet
[12/04/26, 11:36:28 PM] Chitraksh: And anyways they didn’t expect inventory in pilot right?
[12/04/26, 11:36:34 PM] Frankie Alicea: Nope
[12/04/26, 11:36:41 PM] Frankie Alicea: But it would be an amazing sell
[12/04/26, 11:36:45 PM] Frankie Alicea: If we could lock it in
[12/04/26, 11:37:00 PM] Frankie Alicea: So we're good to go without it for now
[12/04/26, 11:37:11 PM] Chitraksh: If we can we will bro I’ll try my best
[12/04/26, 11:37:20 PM] Chitraksh: But it’s getting too late
[12/04/26, 11:37:30 PM] Frankie Alicea: Ok
[12/04/26, 11:37:33 PM] Chitraksh: Over patience is also not too good
[12/04/26, 11:37:33 PM] Frankie Alicea: No worries brother
[12/04/26, 11:37:38 PM] Frankie Alicea: I agree
[12/04/26, 11:37:50 PM] Frankie Alicea: Thats why I wanna launch it already
[12/04/26, 11:37:55 PM] Chitraksh: I meant for the inventory
[12/04/26, 11:38:08 PM] Chitraksh: For the meeting give me 1.5 hrs
[12/04/26, 11:38:09 PM] Chitraksh: From now
[12/04/26, 11:38:17 PM] Frankie Alicea: Lets discuss moving forward today at that time
[12/04/26, 11:38:20 PM] Frankie Alicea: Sounds good bro
[12/04/26, 11:38:35 PM] Chitraksh: It’s one of my friend’s birthday just going to wish her then I’ll be back
[12/04/26, 11:38:49 PM] Frankie Alicea: Ok broski be safe see you soon
‎[13/04/26, 1:35:01 AM] Frankie Alicea: ‎<attached: 00001463-PHOTO-2026-04-13-01-35-01.jpg>
[13/04/26, 1:35:05 AM] Frankie Alicea: Done
[13/04/26, 2:34:09 AM] Chitraksh: Yes bro I received it
[13/04/26, 2:37:29 AM] Chitraksh: Hey bro it’s late here I have a important thing I need to submit to my uni this morning
[13/04/26, 2:37:39 AM] Chitraksh: If you don’t mind let’s do the meet tonight?
[13/04/26, 2:37:48 AM] Chitraksh: Whatever time works for you
[13/04/26, 8:06:09 AM] Frankie Alicea: Of course brother
[13/04/26, 8:06:11 AM] Frankie Alicea: Don't worry
[13/04/26, 8:06:14 AM] Frankie Alicea: Go rest
[13/04/26, 8:06:25 AM] Frankie Alicea: Lets do it when youre rested and not busy
[13/04/26, 8:06:44 AM] Frankie Alicea: But lets schedule a few days to knock hella shit out together bro
[13/04/26, 8:06:55 AM] Frankie Alicea: So we can start wrapping everything up brother
[13/04/26, 8:07:02 AM] Frankie Alicea: We're so close to being ready
[13/04/26, 8:07:45 AM] Frankie Alicea: If we work together on gmeet for 3 full work days 8 hours each day bro we will get so much work done and will be ready to launch literally in a week or two
[13/04/26, 8:08:06 AM] Frankie Alicea: I know we keep saying that but if we work more and together. Not separately.
[13/04/26, 8:08:22 AM] Frankie Alicea: That will get so much more work done. Can't wait to do this with you broski
[13/04/26, 8:08:31 AM] Frankie Alicea: 🔥
[13/04/26, 8:34:59 AM] Chitraksh: You’re absolutely right brother
[13/04/26, 8:46:51 AM] Chitraksh: I am just doing the remaining formalities in college today submitting my internship reports and stuff then I’ll be free then this whole week
[13/04/26, 8:47:07 AM] Chitraksh: Since it’s already weekdays what will your schedule look like
[13/04/26, 8:56:26 AM] Frankie Alicea: Sounds good broski
[13/04/26, 8:56:35 AM] Frankie Alicea: So because its weekdays im fucked
[13/04/26, 8:56:40 AM] Frankie Alicea: 😭
[13/04/26, 8:56:58 AM] Frankie Alicea: I can only work full day Saturdays and Sundays
[13/04/26, 8:57:57 AM] Frankie Alicea: But I can work every night like 7-9 so if we do that for 4 nights that's an extra day and we can get 3 days of work done this week
[13/04/26, 8:58:12 AM] Frankie Alicea: Lmk what you think
[13/04/26, 2:24:13 PM] Chitraksh: Done bro
[13/04/26, 2:24:31 PM] Chitraksh: That works for me and it will be morning here I’ll be fresh as hell
‎[15/04/26, 3:19:14 AM] Frankie Alicea: ‎<attached: 00001491-PHOTO-2026-04-15-03-19-14.jpg>
[15/04/26, 3:19:24 AM] Frankie Alicea: see u later broski
[15/04/26, 3:22:25 AM] Chitraksh: Yes sir
[15/04/26, 3:22:40 AM] Chitraksh: I will look into it in the morning
‎[15/04/26, 3:37:02 AM] Frankie Alicea: Screenshot_14-4-2026_15645_dashboard.stripe.com.jpeg ‎<attached: 00001495-Screenshot_14-4-2026_15645_dashboard.stripe.com.jpg>
‎[15/04/26, 3:43:29 AM] Frankie Alicea: ‎<attached: 00001496-PHOTO-2026-04-15-03-43-29.jpg>
[15/04/26, 3:43:35 AM] Frankie Alicea: finally brother
[15/04/26, 3:43:48 AM] Frankie Alicea: WE ARE FUCKING COOKING
‎[15/04/26, 3:44:04 AM] Frankie Alicea: ‎<attached: 00001499-GIF-2026-04-15-03-44-04.mp4>
[15/04/26, 3:59:12 AM] Frankie Alicea: https://share.google/aimode/H3D6J3RV1VN2qKIRe
[15/04/26, 4:00:14 AM] Frankie Alicea: We will use bridge to pay you if it works, stripe acquired it. Its for international payment. In seconds not days is what they advertise. Lets set it up bro.
[15/04/26, 7:14:16 PM] Frankie Alicea: Broski
[15/04/26, 7:14:50 PM] Frankie Alicea: Lmk after you see the updates
[15/04/26, 7:14:59 PM] Frankie Alicea: We're cooking
[15/04/26, 7:15:06 PM] Chitraksh: Bro I saw it got hyped up then forgot to text you
[15/04/26, 7:15:14 PM] Chitraksh: 🔥🔥🔥🔥
[15/04/26, 7:15:15 PM] Frankie Alicea: 💀
[15/04/26, 7:15:35 PM] Chitraksh: I will add the stripe link to our website as well
[15/04/26, 7:15:46 PM] Frankie Alicea: 🔥
[15/04/26, 7:15:55 PM] Frankie Alicea: Lets connect today
[15/04/26, 7:16:04 PM] Chitraksh: Yes sir
[15/04/26, 7:16:10 PM] Chitraksh: When will you be free?
[15/04/26, 7:16:32 PM] Chitraksh: Yes sir
[15/04/26, 7:16:37 PM] Frankie Alicea: Can I call really quick
[15/04/26, 7:16:41 PM] Chitraksh: Yes
[15/04/26, 7:16:44 PM] Chitraksh: ‎Voice call, ‎4 min
[15/04/26, 7:22:23 PM] Chitraksh: ‎Voice call, ‎6 min
[16/04/26, 3:01:28 AM] Frankie Alicea: got home too late broski
[16/04/26, 3:02:07 AM] Frankie Alicea: i will be back this evening. i am done at 530pm and am home around 6pm
[16/04/26, 3:02:10 AM] Frankie Alicea: talk soon
[16/04/26, 1:27:05 PM] Chitraksh: Hi bro
[16/04/26, 1:27:54 PM] Chitraksh: Let’s meet for sometime in the morning to discuss
[16/04/26, 5:00:06 PM] Frankie Alicea: Yesir
[16/04/26, 5:48:27 PM] Frankie Alicea: I can call you in a couple hours and we can work over the phone i dont need my laptop
[16/04/26, 5:57:32 PM] Chitraksh: Yes bro done
[16/04/26, 8:49:32 PM] Frankie Alicea: Ill be ready around minutes
[16/04/26, 8:49:42 PM] Frankie Alicea: Does that work
[16/04/26, 8:50:12 PM] Frankie Alicea: 15*
[16/04/26, 8:50:29 PM] Frankie Alicea: 15-20 mins
[16/04/26, 9:03:40 PM] Frankie Alicea: ‎Missed voice call, ‎Tap to call back
[16/04/26, 9:13:09 PM] Frankie Alicea: ‎Missed voice call, ‎Tap to call back
[16/04/26, 9:13:59 PM] Frankie Alicea: ‎Missed voice call, ‎Tap to call back
[16/04/26, 9:16:33 PM] Frankie Alicea: ‎Missed voice call, ‎Tap to call back
[16/04/26, 10:54:21 PM] Chitraksh: ‎Voice call, ‎No answer
[16/04/26, 11:09:11 PM] Frankie Alicea: ‎Voice call, ‎4 min
[16/04/26, 11:27:33 PM] Frankie Alicea: ‎Voice call, ‎Answered on other device
[16/04/26, 11:56:24 PM] Frankie Alicea: ‎Voice call, ‎9 min
[17/04/26, 12:27:05 AM] Frankie Alicea: ‎Missed voice call, ‎Tap to call back
[17/04/26, 12:27:50 AM] Frankie Alicea: So she did better on this call in certain areas and worse in others
[17/04/26, 12:27:59 AM] Frankie Alicea: Pls listen to call for updates
[17/04/26, 12:28:16 AM] Frankie Alicea: Also she hung up without completing the task
[17/04/26, 12:30:11 AM] Chitraksh: ‎Voice call, ‎4 min
[17/04/26, 12:54:10 AM] Frankie Alicea: ‎Voice call, ‎3 min
[17/04/26, 1:58:34 AM] Frankie Alicea: Im gonna send you an email rn brother
[17/04/26, 1:58:52 AM] Frankie Alicea: Did you have a chance to update the agent after my feedback or not yet?
[17/04/26, 1:59:13 AM] Frankie Alicea: I want to know if I should keep testing it or wait
[17/04/26, 1:59:17 AM] Frankie Alicea: Lmk
[17/04/26, 2:46:38 AM] Frankie Alicea: Check your email bro and lmk if thats doable pls brother
[17/04/26, 2:46:40 AM] Frankie Alicea: 🙏🏻
[17/04/26, 2:46:43 AM] Frankie Alicea: ‎Voice call, ‎37 sec
[17/04/26, 2:51:46 AM] Frankie Alicea: Is that doable brother or really difficult?
[17/04/26, 2:59:24 AM] Chitraksh: ‎Voice call, ‎2 min
[17/04/26, 3:05:04 AM] Chitraksh: ‎Voice call, ‎5 min
[17/04/26, 3:05:16 AM] Frankie Alicea: Or is it better to send 4 original stubs for you to edit? What is easier and faster? You doing all 4 or using ai for the final 3?
[17/04/26, 3:33:53 AM] Chitraksh: Can you send me the original 4
[17/04/26, 3:40:48 AM] Chitraksh: One stub is not enough to guarantee exact future stubs.

Regular and overtime math is clear, but extra earnings are not.

Taxes cannot be guaranteed exactly from one stub alone.

YTD values will only be correct if every recurring earning and deduction rule is confirmed.

I can make projections, but not promise exact payroll-perfect stubs from this file alone.
[17/04/26, 3:44:43 AM] Chitraksh: also regarding the addition 

I checked the stub carefully. 46.89 is correct because the after-tax deduction lines add up exactly to 46.89. But I cannot justify 412.76, because the visible tax lines add up to 627.32, not 412.76. I also cannot justify 694.31, because the visible before-tax deduction lines add up to 674.31, not 694.31. Please confirm whether I should follow the summary totals, the detailed line items, or some adjusted numbers you already know are correct.
[17/04/26, 3:50:30 AM] Frankie Alicea: ‎Missed voice call, ‎Tap to call back
[17/04/26, 3:57:52 AM] Frankie Alicea: 80 hours regular and 24 hours overtime 

On first check 

80 hours regular and 20 hours overtime 

On second check 


60 regular hours 

25 hours overtime 

On third check 


40 regular hours 

19 overtime hours 

On 4th check 


Use all california deductions snd this is the fix brother
[17/04/26, 3:57:55 AM] Frankie Alicea: ‎Missed voice call, ‎Tap to call back
[17/04/26, 4:00:51 AM] Frankie Alicea: Disregard all other data and use this to populate all fields for all four stubs that way it will be all uniform data based on $36.37 base pay and let everything else be autocalculated based on California state tax and deductions. Thats all it has to be.
[17/04/26, 4:00:56 AM] Frankie Alicea: Thank you brother
[17/04/26, 4:01:00 AM] Frankie Alicea: Call me when u can
[17/04/26, 4:01:31 AM] Frankie Alicea: Also lets setup our Claude and n8n
[17/04/26, 4:01:46 AM] Frankie Alicea: I wanna see 4.7 bro!
[17/04/26, 4:01:49 AM] Frankie Alicea: 🔥
[17/04/26, 4:15:25 AM] Frankie Alicea: ‎Voice call, ‎35 min

```

---

## 7. RETAIL INVENTORY TEST CALL TRANSCRIPT (full)

(Mercedes Retail AI · Patent Strategy · GLS Lead Flow — 2026-04-11, 20:32 PDT)

```

20:32 - What's up, brother? Good morning. Good morning. I missed you. It's finally the day that we test the inventory, bro. We've been talking about it for like, it's been four months. Here we are. Here we are, bro. Everything is set up. Now we're just adding features. Here we are. It's it's been it's been a journey, brother. And and really, now the journey actually can begin. Can we talk? Actually begins. Yeah. Yeah, that was part of the journey. Like now we can actually leave the home base. We can leave the office now. You know, to tell people and show case our company. So yeah, it's a beautiful thing. Thank God, bro. I also talked to my one of my teachers for the international patent because like now, 
20:34 - of the international patent because like now the amount of tech that we have, the combination of retail and it and the custom dashboard, we should apply for a patent. That will increase the value of our company as well. How? Now, we don't have to go too deep in it. Yeah. But with the patent cover, because obviously those other companies that were using are not ours, right? But the way that we use them is ours. Yeah. And they cannot, they cannot copy the conversation flow in retail itself, right? Because it will be patented. Right? We cannot, obviously, we cannot tell them that you cannot connect your retail account with a webhook, right? That is too common. But our workflows is 100% owned by us. The method in which the conversation flow is 100% owned by us. The dashboard, though, is 100% code. So obviously, it's owned by us. Right? Okay. Okay. That's sick. Okay. And even, even for the things that we don't own in patent, we can get a copyright, right? 
20:35 - we can get a copyright, right? Really? Yeah, yeah. What? You have the number? Oh, am I supposed to be calling right now? Yeah, yeah. So we can do it like I have only set it up in the inbound number as of now. If like when I have corrected it, the function itself is there in Rita. I can just copy and paste to outbound as well. Okay. Let me look real quick. Hold on. Let me see if I got both of them. I think I do. Okay, so am I supposed to be calling the 925 number? Yeah, correct, correct. Yeah. Okay. Hey, put in my my my note taker for a second, please. Can you add it? Oh, yeah, sure. One second. Uh it's not there in the This call is being recorded and analyzed for quality and training purposes. 
20:36 - looking through. Um, are you looking to explore a new vehicle or is this like a current car? Um, I was calling to explore a new vehicle. It doesn't matter what I do right now, right? Just anything. Anything. CPU, new, anything works. Open up on a new model. Before I go into details, are you actively looking to make a change or still in the early research phase? Definitely in the early research uh stage. What are you driving now and what's the main reason you're considering Mercedes? 2019 Model X. Um, I need more room and I want something newer and something bigger. Got it. So, more space and a fresh upgrade are the priorities. Are you thinking brand new or would certified pre-owned work if the specs are perfect? Certified pre-owned is fine. 
20:37 - me, the GLS is really worth a look. Three rows of 84.7 cubic feet of cargo space, which is a serious upgrade from the Model X. Feeling the drive is different from specs on the screen. Would you be against a private viewing this Thursday morning, or is afternoon better for you? Um, what what are the specs on that? Like, do you have any in the inventory right now? What are the colors, you know, what are the specs, the trim? What do you have right now? One moment. Pulling that up right now. Fire. Let me get our inventory specialist to pull up the exact details on available GLS units. Colors, trims, mileage, all of it. Can I get your name so we can make this a bit more personal? Frankie.```

---


## 8. HOW TO USE THIS BRIEF IN A NEW CLAUDE SESSION

Paste the whole file into the new session with a prompt like:

> Here is the full brief for my Oraya AI project — original instruction,
> canonical facts, WhatsApp chat, test-call transcript, and current
> dashboard state. Please update `src/components/HeroDashboard.tsx`
> (and any sibling components that need it) to reflect the latest pilot
> numbers and any new directions I give you below.
>
> <paste brief here>
>
> Now, the new direction I want today is: ...

The new session will have everything it needs — no file uploads required.

## 9. FILE PATHS TO TOUCH (for a new session)

- `src/components/HeroDashboard.tsx` — main dashboard component
- `src/components/VoiceAI.tsx` — voice-agent call example
- `src/components/Hero.tsx` — hero copy + CTAs
- `src/components/Pricing.tsx` — plans
- `src/components/Testimonials.tsx` — quotes (Mercedes-of-South-Bay
  testimonial could land here once pilot generates one)
- `src/components/SocialProof.tsx` — integration logos
- `src/app/globals.css` — design tokens

## 10. QUICK SANITY CHECKS A NEW SESSION SHOULD RUN

```bash
cd oraya-ai
npx tsc --noEmit                      # zero errors expected
npx next build                        # full prod build
git remote -v                         # should show git@github.com:... (SSH)
bash scripts/push.sh "msg"            # commits + pushes
```
