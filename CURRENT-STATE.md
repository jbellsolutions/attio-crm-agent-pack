# Current-state snapshot (evidence, not live)

Collected from GrokBot backups and Attio CRM Operator work dated **2026-09-30 through 2026-10-08**. Re-query Attio before acting. Do not treat these counts as today’s truth.

## Workspace

| Field | Evidence |
|---|---|
| Name | Revenue Partners |
| Slug | `revenuepartners` |
| ID | `85fa8363-8b4c-42da-89d4-691a0a988223` |
| Login seen | justin@usingaitoscale.com (admin) |
| Members (Oct 6) | Justin Bellware (admin), Xander Viaña (member) |
| Plan (operator belief) | Plus — 5 objects, 4 used, no formulas (Sep 30). Plan tier is **not** exposed via MCP; confirm Billing in UI. |
| App URL | https://app.attio.com/revenuepartners |

## Objects (Oct 6 MCP inspection unless noted)

| Object | Records then | Notes |
|---|---|---|
| people | 2,660 (2,559 on Oct 4) | Mostly Gmail/Calendar sync from Sep 30. Do not treat as leads. |
| companies | 1,636 (Oct 4) | Same sync warning. |
| deals | 1 real-ish on Oct 6 (value $0); 7 on Oct 4 including 6 DEMO | DEMO deleted Oct 5. |
| partners (custom) | 0 live after DEMO delete; 3 DEMO on Oct 4 | Custom object from Sep 30 schema. |

## Lists

| Name | Slug | ID | Parent |
|---|---|---|---|
| Expert Series | `expert_series` | `5b1fc79a-d0d4-43b9-967c-0d988a9d7601` | people |
| Revenue Partner Program | `partner_relationships` | `4aa6ec09-1289-4d14-8582-01eeda781dab` | people |
| Dream 100 Partners | `dream_100_partners` | (created by Justin Oct 3) | people |
| Dream 500 Partners | (exists Oct 6: 160 then 221 after +26) | | people |
| Partner Plan Leads | `partner_plan_leads` | | people — 1 entry, no stage; possibly legacy |

**Keep the slug `partner_relationships`.** Renaming the list in the UI does not require a slug change; changing the slug breaks every script.

## Person custom attributes (built Oct 4)

| Slug | Type | ID |
|---|---|---|
| `expert_series_status` | select | `a02cb360-b899-4e43-b83c-0c5eab3af85e` |
| `partner_pipeline_status` | select (UI title: Revenue Partner Program status) | `008c95be-c790-416b-adae-6f2eabcc09f8` |
| `outreach_hold` | select | `bb642b70-5fa2-4f47-90b5-551d7bd54b92` |
| `outflo_lead_id` | text | `0d94a254-c553-49a4-b513-391a339bed8d` |

`outreach_hold` options include None, Hold - Expert Series in progress, **Hold - Revenue Partner Program in progress** (renamed Oct 5, option `1ccd55a9-541c-474f-8a99-be6ac6cbf7a7`), Hold - Both in progress, Do Not Contact.

Referral check-in fields: planned `referral_checkin`, `referral_checkin_due`, `referral_bucket`, `last_conversation_context`. On Oct 6 morning they were created via REST for 190 people (operator chat). Earlier the same day MCP-only tagging used **notes** because MCP had no create-attribute tool. If both exist, prefer attributes; do not double-tag.

## Shared list entry fields (both pipelines)

`source_channel`, `source_campaign`, `sender_account`, `first_reply_date`, `last_activity_date`, `next_step`, `next_step_date`, `source_thread_id`, `sequence_paused`, `pause_reason`, `related_deal` → deals. RPP also has `partner_record` → partners.

`source_channel` options: Outflo LinkedIn, Instantly Email, Social, Referral, Inbound, Event, Manual.

## Deals custom fields (Sep 30 schema)

`referred_by_partner`, `referral_offer` (Discount for Intro, Trial for Referrals, Commission, None), `lead_source`, `reply_date`, `commission_amount`, `commission_status` (Not Due, Owed, Paid), plus native `value` (USD) and required owner.

On Won: commission = deal value × partner `commission_rate_pct`; set amount; status Owed. That rule still applies if/when Won is used.

## Campaign → pipeline (Oct 4 design; confirm before use)

**Expert Series:** Outflo `Real Experts Series` (`b7b0380a-a406-447c-a88b-76c251f89f5f`).

**Revenue Partner Program:** Outflo `Newest Main Affiliate Template` (`ccf5785e-0c72-4a96-bb76-a9000873136d`); paused Outflo campaigns 1–4 as backfill only if Justin confirms.

Client workspaces (MSP - Rush IT, SpeakerAgent AI, Uncommon Man, Veluro, solar, Event Girl): exclude unless told.

Instantly: no key on the CRM agent historically. Reply Agent is the interim Instantly → Attio path. Routine folder `instantly-reply-attio` existed; webhook wiring was incomplete as of Oct 7 handoff.

## Booking URLs (do not invent others)

- https://cal.com/usingaitoscale/aiintegraterz
- https://map.truerevenuepartnerships.com
- https://experts.truerevenuepartnerships.com

A booking page click is not Call Booked. Calendar sync may create the Person with no list entry — assign pipeline from event type, do not guess when the title disagrees with the page (Andrey: Experts page, event titled Power Partnerships Discovery).

## Open Justin decisions (from Revenue Engine, Oct 6)

Still open unless a later chat closed them: deal-value definition and defaults, un-archive Won as Partner Live, sending identity, SMS provider, copy approval, which Instantly/Outflo campaigns feed Attio, GHL retirement, social channels, calendar-event → pipeline map.

## Routines (paused in Oct 7 handoff)

- Instantly reply → Attio (`instantly-reply-attio`) — webhook
- Daily CRM summary — weekdays

Do not enable from this file.

## Operator habits proven in live chat (Oct 6–7)

- Dual-track Kimberly: RPP Call Booked vs Expert Series Interested after no-show
- Sabbir: stay Interested until Zoom invite exists, then Call Booked; still need email
- Anthony Costantino: existing record, do not duplicate; hold equity wording
- Michael Kerans: filed Interested without email; cooling flag + checkback date
- Hassan Mansoor: queued, not filed, because fleet pause
- Dream 500 +26 platform partners at Identified, no outreach, Dream 100 unchanged
- Call Prep docs attached to person + company; stage does not move on a doc attach
- No-show stays Call Booked
