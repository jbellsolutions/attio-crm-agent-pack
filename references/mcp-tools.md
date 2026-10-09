# Attio MCP tools

Source: https://docs.attio.com/mcp/overview (fetched 2026-10-08). Hosted URL: `https://mcp.attio.com/mcp`.

This session had no live Attio MCP connection. Re-read the overview if a tool name disagrees with the connected server.

## Records and objects

| Tool | Use |
|---|---|
| `list-objects` | Fuzzy search objects by name/slug |
| `search-records` | Full-text people/companies/deals |
| `list-records` | Filter/sort one object |
| `get-records-by-ids` | Full profiles |
| `create-record` | New record; send unique keys |
| `upsert-record` | Match on email/domain/etc. |
| `update-record` | By `record_id` |
| `merge-records` | Primary wins conflicts |
| `list-attribute-definitions` | Types, required, select/status options |

Before create/update, call `list-attribute-definitions`. Value formats depend on type.

## Lists

| Tool | Use |
|---|---|
| `list-lists` | Sidebar lists the token can see |
| `create-list` | One parent object |
| `list-list-attribute-definitions` | Entry fields |
| `list-records-in-list` | Entries + parent |
| `add-record-to-list` | Default: no duplicate entries |
| `update-list` | Name, slug, permissions |
| `update-list-entry-by-id` | Known `entry_id` |
| `update-list-entry-by-record-id` | Errors if 0 or many entries |

## Notes, tasks, comments

`create-note`, `search-notes-by-metadata`, `semantic-search-notes`, `get-note-body`, `update-note` (append/prepend/title).

`list-tasks`, `create-task`, `update-task`, `delete-task`.

`create-comment`, `list-comments`, `list-comment-replies`, `delete-comment` (own comments; parent delete removes thread).

## Meetings, calls, email

`search-meetings`

`search-call-recordings-by-metadata`, `semantic-search-call-recordings`, `get-call-recording`

`search-emails-by-metadata`, `semantic-search-emails`, `get-email-content`

REST list-emails returns **metadata only**; MCP `get-email-content` is the body path when available.

## Workspace and reporting

`list-workspace-members`, `list-workspace-teams`, `whoami`

`run-basic-report` — counts/averages/group-bys

`query-particle-sql` — not on every plan (Enterprise for REST SQL)

## Rate limit buckets

Read 100/s · Write 25/s · Merge 5/s · Search 300/min · Semantic 2/s · Reporting 2/s · SQL 2/s

Write bucket includes: add-record-to-list, create-*, delete-comment, delete-task, update-list*, update-note, update-record, update-task, upsert-record.
