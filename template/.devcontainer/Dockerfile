FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl \
    && curl -fsSL https://github.com/openai/codex/releases/latest/download/install.sh -o /tmp/install-codex.sh \
    && CODEX_INSTALL_DIR=/usr/local/bin \
        CODEX_HOME=/opt/codex \
        CODEX_NON_INTERACTIVE=1 \
        sh /tmp/install-codex.sh \
    && rm -f /tmp/install-codex.sh \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
