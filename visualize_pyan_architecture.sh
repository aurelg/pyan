#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

echo -ne "Pyan architecture: generating architecture.{dot,svg}\n"
python3 \
  -m pyan pyan/*.py \
  --no-defines --uses --colored --annotate --dot -V \
  >architecture.dot \
  2>architecture.log
dot -Tsvg architecture.dot >architecture.svg

python3 -m pyan pyan/*.py --no-defines --uses \
  --grouped --nested-groups \
  --graphviz-layout fdp \
  --colored --html >architecture.html
