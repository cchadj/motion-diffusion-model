FROM pytorch/pytorch:1.7.1-cuda11.0-cudnn8-runtime

# ENV PYTHON_VERSION=3.8.5
# ENV CUDA_VERSION=11.0
# ENV PATH="/opt/conda/bin:${PATH}"

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
 && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip && \
    pip install --no-cache-dir \
    jupyterlab \
    ftfy \
    regex \
    tqdm \
    git+https://github.com/openai/CLIP.git \
    smplx \
    scipy \
    matplotlib \
    spacy[cuda110] \
    numpy==1.23.5 \
    chumpy \
    Flask \
    Celery \
    redis

RUN python -m spacy download en_core_web_sm

CMD ["jupyter", "lab", "--ip", "0.0.0.0", "--no-browser", "--allow-root"]
