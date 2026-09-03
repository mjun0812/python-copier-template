# {{project_name}}

{{description}}

## Development Setup

After generating your project:

```bash
cd your-project-name

# Install dependencies
uv sync --locked

# Install pre-commit hooks
uv run pre-commit install

# Run tests
uv run pytest

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
Devcontainer automatically installs uv and Claude Code, and installs the latest Codex release when the image is built.
Rebuild the image to update Codex.

The container mounts the host `${HOME}/.claude` and `${HOME}/.codex` directories at `/home/vscode/.claude` and
`/home/vscode/.codex` for authentication. These bind mounts are read-write, so changes made in the container can
affect the host configuration. The uv cache is kept in a named volume and reused across container rebuilds.
