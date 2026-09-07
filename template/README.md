# {{project_name}}

{{description}}

## Development Setup

After generating your project:

```bash
cd your-project-name

# Install dependencies
uv sync --locked

# Install git hooks
uv run prek install

# Run the application
uv run {{project_name}}

# Run tests
uv run pytest
# Run tests with coverage
uv run pytest --cov

# Run formatting and linting (automatically runs on commit)
uv run ruff format .
uv run ruff check .
# Auto Fix
uv run ruff check . --fix
```

### Docker Development

The template includes a complete Docker setup:

```bash
# use the provided scripts
./docker/build.sh
./docker/run.sh # or./docker/run.sh (Command)

# Build and run with Docker Compose
docker compose build
docker compose up
```

### VS Code Devcontainer

Open the project in VS Code and use the "Reopen in Container" command for a fully configured development environment.
Devcontainer automatically installs uv, Claude Code, and Codex. The latest Claude Code and Codex releases are
installed with their official installers when the image is built, so rebuild the image to update them.

The container mounts the host `${HOME}/.claude` and `${HOME}/.codex` directories at `/home/vscode/.claude` and
`/home/vscode/.codex` for authentication. These bind mounts are read-write, so changes made in the container can
affect the host configuration. The uv cache is kept in a named volume and reused across container rebuilds.
