# Handoff — Attio CRM specialist plugin

Give this file to the next agent. The public pack is at https://github.com/jbellsolutions/attio-crm-agent-pack. Clone it or download the archive at https://gleaming-buddha-49nk.here.now/attio-crm-agent.tar.gz. Neither route needs a token or Cloudroom.

## What this is

Cloudroom plugin `bb-plugin-attio-crm` (v1.0.0) plus a portable skill pack for GrokBot’s Attio CRM. One umbrella skill (`skills/attio-crm`) routes to specialist skills. You are the **only** writer of the live Attio workspace. Charter load is **not** permission to write.

## Install (Cloudroom)

1. Clone the public pack: `git clone https://github.com/jbellsolutions/attio-crm-agent-pack.git`.
2. `Settings → Plugins → Install from folder` (or add as a local plugin path) pointing at the repo root (`package.json` + `server.ts`).
3. Skills load from `./skills`. Start with `skills/attio-crm/SKILL.md`.
4. Connect Attio MCP: `https://mcp.attio.com/mcp` (OAuth as Justin). REST only for schema/webhooks.

Without Cloudroom: copy `skills/` into the agent’s skills dir and keep `CHARTER.md` + `references/` next to them. Read the charter and router skill before using the pack. Attio access must be connected separately.

## Read first

| File | Why |
|---|---|
| [CHARTER.md](CHARTER.md) | Role, write gates, pipeline rules |
| [CURRENT-STATE.md](CURRENT-STATE.md) | Live GrokBot schema (Oct 4 2026 audit) |
| [INSTALL.md](INSTALL.md) | MCP vs REST, no live writes |
| [docs/adr/0001-everyone-is-an-affiliate.md](docs/adr/0001-everyone-is-an-affiliate.md) | Quota, attribution, views, products |
| [SOURCE-MAP.md](SOURCE-MAP.md) | Where each rule came from |

## Skills (load as needed)

| Skill | When |
|---|---|
| `attio-crm` | Always — router |
| `attio-crm-operator` | Record writes, notes, tasks |
| `packet-contract` | Inbox/handoff JSON |
| `pipeline-lists` | ES / RPP list entries |
| `affiliate-quota` | 3 intros/month, credit, views |
| `upsell-tagging` | RPP + Mastermind primes |
| `dedupe` | Merge proposals only |
| `schema-governance` | New attributes/lists (propose) |
| `mcp-and-api` | Tool choice, rates, formats |
| `human-dashboard` | Views humans use |
| `daily-ops` | Cadence |

## API / MCP docs in-repo

`references/attio-official/` — summaries fetched 2026-10-08. Live URLs on each file. Full tool table: `references/mcp-tools.md`. REST catalog: `references/rest-api.md`. Write shapes: `references/write-formats.md`. Webhooks: `references/webhooks.md`. Live IDs: `references/grokbot-live-schema.md`.

Official live docs:

- MCP: https://docs.attio.com/mcp/overview
- REST: https://docs.attio.com/rest-api/overview
- Auth: https://docs.attio.com/rest-api/guides/authentication
- Rate limits: https://docs.attio.com/rest-api/guides/rate-limiting
- Filters: https://docs.attio.com/rest-api/guides/filtering-and-sorting
- Objects/lists: https://docs.attio.com/docs/objects-and-lists

## Hard rules

- No Attio writes unless Justin says **apply** / **write live**.
- No `create-record` / `update-record` / `merge-records` / list mutations / webhook POST without that.
- Propose schema: People counters, `affiliate_credits` list, `upsell_rpp` / `upsell_mastermind`. Do not create until apply.
- Plus object quota ≈ 5. Do not add a fifth object; credits = People list.
- MCP cannot create attributes or saved views.
- Never commit tokens, `.env`, or `box-secrets.json`.

## Workspace facts (do not invent IDs)

- Expert Series list `expert_series` / `5b1fc79a-d0d4-43b9-967c-0d988a9d7601`
- RPP list API slug `partner_relationships` / `4aa6ec09-1289-4d14-8582-01eeda781dab`
- People `people`, Companies `companies`, Deals `deals`, Partners `partners`
`first_reply_date` on RPP: `abe6ee08-a7c4-480c-adf3-5a758097212c`

## Products

Revenue Partnerships (RPP) and AI Guy Mastermind. Upsell Prime = 2+ facts (self-ID, close, high-intent). Attribution is named intro, not closed deal.

## Isolation

Intended git branch: `work/attio-crm-agent`. Source checkout: GrokBot Analyzed. This folder is the shareable pack.
