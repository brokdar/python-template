# Python Project Template

[![Python](https://img.shields.io/badge/python-3.12%20%7C%203.13-blue?style=flat-square&logo=python&logoColor=white)](https://www.python.org/)
[![Copier](https://img.shields.io/badge/copier-template-yellow?style=flat-square)](https://copier.readthedocs.io/)
[![License](https://img.shields.io/github/license/brokdar/python-template?style=flat-square)](LICENSE)
[![uv](https://img.shields.io/badge/uv-package%20manager-blueviolet?style=flat-square)](https://docs.astral.sh/uv/)
[![Ruff](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/ruff/main/assets/badge/v2.json&style=flat-square)](https://docs.astral.sh/ruff/)

> Opinionated [Copier](https://copier.readthedocs.io/) template for production-ready Python projects.
> Zero config. Type-safe. Modern tooling.

## Highlights

- **Python 3.12/3.13** with strict type hints and PEP 561 compliance
- **[uv](https://docs.astral.sh/uv/)** for blazing-fast dependency management
- **[ruff](https://docs.astral.sh/ruff/)** for linting + formatting (replaces black, isort, flake8)
- **[mypy](https://mypy.readthedocs.io/)** or **[pyrefly](https://github.com/AstriconGmbH/pyrefly)** for static type checking
- **[pytest](https://docs.pytest.org/)** with coverage out of the box
- **[structlog](https://www.structlog.org/)** for production-ready structured logging
- **[pre-commit](https://pre-commit.com/)** hooks auto-configured
- **Optional**: Dockerfile, VS Code devcontainer, Claude Code support, GitHub Actions / GitLab CI

## Quick Start

### Create a new project

```bash
uvx copier copy gh:brokdar/python-template ./my-project --trust
```

### Skip all prompts (use defaults)

```bash
uvx copier copy gh:brokdar/python-template ./my-project --trust --defaults
```

### Override specific options

```bash
uvx copier copy gh:brokdar/python-template ./my-project --trust \
  --data project_name="My App" \
  --data python_version="3.13" \
  --data include_dockerfile=true
```

> **Note**: The `--trust` flag is required because the template runs post-generation tasks (`git init`, `uv sync`, `pre-commit install`).

## Updating Your Project

Pull in the latest template changes:

```bash
cd ./my-project
uvx copier update --trust
```

Skip prompts and keep current answers:

```bash
uvx copier update --trust --defaults
```

Change template options during update:

```bash
uvx copier update --trust --data include_dockerfile=true
```

Or edit `.copier-answers.yml` directly, then run `uvx copier update --trust`.

## Template Options

| Option | Description | Default |
|--------|-------------|---------|
| `project_name` | Human-readable project name | *required* |
| `project_slug` | PyPI package name (lowercase, hyphens) | derived |
| `package_name` | Python import name (snake_case) | derived |
| `description` | Brief project description | `"Add your description here"` |
| `author_name` | Author's full name | *required* |
| `author_email` | Author's email address | *required* |
| `python_version` | Python version (`3.12`, `3.13`) | `3.12` |
| `type_checker` | Type checker (`mypy`, `pyrefly`) | `mypy` |
| `license` | License (`MIT`, `None`) | `MIT` |
| `include_devcontainer` | VS Code devcontainer config | `false` |
| `include_dockerfile` | Multi-stage Alpine Dockerfile | `false` |
| `claude_support` | Claude Code integration | `false` |
| `ci_provider` | CI/CD (`None`, `github`, `gitlab`) | `None` |

<details>
<summary><strong>Generated Project Structure</strong></summary>

```text
my-project/
├── my_package/               # Main package (dynamic name)
│   ├── __init__.py
│   ├── main.py               # Application entry point
│   ├── logging.py            # Structured logging config
│   └── py.typed              # PEP 561 marker
├── tests/
│   ├── __init__.py
│   └── test_main.py
├── .devcontainer/            # (if include_devcontainer)
│   ├── devcontainer.json
│   └── startup.sh
├── .claude/                  # (if claude_support)
│   ├── agents/
│   └── commands/
├── .github/workflows/        # (if ci_provider=github)
│   └── ci.yml
├── .vscode/
│   └── settings.json
├── .copier-answers.yml       # Template answers (for updates)
├── .gitignore
├── .pre-commit-config.yaml
├── .python-version
├── pyproject.toml
├── Dockerfile                # (if include_dockerfile)
├── LICENSE                   # (if license=MIT)
├── CLAUDE.md                 # (if claude_support)
└── README.md
```

</details>

## Post-Generation

The template automatically runs:

1. `git init --initial-branch=main`
2. `uv sync` — installs all dependencies
3. `uvx prek install` — configures pre-commit hooks

Start coding immediately:

```bash
cd ./my-project
uv run python -m my_package.main
uv run pytest
uv run ruff check .
uv run mypy .
```

## Development

### Testing the template locally

```bash
# Generate a test project
copier copy . /tmp/test-project --trust

# Verify the generated project
cd /tmp/test-project
uv run pytest
uv run mypy .
uv run ruff check .
```

### Template structure

- `copier.yaml` — Template configuration (questions, defaults, validators, tasks)
- `template/` — All template files (Jinja2 processed)
- Conditional directories use Jinja syntax: `{% if condition %}dirname{% endif %}/`

## License

[MIT](LICENSE)
