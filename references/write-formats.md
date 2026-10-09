# Attribute write formats

Official type docs: https://docs.attio.com/rest-api/attribute-types/attribute-types.md

You cannot create extra email or name attributes. People use system `email_addresses` (multiselect) and `name`.

## Person name

Prefer the object form (all three keys required):

```json
{ "name": { "first_name": "Andrey", "last_name": "Markiv", "full_name": "Andrey Markiv" } }
```

String form is `"Last, First"`. No comma = first name only. Source: https://docs.attio.com/rest-api/attribute-types/attribute-types-personal-name.md

## Email

Write strings or `{ "email_address": "..." }`. Always array for people:

```json
{ "email_addresses": ["tony@consumerinformationsystems.com"] }
```

Match on the normalized `email_address`. Preserve `original_email_address` casing in notes if it differs. You cannot invent a second email attribute.

Source: https://docs.attio.com/rest-api/attribute-types/attribute-types-email-address.md

## Company domain

Upsert matching `domains`. String or `{ "domain": "goatechs.com" }`.

## Status (list `stage`, deals `stage`)

Write the **title** string or `status_id`. Wrong title errors; it does not create a status.

```json
{ "stage": "Call Booked" }
```

Kanban columns = statuses. `target_time_in_status` and `celebration_enabled` are UI/API status properties, not something MCP reorders.

Source: https://docs.attio.com/rest-api/attribute-types/attribute-types-status.md

## Select (mirrors, outreach_hold)

Same idea: option title or id. Renaming an option keeps the id.

## Record reference

Write company/person by domain/email **or** `{ "target_object": "companies", "target_record_id": "..." }`.

The target must already exist. Create company first, then person. Relationship pairs update both sides (person `company` ↔ company `team`).

Source: https://docs.attio.com/rest-api/attribute-types/attribute-types-record-reference.md

## PUT vs PATCH

PUT replaces multiselect. PATCH appends. For emails, PUT with the full list or you wipe the other address.
