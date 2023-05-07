FROM ubuntu

RUN apt-get update && \
    apt-get install --no-install-recommends -y git vim build-essential python3-dev python3-venv python3-pip && \
    rm -rf /var/lib/apt/lists/*

RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"

WORKDIR /
COPY requirements.txt .
RUN pip3 install -r requirements.txt && rm requirements.txt

RUN git clone https://github.com/ggerganov/llama.cpp.git /liama
RUN cd /liama && make

# -----------------------------------------------------------------------------------------------------------------------
WORKDIR /liama
COPY getmodel.py entrypoint.bash .
CMD ./entrypoint.bash
