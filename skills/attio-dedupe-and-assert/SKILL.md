---
name: attio-dedupe-and-assert
description: Match or create Attio people, companies, and partners without duplicates. Use before any create/upsert.
---

# Dedupe and assert

## People

Lookup order:

1. `email_addresses` — compare case-insensitive; **store original casing**
2. LinkedIn URL normalized to `https://www.linkedin.com/in/<vanity>` (strip query, country prefixes, trailing slash)
3. `outflo_lead_id`
4. Name + company (weak). If two people match, stop and report. Do not pick.

Prefer **upsert** on email (REST `PUT /v2/objects/people/records` matching `email_addresses`, or MCP `upsert-record`). Create-without-unique-key is how sync ghosts happen.

Fill empty attributes only. If name exists and packet has a different spelling, note it; do not silently overwrite.

## Companies

Match on `domains`. Upsert. One domain, one company. Finbay `.au` vs `.com` are **different companies** until Justin approves a merge.

Do not create a company from a personal Gmail domain.

## Partners

Match **name + company**. The Partners object is the active-partner record, not a second Person. Link via RPP entry `partner_record` and Deal `referred_by_partner`.

## Deals

Deals have no native unique key. Add your own unique attribute before relying on upsert, or search by person + offer + open stage. Do not mint a second open deal for the same engagement.

## Merge

REST `merge-records` / MCP `merge-records`: primary wins on conflicts. **5/s**. Destructive. Propose a duplicate report (example: Andre Vu ×2). Wait for Justin.

## Sync pollution

Gmail/Calendar sync created most of the 2,500+ people. Strength “Very weak” with no campaign activity is not a lead. Do not add them to RPP/ES.

## Writes

Stay under 25 writes/s. Batch notes after the record exists. If list-records rejects `limit > 50` on MCP, page at 50.
