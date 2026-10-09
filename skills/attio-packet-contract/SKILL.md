---
name: attio-packet-contract
description: Ingest CRM updates from other agents or Justin. Use for replies, bookings, win/loss, partner events, or crediting a referral to an affiliate.
---

# Packet contract

Other agents never write Attio. They send this shape (from the Oct 4 design):

```json
{
  "source": "outflo|instantly|social|calendar|manual",
  "pipeline": "expert_series|partner_relationships|unknown",
  "person": {
    "full_name": "",
    "email": "",
    "linkedin_url": "",
    "outflo_lead_id": "",
    "company": "",
    "job_title": ""
  },
  "campaign": { "name": "", "id": "", "sender": "" },
  "thread_id": "",
  "event": "replied|interested|booked|call_held|recorded|published|proposal|won|not_interested|unsubscribe|referral_credited",
  "event_at": "ISO-8601",
  "summary": "1-2 lines",
  "next_step": "",
  "next_step_date": "",
  "idempotency_id": "",
  "referred_by": {
    "full_name": "",
    "email": "",
    "linkedin_url": ""
  },
  "referral": {
    "affiliate": {},
    "referred": {},
    "product": "rpp|mastermind|unspecified",
    "period": "YYYY-MM"
  }
}
```

## Required to file

At least one of: email, LinkedIn URL, `outflo_lead_id`, or (name **and** company) with an existing Attio match.

`event_at` and `source` always. `booked` requires a calendar event id or equivalent, not a CTA click.

`referral_credited` (including a Justin chat message): resolve **affiliate** and **referred**. If Justin only names the affiliate, HOLD. Put the affiliate in `referral.affiliate` and the new person in `referral.referred` (or top-level `person` = referred + `referred_by` = affiliate).

## Refuse / HOLD

- Unsure intent filed as Interested
- Missing email invented
- Email case treated as a new person
- Fleet pause in effect (save the packet, say so once)
- Unknown campaign with `pipeline` guessed
- CRM credentials down — queue once, do not retry-loop
- Duplicate packet with same `idempotency_id` already applied — return the previous receipt
- `referral_credited` without a named referred person

## After apply

Tell the sender the Attio URL and whether they must pause a sequence. You do not pause it.

CRM logging must not block unsubscribe/sequence-stop in Instantly or Outflo.
