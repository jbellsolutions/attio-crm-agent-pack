# Attio REST rate limits

Live: https://docs.attio.com/rest-api/guides/rate-limiting

- Read: **100 requests/s**
- Write: **25 requests/s**
- HTTP **429** with `Retry-After` (HTTP-date). Request was not processed; retry after that time.
- List records / list entries also have **score-based** limits (filter/sort complexity + object size). Per-query score can exceed the cap, or a 10-second sliding window of summed scores. Simplify the query or page smaller.

Call recording create is documented at 1/s on that endpoint.
