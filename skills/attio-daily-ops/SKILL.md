---
name: attio-daily-ops
description: Weekday CRM summary, next-step sweep, and exception report. Use for daily counts, stale entries, or HoOps digest.
---

# Daily ops

Run only on an explicit weekday job or when HoOps asks. Stay silent if nothing changed.

## Query (fresh, every time)

1. `whoami`
2. Count RPP and ES entries grouped by stage (`run-basic-report` or paged `list-records-in-list`)
3. Open entries with empty `next_step` or `next_step_date`
4. Dual-track: people with both list entries at Call Booked+
5. `outreach_hold` = Do Not Contact (confirm sender pause was requested)
6. Deals: open + Won + commission_status = Owed
7. Partners by `partner_stage`
8. Unknown-campaign HOLD queue (local ledger)
9. Roll `quota_period` if the month changed; recount credits
10. Affiliates with `referrals_this_month` = 0
11. Affiliates with `referrals_owed` > 0
12. Re-score upsells; count Prime RPP and Prime Mastermind

## Report to HoOps (short)

- New people/entries since last report
- Stage moves (from notes titled with today’s date, or historic `stage.active_from` if queried)
- Booked / no-shows still Call Booked
- Commissions owed
- Partners by stage
- Defects: missing next step, guessed pipeline, missing email on Call Booked, dual-track without pause packet
- Affiliates at 0 referrals this month (count + link to the view)
- Still owe (sum of `referrals_owed`)
- Prime RPP / Prime Mastermind counts

No narrative. Counts + links.

## Do not

- Auto-resolve to Lost (Revenue Engine said recommend-only for 2 weeks; never enabled)
- Burn workflow credits for the sweep
- Treat CURRENT-STATE.md counts as today’s numbers
