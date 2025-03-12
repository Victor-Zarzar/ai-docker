#!/bin/bash
set -e

echo "Rodando $MODEL_NAME versão $MODEL_VERSION..."

if [ "$MODEL_NAME" == "gpt4all" ]; then

  /models/gpt4all --model /models/gpt4all-$MODEL_VERSION.bin --temp 0.7 --top_k 40 --top_p 0.9 --threads 4 --n_predict 256 --seed 42 --server
elif [ "$MODEL_NAME" == "deepseek" ]; then
  /models/deepseek --model /models/deepseek-$MODEL_VERSION.bin
fi