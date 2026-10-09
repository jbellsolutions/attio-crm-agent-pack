# Source map

What was ingested to build this agent. Paths are in the parent “GrokBot Analyzed” folder unless noted.

## GrokBot agent

| Source | What it contributed |
|---|---|
| `Launch Charters 2026-10-08/.../05-attio-crm-operator.md` | Original sole-writer prompt |
| `Launch Charters 2026-10-08/.../10-attio-crm-optional.md` | Reduced-fleet charter (packets, no invent, booking evidence) |
| `analysis/profile-specs/crm/ROLE.md` | Hermes role contract |
| `.../agents/b91a824d-.../profile.json` | Installed GrokBot profile text |
| `Launch Charters .../threads/attio-crm-operator.md` | Live operating examples |
| `Grok Bot Backup 2026-10-07/HANDOFF-2026-10-07-v2.md` | Fleet law, MCP list, routines |
| `analysis/skills-to-hermes-mapping.md` | `revenue-and-crm` skill merged into CRM profile; Attio MCP keep |

## Workspace CRM docs (the actual specialist work)

| File | What |
|---|---|
| `github-package/recovered/workspace/crm/2026-09-30-trp-direction-and-crm-compare.md` | Why Attio vs Pipedrive |
| `.../2026-10-04-attio-audit-and-pipeline-design.md` | Live audit, list model, IDs, packet contract, stage set v2 |
| `.../2026-10-05-attio-maximize.md` | Backfill, DEMO delete, referral fields, Instantly path |
| `.../2026-10-06-attio-revenue-engine-plan.md` | Engine design, SLAs, views-access bug, MCP limits |
| `.../2026-10-06-referral-checkin-result.md` | MCP cannot create attributes; note fallback |

## GrokBot skills (Attio-adjacent)

There is **no standalone Attio SKILL.md** in the recovered skill tree. Adjacent skills:

- `revenue-partner` — GTM Money Desk; CRM writes still go through this operator
- `revenue-and-crm` — marked merge-into-crm in the Hermes map
- Instantly reply → Attio routine (folder `instantly-reply-attio`) — not recovered as skill text

This package is the missing Attio skill pack.

## Official Attio (fetched 2026-10-08)

| Doc | URL |
|---|---|
| MCP overview + tools + rate limits | https://docs.attio.com/mcp/overview |
| MCP product help | https://attio.com/help/reference/attio-ai/attio-mcp |
| MCP prompts | https://attio.com/help/reference/how-to-guides/attio-mcp-prompts-and-best-practices |
| REST overview | https://docs.attio.com/rest-api/overview |
| Auth | https://docs.attio.com/rest-api/guides/authentication |
| Rate limits | https://docs.attio.com/rest-api/guides/rate-limiting |
| Docs index | https://docs.attio.com/llms.txt |
| Objects and lists | https://docs.attio.com/docs/objects-and-lists.md |
| Archiving vs deleting | https://docs.attio.com/docs/archiving-vs-deleting.md |
| Data model (help) | https://attio.com/help/reference/attio-101/attios-data-model/define-your-data-model-objects-lists-and-views |
| Understanding lists | https://attio.com/help/reference/attio-101/attios-data-model/understanding-lists |
| Kanban views | https://attio.com/help/reference/managing-your-data/views/create-and-manage-kanban-views |
| List access | https://attio.com/help/reference/managing-your-data/lists/lists-access |
| Object access | https://attio.com/help/reference/managing-your-data/objects/manage-access-to-objects |
| Workflows | https://attio.com/help/reference/automations/workflows/overview-of-workflows |
| Sequences | https://attio.com/help/reference/automations/sequences/create-a-sequence |
| Rules | https://attio.com/help/reference/managing-your-data/objects/create-and-manage-rules |
| Pricing | https://attio.com/pricing |

Hosted MCP URL: `https://mcp.attio.com/mcp`

This session had **no Attio MCP namespace connected**. Tool schemas in `references/mcp-tools.md` come from Attio’s published docs, not a live tool listing here.

## Not in this package

Secrets, `ATTIO_API_KEY` values, OpenAPI dump, live people, box-secrets, cookies. Missing apply scripts (`attio_apply.py`, `attio-schema.json`) were named in the original prompt but were not in the recovered `workspace/crm` markdown set.
