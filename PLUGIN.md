# Cloudroom plugin

Package: `bb-plugin-attio-crm`  
Manifest: `package.json` → `bb`  
Server: `server.ts` (headless — skills only, no UI)  
Skills: every `skills/*/SKILL.md`

## Install from this folder

```
room-cli plugin install .
```

Confirm the path when Cloudroom asks. Then open a thread in a project that has this plugin enabled. The umbrella skill is `attio-crm`.

## Install from public Git

```
room-cli plugin install git:https://github.com/jbellsolutions/attio-crm-agent-pack.git@main
```

Git installs run `npm install` then load `server.ts`. This plugin has no runtime npm dependencies.

## What it does not do

No Attio OAuth inside the plugin. Connect MCP `https://mcp.attio.com/mcp` in the thread/workspace. REST token stays in secret storage as `ATTIO_API_KEY`, never in this repo.
