# Copilot Instructions

Apply these standards to all changes for this Azure banking platform:

## Azure infrastructure and Terraform

- Define infrastructure as code with Terraform. Keep reusable resources in
  focused, composable modules under `infra/modules/`; keep environment-specific
  configuration and module composition under `infra/environments/`.
- Pin Terraform and provider versions, declare inputs and outputs, and document
  module interfaces. Make changes planable and repeatable; do not make manual
  portal changes part of the deployment process.
- Never hardcode credentials, tokens, private keys, or other secrets in source,
  configuration, examples, or logs. Use Azure Key Vault or an approved secret
  manager and workload identity/managed identity where applicable.
- Do not commit Terraform state, plan files, or secret-bearing generated files.
  Treat state as sensitive and use an encrypted, access-controlled remote
  backend with locking.
- Apply least privilege, private networking where appropriate, encryption in
  transit and at rest, and secure defaults. Validate changes with formatting,
  validation, and review of the Terraform plan.

## Kubernetes reliability

- Every Kubernetes `Deployment` must define both liveness and readiness
  probes appropriate to the application. Configure startup probes for
  applications that need additional initialization time.
- Set resource requests and limits, use non-root identities and restrictive
  security contexts, and avoid privileged containers.
- Design workloads for graceful shutdown, safe rollout, and recovery. Do not
  use liveness probes to check dependencies whose temporary failure should not
  restart the process.
- Keep health endpoints lightweight and ensure readiness reflects whether the
  service can safely receive traffic.

## Python FastAPI services

- Validate external input with typed Pydantic models and return intentional,
  documented HTTP errors. Handle expected failures explicitly; do not swallow
  exceptions, expose stack traces or internal details, or return success-shaped
  fallback values.
- Use FastAPI dependency injection and async patterns appropriately. Set
  timeouts for outbound calls, handle cancellation, and avoid blocking the event
  loop.
- Keep credentials and sensitive banking data out of error messages and
  telemetry. Add focused tests for validation, error paths, and service
  behavior.

## Observability and Datadog

- Emit structured JSON logs to standard output with consistent timestamps,
  severity, service, environment, and trace/correlation identifiers so
  Datadog can parse and correlate events.
- Use the approved logging integration and include actionable context, but
  never log secrets, authentication material, payment-card data, or other
  sensitive customer information.
- Instrument services with useful metrics and distributed traces. Monitor
  availability, latency, errors, and saturation, and make alerts actionable.
- Keep health checks separate from verbose diagnostics; do not expose sensitive
  operational details through health endpoints.
