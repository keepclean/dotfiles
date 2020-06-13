#!/usr/bin/env sh

mkdir -p .facts-cache

python3 -m venv py-venv
if . py-venv/bin/activate; then
    pip install --upgrade ansible yamllint
fi
