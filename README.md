# Python Project Template

A modern Python project template powered by [Copier](https://copier.readthedocs.io/).

## Features

- **Python 3.12/3.13** support with strict type hints
- **uv** for fast dependency management
- **ruff** for linting and formatting
- **mypy** for static type checking
- **pytest** for testing with coverage
- **structlog** for production-ready structured logging
- **pre-commit** hooks for code quality automation
- **VS Code** configuration included

## Requirements

- Python 3.10+ (for running copier)
- Git 2.27+
- [uv](https://docs.astral.sh/uv/)
- [Copier](https://copier.readthedocs.io/)

## Usage

### Generate a new project

```bash
# Install copier (if not already installed)
pipx install copier
# or
uv tool install copier

# Generate a new project from this template
copier copy gh:your-username/python-template /path/to/new-project --trust

# Or from a local copy
copier copy /path/to/python-template /path/to/new-project --trust
```

The `--trust` flag is required because the template runs post-generation tasks (git init, uv sync, pre-commit install).

### Update an existing project

When the template is updated, you can pull in the latest changes:

```bash
cd /path/to/your-project
copier update --trust
```

## Template Options

| Option | Description | Default |
|--------|-------------|---------|
| `project_name` | Human-readable project name | - |
| `project_slug` | PyPI package name (lowercase with hyphens) | derived from project_name |
| `package_name` | Python package name (snake_case) | derived from project_slug |
| `description` | Brief project description | "Add your description here" |
| `author_name` | Author's full name | - |
| `author_email` | Author's email address | - |
| `python_version` | Python version (3.12 or 3.13) | 3.12 |
| `license` | Project license | MIT |

## Generated Project Structure

```text
your-project/
├── your_package/           # Main package (dynamic name)
│   ├── __init__.py
│   ├── main.py             # Application entry point
│   ├── logging.py          # Structured logging configuration
│   └── py.typed            # PEP 561 marker
├── tests/
│   ├── __init__.py
│   └── test_main.py
├── .vscode/
│   └── settings.json       # VS Code configuration
├── .copier-answers.yml     # Copier answers (for updates)
├── .gitattributes
├── .gitignore
├── .pre-commit-config.yaml
├── .python-version
├── pyproject.toml
└── README.md
```

## Post-Generation Tasks

After generating a project, the template automatically:

1. Initializes a git repository (`git init`)
2. Installs dependencies (`uv sync`)
3. Sets up pre-commit hooks (`uv run pre-commit install`)

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

## License

MIT
