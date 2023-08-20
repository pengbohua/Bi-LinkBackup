#!/usr/bin/env bash

set -x
set -e

DATA_DIR="$1"
model_path="$2"
RELATION_PATH="${DATA_DIR}/relation.json"


python3 -u eval_wiki5m_trans.py \
--task "WN18RR" \
--is-test \
--eval-model-path "${model_path}" \
--rel-path "${RELATION_PATH}" \
--prefix-seq-len 80 \
--rerank-n-hop 5 \
--num-rels 822 \
--neighbor-weight 0.05 \
--train-path "$DATA_DIR/train.txt.json" \
--valid-path "$DATA_DIR/test.txt.json" "$@"
