#!/bin/bash
cd $(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
set -x
# Quantized 4bit
MODELREPO=eachadea/ggml-vicuna-13b-4bit
MODELFILE=ggml-vicuna-13b-4bit.bin

# Uncensored 7B
MODELREPO=TheBloke/vicuna-AlekseyKorshuk-7B-GPTQ-4bit-128g-GGML
MODELFILE=vicuna-AlekseyKorshuk-7B-GPTQ-4bit-128g.GGML.bin

# Uncensored 13B
MODELREPO=TheBloke/gpt4-x-vicuna-13B-GGML
MODELFILE=gpt4-x-vicuna-13B.ggml.q4_0.bin

[ -f ./models/${MODELFILE} ] || {
	python3 getmodel.py ${MODELREPO} ${MODELFILE}
	(cd /liama/models && cp --remove-destination $(readlink ${MODELFILE}) ${MODELFILE})
}
python3 -m venv /venv
./main -m ./models/${MODELFILE} --color -f ./prompts/alpaca.txt -ins -b 256 --top_k 10000 --temp 0.2 --repeat_penalty 1 -t 7
