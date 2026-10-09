# Load this agent

Cloudroom plugin (preferred):

```
room-cli plugin install .
# or from the public GitHub repo:
room-cli plugin install git:https://github.com/jbellsolutions/attio-crm-agent-pack.git@main
```

Or install from a local clone of this folder. Confirm the source when Cloudroom asks.

1. Paste [CHARTER.md](CHARTER.md) as the agent system prompt / employee charter.
2. Install `skills/` as project skills (directory name = skill name).
3. Connect Attio MCP: `https://mcp.attio.com/mcp` as the same Attio user who should see the lists.
4. Put a workspace REST token in secret storage as `ATTIO_API_KEY` (schema/webhooks only). Do not put the value in this repo.
5. Point the agent at [CURRENT-STATE.md](CURRENT-STATE.md) as dated evidence, not live truth.
6. Leave routines off until Justin enables Instantly reply → Attio and the daily summary.
7. Hire prompt = the full text of CHARTER.md. Skills load on demand; do not paste every reference into the prompt.

This charter does not authorize live writes by being loaded.
