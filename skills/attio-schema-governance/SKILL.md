---
name: attio-schema-governance
description: Change Attio objects, lists, attributes, statuses, or select options. Use before any schema write.
---

# Schema governance

Justin approves schema through HoOps. Other agents ask you. You do not freelance fields.

## Model (official)

- **Objects** = entity types (people, companies, deals, users, workspaces, custom). Records are instances. Attributes are columns.
- **Lists** = process. Entries are rows. Lists have their own attributes (stage, next step).
- One object has one native `stage` status set. That is why ES and RPP are **lists on People**, not two Deal pipelines.
- Status vs select: status is for pipeline stages (kanban columns). Select is for mirrors and flags.

## Plan limits (verify in Billing)

Plus (historical): 5 objects (people, companies, deals, partners = 4 used). Keep **referrals as a People list** (`affiliate_credits`), not a 5th custom object. Formulas were unused on Sep 30. Rules are Pro-only, max 8 per object, **objects not lists**, and **do not apply to API writes**. Sequences are Pro. Workflow credits: Plus 1,500 / Pro 10,000 — this agent must not burn them.

## What MCP cannot do (GrokBot, Oct 2026)

- Create attributes (no tool). Use REST `POST /v2/{objects|lists}/{id}/attributes`.
- Create views / kanban / column layout. Human UI (or tell Justin the clicks).
- Reorder statuses. API appends at end; drag in UI.
- Expose plan tier.

REST can: objects, attributes, select options, statuses (create/update/archive via `is_archived`), lists, webhooks.

## Additive-only default

Create and archive. Do not delete objects or records. Archiving hides; deleting is permanent ([docs](https://docs.attio.com/docs/archiving-vs-deleting.md)).

Renaming a select option **keeps its ID** (outreach_hold rename Oct 5). Safe.

Changing a list **slug** is not safe. Display name is fine.

## After any schema write

1. GET the attribute/status
2. Write the IDs into CURRENT-STATE
3. Update person mirrors if list stages changed
4. Remind Justin to drag order and add columns to saved views (new fields do not appear as columns until added)

## Revenue Engine (not live)

Do not apply `deal_value`, `resolution`, `automation_policy`, etc. from the Oct 6 plan until Justin decides. Defaults in that plan are labeled PLACEHOLDER.

## ADR 0001 (approved model, not live until applied)

Quota/upsell People fields + list `affiliate_credits`. Apply with REST, then build the four People views in the UI. Field list: [affiliate-quota-and-upsells.md](../../references/affiliate-quota-and-upsells.md).
