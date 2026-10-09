# Authenticating Attio REST

Live: https://docs.attio.com/rest-api/guides/authentication

Base: `https://api.attio.com/v2`  
Header: `Authorization: Bearer <access_token>`

Two token kinds:

1. OAuth 2.0 authorization code (`https://app.attio.com/authorize`, token `https://app.attio.com/oauth/token`)
2. Single-workspace API key from developer settings

Scopes are the same for both. Each endpoint lists required scopes.

Token **level**:

- `workspace` — acts as the workspace (API keys always this). Needed for webhook admin.
- `user` — acts as one member. OAuth only. Requires `token_level=user` and PKCE.

Call Identify / `whoami` after any token change. Never commit tokens.
