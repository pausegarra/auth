# Repository Guidelines

## Project Structure & Module Organization
This repository packages and deploys a custom Keycloak setup.

- `themes/`: Keycloak themes.
- `themes/base-theme/`: baseline login/email templates.
- `themes/pxpd/`: customized theme variant (branding, localized messages, CSS/images).
- `k3s/values.yaml`: Helm values used for cluster deployment.
- `compose.yaml`: local Keycloak runtime for theme development.
- `Dockerfile`: production image build (Keycloak optimized build + runtime stage).
- `.github/workflows/deploy.yaml`: tag-driven image publish and Helm deploy pipeline.

## Build, Test, and Development Commands
- `make help`: list available make targets.
- `make run`: start local Keycloak with mounted `./themes` for live template edits.
- `make rund`: same as run, detached mode.
- `make stop`: stop local containers.
- `make clean`: stop and remove volumes.
- `make build-docker`: build image `ghcr.io/pausegarra/auth:test`.

Local URL: `http://localhost:8080` (admin/admin from `compose.yaml`).

## Coding Style & Naming Conventions
- YAML: 2-space indentation, no tabs.
- FreeMarker templates (`*.ftl`): keep logic minimal; prefer Keycloak message keys over hardcoded text.
- CSS: keep theme-specific styles in each theme’s `login/resources/css/styles.css`.
- i18n: add/update keys across language files together, e.g.:
  - `themes/pxpd/login/messages/messages_en.properties`
  - `themes/pxpd/login/messages/messages_es.properties`
- Asset naming: lowercase kebab-case (`background.png`, `logo.svg`).

## Testing Guidelines
No automated test suite currently configured. Validate changes by:

1. `make run`
2. Open login, register, reset-password, verify-email, and email flows.
3. Confirm no missing message keys and no broken static assets.
4. For deployment changes, run a Helm dry check before merging:
   `helm lint <chart> -f k3s/values.yaml`

## Commit & Pull Request Guidelines
Recent history uses short conventional messages, mostly `fix: ...`. Follow:

- Commit format: `type: concise description` (`fix`, `feat`, `chore`, `docs`).
- One logical change per commit (theme edits vs infra edits split when possible).
- PR should include:
  - What changed and why.
  - Affected paths (example: `themes/pxpd/login/*`, `k3s/values.yaml`).
  - Screenshots for UI/theme changes.
  - Any deployment impact (image tag, Helm values, secrets/vars).
