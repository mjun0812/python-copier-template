# Python Copier Template

[![Copier](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/copier-org/copier/master/img/badge/badge-black.json)](https://github.com/copier-org/copier)
[![Test](https://github.com/mjun0812/python-copier-template/actions/workflows/test.yml/badge.svg)](https://github.com/mjun0812/python-copier-template/actions/workflows/test.yml)

A simple modern Python project template powered by [Copier](https://copier.readthedocs.io/).

[Article](https://mjunya.com/en/posts/2025-06-15-python-template/) [日本語記事](https://zenn.dev/mjun0812/articles/0ae2325d40ed20)

## Features

- 🚀 **Modern Python**: Support for Python 3.10-3.14
- 📦 **uv Package Manager**: Fast and reliable package management with [uv](https://github.com/astral-sh/uv)
- 🐳 **Docker Support**: Complete Docker development environment
- 📦 **Devcontainer Support**: VS Code devcontainer for consistent development
- ✨ **AI Editor Support**: [AGENTS.md](https://agents.md) and
  [CLAUDE.md](https://docs.anthropic.com/en/docs/claude-code/overview) included for AI-powered development
- 📝 **Type Hints**: Full type annotation support with modern Python features
- 🔍 **Code Quality**: Pre-configured Ruff for linting and formatting
- 🧪 **Testing**: pytest setup with example tests
- 🔧 **Pre-commit Hooks**: Automated code quality checks
- 🏗️ **CI Ready**: GitHub Actions workflows included

## Quick Start

### Pre-Requirements

- [uv](https://docs.astral.sh/uv/): Fast Python package installer

### Generate a New Project

```bash
uvx copier copy gh:mjun0812/python-copier-template your-project-name
```

Follow the interactive prompts to configure your project:

- **Project name**: Your project's name
- **Python version**: Choose from 3.10, 3.11, 3.12, 3.13, or 3.14
- **Package name**: The name used for importing your package (e.g., `import package_name`)
- **Description**: A short description of your project
- **Author name**: Your name
- **Author email**: Your email address

### Development Setup

After generating your project:

```bash
cd your-project-name

# Install dependencies
uv sync

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

### Docker Development Setup

The template includes a complete Docker setup:

```bash
# create uv.lock file
uv sync

# use the provided scripts
./docker/build.sh
./docker/run.sh # or./docker/run.sh (Command)

# Build and run with Docker Compose
docker compose build
docker compose up
```

### VS Code Devcontainer

Open the project in VS Code and use the "Reopen in Container" command for a fully configured development environment.
Devcontainer will automatically install uv, Claude Code, and pre-commit hooks. The image build installs the latest
Codex release, so rebuilding the image updates Codex.

The container mounts the host `${HOME}/.claude` and `${HOME}/.codex` directories at `/home/vscode/.claude` and
`/home/vscode/.codex` for authentication. These bind mounts are read-write, so changes made in the container can
affect the host configuration. The uv cache is kept in a named volume and reused across container rebuilds.

### Update Template

```bash
cd your-project-name
uvx copier update -A
```

## Project Structure

```text
your-project/
├── src/
│   └── your_project/          # Main package
├── tests/                     # Test files
├── docker/                    # Docker configuration
├── compose.yml               # Docker Compose setup
├── pyproject.toml            # Project configuration
└── README.md                 # Project documentation
```

## AI Editor Support

- [AGENTS.md(`./template/AGENTS.md`)](https://agents.md)
- [CLAUDE.md(`./template/CLAUDE.md`)](https://docs.claude.com/en/docs/claude-code/memory#claude-md-imports)

## Q&A

### Why don't you use a type checker?

I'm waiting for stable release of [`ty`](https://github.com/astral-sh/ty).
You can install and use your preferred type checker.

## Support

- 📖 [Copier Documentation](https://copier.readthedocs.io/)
- 🐍 [uv Documentation](https://docs.astral.sh/uv/)
- 🔍 [Ruff Documentation](https://docs.astral.sh/ruff/)
