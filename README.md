# Attio CRM Agent

Cloudroom plugin + skill pack for a specialist Attio CRM / pipeline agent.

Public download: https://github.com/jbellsolutions/attio-crm-agent-pack or https://gleaming-buddha-49nk.here.now/attio-crm-agent.tar.gz. No token is required to read the pack. Attio access is configured separately.

Handoff for the next agent: [HANDOFF.md](HANDOFF.md)  
Cloudroom install: [PLUGIN.md](PLUGIN.md)

Install as a Cloudroom plugin from this folder (`package.json` `bb` block + `server.ts` + `skills/`). Without Cloudroom, copy `skills/` and keep `CHARTER.md` + `references/` beside them.

The parent “GrokBot Analyzed” checkout is an evidence dump, not the runtime.

## What this is

A fully specified **Attio CRM Operator** agent: charter, skills, packet contract, live GrokBot schema, MCP/API playbook, and human-dashboard operating knowledge.

It is the sole writer to Attio. It does not send sales messages, pause campaigns itself, or write ClickUp/GHL.

## Read order

1. [CHARTER.md](CHARTER.md) — identity, authority, acceptance
2. [CURRENT-STATE.md](CURRENT-STATE.md) — dated workspace facts (do not treat as live without a fresh readback)
3. Skills in `skills/` — load the one matching the task
4. `references/` — MCP, REST, dashboard, GrokBot schema

## Skills

| Skill | Use when |
|---|---|
| `attio-crm-operator` | Default operating mode |
| `attio-packet-contract` | Ingesting CRM updates from other agents |
| `attio-dedupe-and-assert` | Creating or matching people/companies/partners |
| `attio-pipeline-lists` | Moving stages, dual-track, outreach hold |
| `attio-schema-governance` | Attributes, objects, lists, statuses |
| `attio-mcp-and-api` | Choosing MCP vs REST, rate limits, gaps |
| `attio-human-dashboard` | Views, access, kanban, UI-only steps |
| `attio-daily-ops` | Weekday counts and defect sweep |
| `attio-affiliate-quota` | 3 referrals/month, attribution, Justin credits |
| `attio-upsell-tagging` | Revenue Partnerships and AI Guy Mastermind |

## Isolation

Path: `.ai-worktrees/attio-crm-agent`  
Intended branch: `work/attio-crm-agent`

The parent “GrokBot Analyzed” folder is not a git repo. Shell `git init` / worktree commands were blocked this session by a Cursor hook (`revyops gate-check`) that returned no output. Files live in this directory so the work stays off the evidence dump; initialize git here when a shell is available:

```
git init
git checkout -b work/attio-crm-agent
```

This package does not contain API keys, OAuth tokens, or live record dumps.
