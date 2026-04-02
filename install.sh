#!/bin/bash
set -e
cd "$(dirname "$0")"
pip install -e ".[dev]"
echo "my-claw installed. Run: my-claw"
