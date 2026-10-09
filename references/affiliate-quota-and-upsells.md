# Affiliate quota, attribution, and upsells

Decision: [0001](../docs/adr/0001-everyone-is-an-affiliate.md). Schema below is the operating design. It is **not live** until applied with REST + UI views. Do not pretend notes are these filters.

## What “comes in” means

Anyone this agent files from a real packet (reply, book, intro, Justin credit, Call Prep, Dream list that Justin approved to file).

Not affiliates: Gmail/Calendar-sync shells with no campaign/packet, Do Not Contact, Connect Med, Justin-personal (Andy Gwynn and anyone else tagged `automation_policy` = Justin-personal). They can still *receive* attribution if Justin names them as the referred person.

## Two layers of “referral”

| Layer | Meaning | Where it lives |
|---|---|---|
| **Quota credit** | One named intro this calendar month toward the 3 | List `affiliate_credits` + counters on the **affiliate** Person |
| **Commission** | Closed revenue from that intro | Deals `referred_by_partner` + Partners object when they are an active paid/partner record |

Quota is volume. Commission is money. Do not skip attribution because the deal has not closed.

Default: calendar month in the live timezone config (display Eastern). Reset counters when `quota_period` ≠ current `YYYY-MM`.

## Data model (People counters — required for views)

Attio saved views cannot “count list entries this month = 0” reliably. Mirror numbers onto People (sweep writes; Plus had no formulas).

| slug | type | rule |
|---|---|---|
| `is_affiliate` | checkbox | true on file, unless excluded above |
| `affiliate_quota` | number | default **3** |
| `quota_period` | text | `YYYY-MM` of the counters |
| `referrals_this_month` | number | count of counted credits in `quota_period` |
| `referrals_owed` | number | max(0, quota − this_month) |
| `last_referral_on` | date | last counted credit |
| `upsell_rpp` | select | `Not a fit` / `Watch` / `Prime` / `In conversation` / `Customer` / `Do not pitch` |
| `upsell_mastermind` | select | same options |
| `upsell_rpp_why` | text | one line, evidence |
| `upsell_mastermind_why` | text | one line, evidence |

## Data model (attribution rows)

**List** `affiliate_credits` (parent = **the referred Person**, not the affiliate). One entry = one credited intro. Saves the 5th custom-object slot for Partners.

Entry fields:

| slug | type |
|---|---|
| `stage` | status: Counted / Duplicate / Retracted |
| `referred_by` | record-reference → people (the affiliate) |
| `period` | text `YYYY-MM` |
| `credited_on` | date |
| `product` | select: `RPP` / `Mastermind` / `Unspecified` |
| `source` | select: `Justin message` / `Packet` / `Deal won` / `Manual` |
| `idempotency_id` | text unique |

Also set on the **referred** Person: `referred_by` (record-reference, fill if empty; if already set to someone else, note the conflict, do not overwrite).

Link a Deal when it exists: `deals.referred_by_partner` as today.

## Justin message → credit

Justin (or HoOps) can say: credit a referral to **Name**.

Required to apply:

1. Affiliate identity that matches one Person
2. **Referred** identity (name + email or LinkedIn or company). If missing, HOLD and ask once. Do not increment the quota on a nameless “+1”
3. Optional product: RPP or Mastermind
4. Idempotency: `justin-credit:<affiliate_id>:<referred_key>:<period>`

Packet `event`: `referral_credited`. See packet-contract skill.

Same referred person + same affiliate + same period → Duplicate, do not increment.

## Views (People object — UI; API cannot create them)

Workspace access full-access. Add columns. Justin’s click path: People → + Create view → Table.

### 1. No referrals this month

Filter: `is_affiliate` is true AND `referrals_this_month` = 0 AND `quota_period` = this month AND `outreach_hold` is not Do Not Contact.

Columns: Name, Company, referrals_this_month, last_referral_on, upsell_rpp, upsell_mastermind, next_step.

### 2. Still owe referrals

Filter: `is_affiliate` is true AND `referrals_owed` > 0 AND `quota_period` = this month AND hold ≠ DNC.

Sort: `referrals_owed` desc, then `last_referral_on` desc.

Same columns plus `affiliate_quota`.

### 3. Upsell — Revenue Partnerships

Filter: `upsell_rpp` is Prime or In conversation. Exclude Customer and Do not pitch and DNC.

### 4. Upsell — AI Guy Mastermind

Filter: `upsell_mastermind` is Prime or In conversation. Exclude Customer, Do not pitch, DNC.

If Justin cannot see a view, it is list/object access — not a missing view. See human-dashboard skill.

## Upsell scoring (recompute on packet + daily sweep)

Do not invent fit. Use evidence on the record (title, notes, pipeline stage, prior referrals, client flags). If evidence is thin, **Watch**, not Prime.

### Revenue Partnerships program (`upsell_rpp`)

Prime when 2+ of:

- Owner / founder / agency / consultant with an audience or book of clients
- Already made ≥1 counted referral, or asked about partner/rev-share
- RPP stage Call Held or later, or Expert Series Partner Promoted
- Explicit “I have people to send you”

Customer: they already bought / run RPP with us (Partners Active/Top Producer, or Deal Won for the program).

Do not pitch: DNC, competitor we excluded, Connect Med, Justin-personal.

### AI Guy Mastermind (`upsell_mastermind`)

Prime when 2+ of:

- Existing implementation/client relationship (Skool VIP, monthly build, “Your AI Guy” delivery)
- Asked for community, training, office hours, or “how do I do this myself”
- Paying or recently closed a delivery Deal
- Referral-ready warmth from a real two-way thread (not a sync ghost)

Customer: already in the Mastermind / $200 membership if that flag exists on the record.

Do not pitch: DNC, never talked, cold Prospected-only with no reply.

`In conversation` = an open thread or booked call about that product.

Write the why line from facts (“3 counted referrals in 2026-09; agency owner; asked about rev share 2026-10-06”). No slogans.

## Sweep

On daily ops: if `quota_period` ≠ current month, set this_month = 0, owed = quota, period = current, then recount from `affiliate_credits` Counted rows. Re-score upsells. Report: owed total, zero-referrers, Prime RPP count, Prime Mastermind count.
