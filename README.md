# WorldBisect demo

This repository is a deliberately small, reproducible demonstration of the
[WorldBisect GitHub Action](https://github.com/ClusterPilot-System/worldbisect).
The good and bad workspaces differ only in `config.txt`. The check command
passes in the good workspace and fails in the bad workspace, so WorldBisect can
verify the causal factor as `PROVEN`.

## Run the demo

1. Open the **Actions** tab.
2. Select **WorldBisect demo**.
3. Click **Run workflow**.
4. Open the run summary and the `worldbisect-diagnostic` artifact.

The workflow is manual by design. It does not run arbitrary pull-request code,
and it does not require secrets.

The workflow pins the Action metadata to the immutable `v1.1.1` release. It
uses the published v1.1.0 Linux AMD64 archive with its built-in verified
SHA-256 digest, so this copy-paste example does not need a `sha256` input:
`74602fb5a1894eaf63ef12178fa5d9ff53b6369a9277f17021c3733f18f7d757`.

Expected summary:

```text
status: PROVEN
factor: workspace file "config.txt"
```

The result is a proof within the captured workspace and command model. It does
not claim universal causal completeness outside that model.

## Record a real demo

For a short terminal recording, show the two `config.txt` values, start the
workflow, and then show the `PROVEN` summary and diagnostic artifact. Keep the
recording tied to a real workflow run; do not replace the output with a typed
or pre-rendered result.

## License

Apache-2.0. WorldBisect is maintained by ClusterPilot System.
