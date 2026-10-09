# Public delivery

Share https://gleaming-buddha-49nk.here.now/ or https://github.com/jbellsolutions/attio-crm-agent-pack with agents in Slack. Both contain the complete skill pack without a download credential. Attio OAuth or REST access is separate.

The public GitHub repository is a clean snapshot. The source repository stays private because its older history contains a revoked Drive token. Never push the source history into the public repository.

For a new release, commit changes in the source repository, export a fresh snapshot with `git archive HEAD`, update the public repository from that snapshot, generate `share/attio-crm-agent.tar.gz` and its `.sha256` file, then republish `share/` to the same here.now slug. Run `scripts/verify-public-delivery.sh` after publishing. It checks both download routes without credentials.
