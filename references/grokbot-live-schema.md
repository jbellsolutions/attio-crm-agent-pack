# GrokBot live schema IDs

Copied from the Oct 4 audit. Stage *names* later changed (section 9 of that audit). IDs below are the attribute/list IDs, not the status option IDs.

Workspace `revenuepartners` / `85fa8363-8b4c-42da-89d4-691a0a988223`. Re-list before writing in a new runtime.

## Lists

| List | slug | list_id | stage attribute_id |
|---|---|---|---|
| Expert Series | `expert_series` | `5b1fc79a-d0d4-43b9-967c-0d988a9d7601` | `15a2b76a-eec8-4b72-be43-44357f76882e` |
| Revenue Partner Program | `partner_relationships` | `4aa6ec09-1289-4d14-8582-01eeda781dab` | `1c328929-4103-40fb-ae20-46a8345852f4` |

## People attributes

| slug | id |
|---|---|
| `expert_series_status` | `a02cb360-b899-4e43-b83c-0c5eab3af85e` |
| `partner_pipeline_status` | `008c95be-c790-416b-adae-6f2eabcc09f8` |
| `outreach_hold` | `bb642b70-5fa2-4f47-90b5-551d7bd54b92` |
| `outflo_lead_id` | `0d94a254-c553-49a4-b513-391a339bed8d` |

`outreach_hold` option renamed Oct 5: Hold - Revenue Partner Program in progress = `1ccd55a9-541c-474f-8a99-be6ac6cbf7a7`.

## Entry attributes (Expert Series / RPP)

| slug | Expert Series | Revenue Partner Program |
|---|---|---|
| `source_channel` | `796dfb28-4958-4bfc-82c7-e5857388f3d2` | `59a81659-e64e-4f42-b16b-b77f5e399c56` |
| `source_campaign` | `760bbac4-ddfa-4e63-be9b-02f109d0f79c` | `d179727e-40e1-485f-8284-3f8fe3633d93` |
| `sender_account` | `3be4f9be-a3cd-4068-99e7-4e6f818ac1f5` | `cfd0ff7d-daf2-48d8-8e70-75e3c056520d` |
| `first_reply_date` | `599ddc74-1b89-4d6b-ae22-304b4595df4e` | `abe6ee08-a7c4-480c-adf3-5a758097212c` |
| `last_activity_date` | `086b4cf7-0ea1-4e99-bbb4-d03cca01d0d7` | `c4ac68d1-7e5b-4a39-b300-891e4ccd4e25` |
| `next_step` | `d4e78fbd-6521-4d3d-b909-ee92fff057c5` | `b68989ab-e05f-481a-a395-3b26b41b3cd0` |
| `next_step_date` | `ae26f3a3-126a-4d56-bed1-cab578de6947` | `90f692f7-dbeb-4855-be12-0337e96d5e81` |
| `source_thread_id` | `2ad6b813-3656-4557-9dbe-597cb5cb1818` | `e18dca15-76f4-4228-a3f1-3c7b189648c4` |
| `sequence_paused` | `7a777ac8-cbda-41d4-8638-d599c8b43a94` | `96ced883-078d-4200-9929-f8ebc7dd9528` |
| `pause_reason` | `d777657a-24e6-4bd3-bc42-90039c18fdea` | `c28fe072-b47c-4cc2-a5a1-b8bc8d5339aa` |
| `related_deal` | `eb4c5f26-56eb-433d-a628-12f27c14f330` | `5e7be52e-ef1e-41bf-a922-c384a177a0f2` |
| `partner_record` | n/a | `ccd4e2e7-821f-4372-bfee-c11da504cfff` |

## Oct 5 additive statuses

| Target | id |
|---|---|
| `partners.partner_stage` Onboarding | `59d7a6d7-65a3-4776-9bbf-c283b805838c` |
| `deals.stage` Discovery Done | `b5a57cee-c2d7-4df4-9bd5-7cccbbf991d6` |
