#!/bin/bash
set -e

echo "Rodando $MODEL_NAME versão $MODEL_VERSION..."

if [ "$MODEL_NAME" == "gpt4all" ]; then
    /models/gpt4all --model /models/gpt4all-$MODEL_VERSION.bin
elif [ "$MODEL_NAME" == "deepseek" ]; then
    /models/deepseek --model /models/deepseek-$MODEL_VERSION.bin
fi
