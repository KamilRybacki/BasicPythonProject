.PHONY: all
all:
	@echo "Use 'make install' or 'make install-dev'"

setup-project:
	@echo "Setting up project in $(PWD)..."
	@echo "Creating virtual environment..."
	@python3 -m venv .venv
	@echo "Activating virtual environment..."
	@. $(PWD)/.venv/bin/activate
	@echo "Installing project utilities..."
	@pip install -r .github/workflows/requirements.txt
	@pre-commit install
	@echo "Project setup complete."

install:
	@echo "Installing project..."
	@flit install --deps production

install-dev:
	@echo "Installing project with development dependencies..."
	@flit install --deps develop --symlink

lint:
	@echo "Running quality checks..."
	@pre-commit run --all-files

format-code:
	@echo "Formatting code..."
	@ruff format --config pyproject.toml
