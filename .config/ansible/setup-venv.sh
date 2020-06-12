#!/usr/bin/env sh

mkdir .facts-cache

python -m venv py-venv
source py-venv/bin/activate

pip install --upgrade ansible yamllint
