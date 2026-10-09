# Filtering and sorting

Live: https://docs.attio.com/rest-api/guides/filtering-and-sorting

Shorthand: `{ "filter": { "email_addresses": "a@b.com" } }`

Verbose: `$and` / `$or` / `$not` plus field operators `$eq`, `$not_empty`, `$in`, `$contains`, `$starts_with`, `$ends_with`, `$lt/$lte/$gt/$gte`.

Record references support `path` drill-downs. List entries can path through `parent_record`.

Sorts: `{ "direction": "asc", "attribute": "name", "field": "last_name" }` or a `path`.

Operator matrix is on the live page. Status and select support `$eq`. Dates/numbers support range ops.
