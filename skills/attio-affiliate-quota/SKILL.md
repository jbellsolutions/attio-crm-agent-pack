---
name: attio-affiliate-quota
description: Credit referrals, keep the 3/month quota, and maintain no-referrals / still-owe views. Use when Justin credits a referral or a new person is attributed to an affiliate.
---

# Affiliate quota

Read [affiliate-quota-and-upsells.md](../../references/affiliate-quota-and-upsells.md). Decision: ADR 0001.

## On every real inbound

Set `is_affiliate` = true, `affiliate_quota` = 3 if empty. Exclude sync ghosts, DNC, Connect Med, Justin-personal.

If the packet has `referred_by`, credit that affiliate (below) and set the new person’s `referred_by`.

## Credit a referral

Need both people. Justin saying “give Sarah +1” without who she referred → HOLD, ask once.

1. Dedupe affiliate and referred (email → LinkedIn → name+company).
2. File the referred Person if missing (they become an affiliate too).
3. Idempotency: same affiliate + referred + `YYYY-MM` → Duplicate entry, no increment.
4. Add `affiliate_credits` entry on the **referred** Person: stage Counted, `referred_by`, period, credited_on, product, source, idempotency_id.
5. Recount the affiliate: `referrals_this_month`, `referrals_owed`, `last_referral_on`, `quota_period`.
6. Note on both records. Return both URLs and the new owed number.

Do not credit closed-deal commission here unless a Deal is in the packet. Quota ≠ payout.

## Month roll

If `quota_period` ≠ current `YYYY-MM`, zero the counters then recount Counted credits for the new period.

## Views

Do not substitute notes. After schema exists, keep the four People views filtered on the mirrored fields. UI steps live in the human-dashboard skill.
