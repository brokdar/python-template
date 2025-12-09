#!/bin/bash
set -e

echo "Initializing development environment..."

echo "Installing dependencies..."
curl -LsSf https://astral.sh/uv/install.sh | sh

echo "Setting up uv..."
uv sync

echo "Setting up pre-commit hooks..."
uv tool install prek
prek install

echo "Development environment setup complete!"
