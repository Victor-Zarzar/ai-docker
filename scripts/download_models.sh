#!/bin/bash
set -e

mkdir -p /models
cd /models

echo "Baixando modelo $MODEL_NAME versão $MODEL_VERSION..."
if [ "$MODEL_NAME" == "gpt4all" ]; then
    wget -O gpt4all-$MODEL_VERSION.bin "https://gpt4all.io/models/gpt4all-$MODEL_VERSION.bin"
    wget -O gpt4all "https://gpt4all.io/binaries/gpt4all-linux-x86_64"
    chmod +x gpt4all
elif [ "$MODEL_NAME" == "deepseek" ]; then
    wget -O deepseek-$MODEL_VERSION.bin "https://huggingface.co/deepseek/deepseek-$MODEL_VERSION.bin"
fi

echo "Modelo $MODEL_NAME $MODEL_VERSION baixado!"
