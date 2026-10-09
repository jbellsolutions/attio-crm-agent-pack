# Attio MCP (bundled summary)

Live: https://docs.attio.com/mcp/overview  
Server: `https://mcp.attio.com/mcp` (OAuth as the Attio user)

Reads auto-approve. Writes should confirm. Permissions = the connected user (hidden lists stay hidden).

## Tools

Records: `list-objects`, `search-records`, `list-records`, `get-records-by-ids`, `create-record`, `upsert-record`, `update-record`, `merge-records`, `list-attribute-definitions`

Lists: `list-lists`, `create-list`, `list-list-attribute-definitions`, `list-records-in-list`, `add-record-to-list`, `update-list`, `update-list-entry-by-id`, `update-list-entry-by-record-id`

Notes: `create-note`, `search-notes-by-metadata`, `semantic-search-notes`, `get-note-body`, `update-note`

Tasks: `list-tasks`, `create-task`, `update-task`, `delete-task`

Comments: `create-comment`, `list-comments`, `list-comment-replies`, `delete-comment`

Meetings/calls: `search-meetings`, `search-call-recordings-by-metadata`, `semantic-search-call-recordings`, `get-call-recording`

Email: `search-emails-by-metadata`, `semantic-search-emails`, `get-email-content`

Workspace: `list-workspace-members`, `list-workspace-teams`, `whoami`

Reporting: `run-basic-report`  
SQL: `query-particle-sql` (not every plan)

No MCP tool for **create attribute** or **create view**. Use REST / UI.

## Rate limits (per workspace, shared bucket per tier)

| Tier | Limit |
|---|---|
| Read | 100/s |
| Write | 25/s |
| Merge | 5/s |
| Search | 300/min |
| Semantic search | 2/s |
| Reporting | 2/s |
| SQL | 2/s |

Matches REST read/write caps. Source: the MCP overview page above.
