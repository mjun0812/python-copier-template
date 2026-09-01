FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

ARG CODEX_VERSION=0.121.0
ARG CODEX_SHA256_AMD64=f053ac81e9c6769920f9ee3566abad47ab0856eb7ee792428681664ece113430
ARG CODEX_SHA256_ARM64=9ce5edd5524898ad2e95b59f278977e312726e0587957d1f10ee389070fe5034

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl \
    && case "$(uname -m)" in \
        x86_64) codex_target="x86_64-unknown-linux-gnu"; codex_sha256="${CODEX_SHA256_AMD64}" ;; \
        aarch64 | arm64) codex_target="aarch64-unknown-linux-gnu"; codex_sha256="${CODEX_SHA256_ARM64}" ;; \
        *) echo "Unsupported architecture: $(uname -m)" >&2; exit 1 ;; \
    esac \
    && curl -fsSL \
        "https://github.com/openai/codex/releases/download/rust-v${CODEX_VERSION}/codex-${codex_target}.tar.gz" \
        -o /tmp/codex.tar.gz \
    && echo "${codex_sha256}  /tmp/codex.tar.gz" | sha256sum --check --strict \
    && tar -xzf /tmp/codex.tar.gz -C /tmp \
    && install -m 0755 "/tmp/codex-${codex_target}" /usr/local/bin/codex \
    && rm -f /tmp/codex.tar.gz "/tmp/codex-${codex_target}" \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
