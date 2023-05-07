#!/bin/bash
cd $(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
set -x
# Simple
# MODELREPO=eachadea/ggml-vicuna-13b-4bit
# MODELFILE=ggml-vicuna-13b-4bit.bin

# Uncensored
MODELREPO=TheBloke/vicuna-AlekseyKorshuk-7B-GPTQ-4bit-128g-GGML
MODELFILE=vicuna-AlekseyKorshuk-7B-GPTQ-4bit-128g.GGML.bin

[ -f ./models/${MODELFILE} ] || {
	python3 getmodel.py ${MODELREPO} ${MODELFILE}
	(cd /liama/models && cp --remove-destination $(readlink ${MODELFILE}) ${MODELFILE})
}
python3 -m venv /venv
./main -m ./models/${MODELFILE} --color -f ./prompts/alpaca.txt -ins -b 256 --top_k 10000 --temp 0.2 --repeat_penalty 1 -t 7
