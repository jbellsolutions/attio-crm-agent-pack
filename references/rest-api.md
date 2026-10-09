# Attio REST API map

Base: `https://api.attio.com/v2`  
Auth: `Authorization: Bearer <token>`  
Index: https://docs.attio.com/llms.txt  
Auth: https://docs.attio.com/rest-api/guides/authentication  
Limits: https://docs.attio.com/rest-api/guides/rate-limiting  
OpenAPI: https://docs.attio.com/rest-api/endpoint-reference/openapi.md

Workspace API keys are always workspace-level. OAuth can be `workspace` or `user` (`token_level`; user needs PKCE). Webhook admin endpoints are workspace-level.

## Attribute types

Actor reference, checkbox, currency, date (no timezone), domain, email, interaction, location, personal name, number, phone, rating, record reference, select, status, text, timestamp (UTC).

Status is the pipeline type. Select is a closed list. Record reference is the relationship type (people↔companies, deal→partner).

## Core write/read

| Action | Typical path |
|---|---|
| Query records | `POST /v2/objects/{object}/records/query` |
| Upsert | `PUT /v2/objects/{object}/records` (matching attribute) |
| Create | `POST /v2/objects/{object}/records` (throws on unique conflict) |
| Get | `GET /v2/objects/{object}/records/{id}` |
| Update overwrite multi | PUT record |
| Update append multi | PATCH record |
| Delete record | `DELETE` — **forbidden without Justin** |
| Merge | merge endpoint |
| Historic values | `GET .../attributes/{attr}/values?show_historic=true` |
| Record’s list entries | `GET .../entries` (ids only; then get entry) |
| Search | search-records (names, domains, emails, phones, socials, labels) |

People/companies/deals/users also have typed convenience endpoints. `avatar_url` / `logo_url` cannot be set via API (docs note).

## Lists and entries

`GET /v2/lists` · `POST /v2/lists` · `PATCH` list (permissions: must keep at least one full-access)

`POST /v2/lists/{list}/entries/query`

Upsert entry by parent · Create entry (duplicates allowed) · GET/PUT/PATCH/DELETE entry · historic entry values · write historic (migration; destructive)

Query `limit` default 500. Also `filter_view_id` (filter from a saved view; sorts/limits are still yours).

## Schema

Objects: list/create/get/update/delete (custom only; delete wipes records)

Attributes: list/create/get/update · select options · statuses

Views: list for object or list (no create-view in REST as of this index)

## Collaboration

Notes, tasks (update: deadline, completed, linked_records, assignees), threads, comments, files (50 MB native upload), meetings, call recordings (create 1/s).

REST list emails: metadata, never body.

Sequences: add emails to unsubscribe list (idempotent).

## Meta and webhooks

`identify` / self — token, workspace, scopes

Webhooks: list/create/get/update/delete. `list-entry.updated` filtered by list. https://docs.attio.com/rest-api/guides/webhooks.md

SQL: Enterprise.

## Scopes you actually need for this agent

`record_permission:read-write` · `object_configuration:read` (and write for schema) · `list_entry:read-write` · `list_configuration:read` (write for new lists/attrs) · note/task/comment as needed · `webhook:read-write` for subscriptions

Call Identify after any token change. Do not assume GrokBot’s old “full read-write including object/list/webhooks” still holds.
