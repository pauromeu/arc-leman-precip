.PHONY: install lint fmt test

# Install runtime + dev dependencies into the current uv virtual environment
install:
	uv pip install -r pyproject.toml --extra dev

# Run formatters / linters (read‑only)
lint:
	ruff check .
	black --check .
	mypy .

# Auto‑fix style issues that are safe to fix
fmt:
	ruff check --fix .
	black .

# Run unit tests
test:
	pytest