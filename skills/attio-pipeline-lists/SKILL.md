---
name: attio-pipeline-lists
description: Move Attio list stages, dual-track people, outreach holds, and next steps. Use for Expert Series or Revenue Partner Program.
---

# Pipeline lists

People are facts. **Lists are pipelines.** One Person, one entry per list, independent stages. Notes/tasks/email/calendar live on the Person.

Slug `partner_relationships` is the Revenue Partner Program. Do not rename the slug.

## Assert an entry

1. Find existing entry (`list-records-in-list` filtered by parent, or REST list record entries).
2. If none, `add-record-to-list` / upsert-by-parent. MCP `add-record-to-list` returns the existing entry by default (`allow_duplicates` false).
3. If MCP `update-list-entry-by-record-id` errors on 0 or >1 entries, use `entry_id`.

## Stage discipline

Forward only, except Lost, Nurture, or Justin-approved rollback.

Set `last_activity_date` on every real event. Set `next_step` + `next_step_date` on every open entry. Empty next-step is a defect.

Mirror onto People:

- `expert_series_status`
- `partner_pipeline_status`

Recompute `outreach_hold`:

| Situation | Hold |
|---|---|
| Neither pipeline Call Booked+ | None |
| ES Call Booked+ | Hold - Expert Series in progress |
| RPP Call Booked+ | Hold - Revenue Partner Program in progress |
| Both | Hold - Both in progress |
| Unsubscribe / hard no | Do Not Contact |

When hold is set because the other pipeline is live: `sequence_paused` + `pause_reason` on the quieter entry, and **packet the campaign owner**. You do not pause Outflo/Instantly.

## Dual-track

If they already have Call Booked on one list, a “Yes” on another campaign is a note + possible Interested on the second list, not a brand-new lead and not an automatic stage jump. Flag dual-track in the reply to HoOps.

## Money vs list

RPP ends at Call Held until Justin un-archives Won as Partner Live. Outcomes: Nurture, Lost, or a Deal / Partners record.

Paid work (Skool VIP, implementation, client retainers) → Deals. Stage on the list does not move because a Google Doc was attached.

## No-shows and broken booking pages

Stay Call Booked. Log no-show. Wait for a new confirmed time. Map-link sent ≠ booked.
