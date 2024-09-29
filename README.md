# Basic Python Project

<img
    src="https://raw.githubusercontent.com/kamilrybacki/BasicPythonProject/media/banner.webp"
    alt="Basic Python Project"
    width="100%"
/>

## Overview

This project is a basic Python application designed to provide a template for building Python-based projects. It includes essential configurations for code linting, testing, and dependency management. The repository is structured to facilitate easy project setup and maintain good coding practices.

## Project Structure

```bash
..
│
├── LICENSE # License file for the project
├── README.md # Project README file
├── .gitignore # Specifies files and directories to be ignored by Git
├── pyproject.toml # PEP 518 configuration file for PEP 517 build system
├── .pre-commit-config.yaml # Configuration file for pre-commit hooks
├── Makefile # Makefile for common project tasks
├── src/
│ └── main.py # Main Python source file
├── tests/ # Directory for test files
└── .github/
  └── workflows/
    └── lint-code.yml # GitHub Actions workflow for code linting
    └── requirements.txt # List of dependencies for project utilities (for local and CI use)
```

## Getting Started

### Prerequisites

- Python 3.12 or higher
- `pip` (Python package installer)

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/BasicPythonProject.git
   cd BasicPythonProject
   ```

2. Run the `setup-project` script to set up the project:

   ```bash
   make setup-project
   ```

   This script will install the project dependencies and set up the pre-commit hooks.

### Running the Application

To run the main application script:

```bash
python src/main.py
```

## Code Quality and Linting

- **Ruff**: Ruff is a Python project template that includes several tools for code quality and linting, 
- **Mypy** is used for static type checking.

To run linters manually:

```bash
pylint src/
flake8 src/
mypy src/
```

Any auxiliary libraries that are used **only** for purposes of type-checking and/or linting, should be placed
in the [`.github/workflows/requirements.txt` file].

## Enforced code quality standards

## Code Quality Standards

The project enforces several code quality standards to ensure consistent and high-quality code.
The standards are defined through the use of tools such as Flake8, Pylint, and Mypy.
In other cases - the official Python style guide (PEP 8) is followed.

Below are the details of the enforced standards:

## Ruff

```ini
[tool.ruff]
target-version = "py312"  # Target Python version is 3.12
line-length = 120  # Maximum line length increased to 120
tab-size = 4  # Indentation width is set to 4 spaces

[tool.ruff.format]
indent-style = "space"  # Indentation style is set to spaces instead of tabs
quote-style = "double"  # Double quotes are used for strings

[tool.ruff.lint]
fixable = ["ALL"]
ignore = [  # Ignored linting rules
    "D100",  # missing-module-docstring
    "D101",  # missing-class-docstring
    "D102",  # missing-function-docstring
    "D103",  # missing-function-docstring
    "F401",  # Unused imports (can be adjusted based on need)
]

select = ["C90", "I", "E", "F", "N", "B", "A", "Q", "W", "RUF". "TID"]  # Selected linting rules
exclude = ["env/", "build/"]

[tool.ruff.lint.isort]
force-wrap-aliases = true

[tool.ruff.lint.flake8-quotes]
docstring-quotes = "double"
```

The selected linting rules are:

- **(C90)** *mccabe*: Cyclomatic complexity
- **(I)** *isort*: Import sorting
- **(E)** *pycodestyle*: PEP 8 style guide violations (errors)
- **(F)** *pyflakes*: Logical errors in code
- **(N)** *pep8-naming*: Naming conventions
- **(B)** *flake8-bugbear*: Additional checks for common issues
- **(A)** *flake8-builtins*: Checks for Python built-in shadowing
- **(Q)** *flake8-quotes*: Quote consistency
- **(W)** *pylint*: Code quality and style guide violations (warnings)
- **(RUF)** *ruff*: Ruff-specific rules
- **(TID)** *flake8-tidy-imports*: Import sorting and grouping

### Mypy

Mypy is used for type checking to ensure that the code adheres to the specified type annotations. The `mypy.ini` file includes:

- **Python Version**: The code is checked against Python version 3.12.
- **Exclusions**: Directories like `env/` and `build/` are excluded from type checking.

```ini
  disallow_untyped_defs = true  # Disallow untyped function definitions
  disallow_any_unimported = true  # Disallow unimported modules
  no_implicit_optional = true  # Disallow implicit Optional
  check_untyped_defs = true  # Check untyped definitions
  warn_unused_ignores = true  # Warn about unused # type: ignore comments
  warn_return_any = true  # Warn about missing return type annotations
  show_error_codes = true  # Show error codes in error messages
```

These configurations help maintain a clean, readable, and consistent codebase while ensuring compliance with specified coding standards.

## Continuous Integration

The project includes a GitHub Actions workflow (`.github/workflows/lint-code.yml`) to automatically lint code on every push or pull request.

Additionally, the project includes a GitHub Actions workflow (`.github/workflows/test-code.yml`) to automatically run tests on every push or pull request.

## License

This project is licensed under the MIT License. See the [LICENSE] file for details.

[`.github/workflows/requirements.txt` file]: .github/workflows/requirements.txt
[LICENSE]: LICENSE
