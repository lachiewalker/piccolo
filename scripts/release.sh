#!/bin/bash
set -e
rm -rf ./build/* ./dist/*
uv build
uv run twine upload dist/*
