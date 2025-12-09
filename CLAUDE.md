# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **Copier template** for generating Python projects. It is NOT a Python application itself - it's a template repository that users instantiate via `copier copy` to create new Python projects.

## Commands

### Testing the Template

```bash
# Generate a test project (use --trust for post-generation tasks)
copier copy . /tmp/test-project --trust

# Verify the generated project
cd /tmp/test-project
uv run pytest
uv run mypy .
uv run ruff check .
```

### Updating a Generated Project

```bash
cd /path/to/generated-project
copier update --trust
```

## Architecture

### Template Structure

- `copier.yaml` - Template configuration: questions, defaults, validators, and post-generation tasks
- `template/` - All template files live here (configured via `_subdirectory: template`)
- `.jinja` suffix files - Processed by Jinja2 templating engine
- Conditional directories use Jinja syntax in folder names: `{% if condition %}dirname{% endif %}/`

### Template Variables

Key variables defined in `copier.yaml`:
- `project_name` / `project_slug` / `package_name` - Naming hierarchy
- `python_version` - 3.12 or 3.13
- `include_devcontainer` / `include_dockerfile` / `claude_support` - Optional feature flags
- `license` - MIT or None

### Generated Project Features

Projects generated from this template include:
- **uv** for dependency management
- **ruff** for linting/formatting
- **mypy** in strict mode for type checking
- **pytest** with coverage support
- **structlog** for structured logging
- **pre-commit** hooks that run ruff, mypy, and tests

### Conditional Features

Template files are conditionally included using Jinja2 directory naming:
- `.devcontainer/` - When `include_devcontainer` is true
- `Dockerfile` - When `include_dockerfile` is true
- `.claude/` and `docs/` - When `claude_support` is true
- `LICENSE` - When `license` is MIT

## Working with This Codebase

- Template files use `{{ variable }}` for substitutions and `{% if %}` for conditionals
- The `{{package_name}}` directory becomes the actual Python package in generated projects
- Post-generation tasks in `copier.yaml` (`_tasks`) run `git init`, `uv sync`, and `pre-commit install`
- Test changes by generating a fresh project to `/tmp/` and running its test suite
