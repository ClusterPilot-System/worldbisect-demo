# WorldBisect demo

This repository is a deliberately small, reproducible demonstration of the
[WorldBisect GitHub Action](https://github.com/ClusterPilot-System/worldbisect).
The good and bad workspaces differ only in `config.txt`. The check command
passes in the good workspace and fails in the bad workspace, so WorldBisect can
verify the causal factor as `PROVEN`.

## Try it in your browser

You can inspect the public [WorldBisect demo runs](https://github.com/ClusterPilot-System/worldbisect-demo/actions/workflows/demo.yml)
without installing anything. Open a completed run to read the workflow summary;
GitHub sign-in is required to download its diagnostic artifact. This is a
deliberately introduced regression, not a customer incident.

To execute the demo yourself:

1. Fork this repository into your GitHub account, then open **Actions** in your
   fork and enable workflows if GitHub asks.
2. Select **WorldBisect demo**.
3. Click **Run workflow**.
4. Open the run summary and the `worldbisect-diagnostic` artifact.

**Run workflow** is available to people with write access to their repository;
visitors cannot start a run in this upstream repository. The workflow is manual
by design and runs only the checked-in fixture. It does not require you to add
secrets. GitHub supplies the workflow token; its `checks: write` and
`security-events: write` permissions publish the diagnostic test check and SARIF
report, alongside `contents: read` for checkout.

The workflow pins [Action `action-v1.0.1`](https://github.com/ClusterPilot-System/worldbisect/releases/tag/action-v1.0.1)
to immutable revision `db6b33f891779cf8e636393cf0b6afb242f6a282` and explicitly
selects engine [1.2.1](https://github.com/ClusterPilot-System/worldbisect/releases/tag/v1.2.1).
The Action verifies the published Linux AMD64 archive before execution using
its built-in SHA-256 digest, so no additional `sha256` input is needed:
`603884407d628900cb20dd33b64610af221bd029e3b08b5b2ff0d41f7bae4467`.

Expected summary:

```text
status: PROVEN
factor: workspace file "config.txt"
```

The result is a proof within the captured workspace and command model. It does
not claim universal causal completeness outside that model. The workflow checks
both the real `PROVEN` status and the `config.txt` finding before writing its
short summary. A green run means the controlled demonstration passed; it does
not mean the deliberately bad configuration passed its original check.

This demo uses **`mode: compare`**, with two small workspaces already in the
repository. To save successful inputs automatically and investigate a later CI
failure, use [the separate `mode: ci` setup](https://github.com/ClusterPilot-System/worldbisect/blob/main/docs/ci-baselines.md).
Both modes have explicit reproducibility and input-selection limits.

Prefer running locally without a GitHub account? Try the
[three-command Linux/WSL demo](https://github.com/ClusterPilot-System/worldbisect/blob/main/docs/first-diagnosis.md).
If setup stops or the result is unclear, tell us which check you wanted to try
in the [getting-started form](https://github.com/ClusterPilot-System/worldbisect/issues/new?template=getting-started.yml).

## Record a real demo

For a short terminal recording, show the two `config.txt` values, start the
workflow, and then show the `PROVEN` summary and diagnostic artifact. Keep the
recording tied to a real workflow run; do not replace the output with a typed
or pre-rendered result.

## License

Apache-2.0. WorldBisect is maintained by ClusterPilot System.
