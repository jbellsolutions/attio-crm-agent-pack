---
name: attio-human-dashboard
description: Operate Attio as a human — views, kanban, list access, record pages, UI-only steps. Use when Justin cannot see data or when API cannot do the job.
---

# Human dashboard

Attio’s product is lists in the sidebar, views (table/kanban), and record pages with activity (emails, meetings, notes, tasks, files).

## If Justin cannot see a list

Most common cause (Oct 6): **workspace list access = No access**. Admins only see lists they were added to. Workflows inherit workspace access unless overridden.

Fix (~15 min): List → Permissions → Workspace access **full-access** or add Justin with full-access. Source: https://attio.com/help/reference/managing-your-data/lists/lists-access

Object permissions (Read only / Read and write / Full access) are separate: https://attio.com/help/reference/managing-your-data/objects/manage-access-to-objects

Plus: workspace-wide only. Team/member matrix is Pro.

## Views (API cannot create layout)

REST can **list** views (`list-views-for-object`, `list-views-for-list`) and query by `filter_view_id`. It cannot build a kanban or pin columns.

For each pipeline list, Justin needs:

1. Kanban grouped by Stage (status attribute)
2. Table: Person, Stage, other-pipeline mirror, Outreach hold, Source campaign, Next step, Next step date
3. People view: Outreach hold is not None
4. Optional: time-in-stage target on kanban (cards go red). Source: https://attio.com/help/reference/managing-your-data/views/create-and-manage-kanban-views

**Affiliate / upsell (People object, after quota fields exist):**

5. **No referrals this month** — `is_affiliate`, `referrals_this_month` = 0, this `quota_period`, not DNC
6. **Still owe referrals** — `is_affiliate`, `referrals_owed` > 0, this period, not DNC
7. **Upsell — Revenue Partnerships** — `upsell_rpp` is Prime or In conversation
8. **Upsell — AI Guy Mastermind** — `upsell_mastermind` is Prime or In conversation

Exact filters: [affiliate-quota-and-upsells.md](../../references/affiliate-quota-and-upsells.md). New fields are not columns until added to the view.

New attributes are **not** columns on old views until someone adds them.

Kanban can show related-record attributes (company domain on a deal card). List views can show parent Person fields, **not** another list’s entry fields — that is why we mirror stages onto People.

## Record page habits

- Activity is the source of truth for email/calendar if sync is on.
- Notes for decisions and packet summaries. Title convention: `[Pipeline] Source event YYYY-MM-DD`.
- Tasks for Justin-personal actions (invites he must send).
- Files: Call Prep Docs go on Person **and** Company.
- Strength / last interaction can lag. Prefer packet timestamps when they conflict.

## Status order

After API creates statuses they sit at the end of the attribute. Drag in List → Stage settings (and the two People select mirrors) into the approved order.

Celebration flags (🎉) were cleared when Won/Published were archived. Re-enable only if Justin wants Partner Promoted or Campaign Sent celebrated.

## Sequences and Rules (product, Pro)

Sequences: warm email from synced mailbox, 12/hour and 200/day, 5 minutes apart, unsubscribe required, reply-exit always on. Not for cold. https://attio.com/help/reference/automations/sequences/create-a-sequence

Rules: required fields on object stage change. Not lists. Not API. https://attio.com/help/reference/managing-your-data/objects/create-and-manage-rules

This agent still enforces next-step-required with a sweep, not native Rules, while pipelines live on lists.

## Do not click

Attio AI / workflow credit steps. Ask Attio in-product agent is not a substitute for this operator.
