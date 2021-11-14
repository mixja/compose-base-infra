# Compose Infrastructure

This repository includes base infrastructure required to support AWS environments:

- Artifacts bucket - S3 bucket used to store Lambda function and other artifacts.
- Route 53 domain - e.g. `sandbox.compose.run`
- Certificate for Route 53 domain - i.e. subject name of `sandbox.compose.run` and includes a wildcard subject alternative name (SAN) of `*.sandbox.compose.run`