FROM pytorch/pytorch:2.1.1-cuda12.1-cudnn8-runtime

# Set environment variables for Python 3.10
ENV PATH="/opt/conda/bin:${PATH}"
ENV PYTHON_VERSION=3.10

COPY environment.yml .
# Install FFmpeg and other necessary packages
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    ffmpeg \
 && rm -rf /var/lib/apt/lists/*
RUN conda update ffmpeg

ENV CUDA_VERSION=12.1

RUN apt-get update && apt-get install -y \
    git \
 && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip && \
    pip install --no-cache-dir \
    jupyterlab \
    ftfy regex tqdm \
    git+https://github.com/openai/CLIP.git \
    smplx \
    scipy \
    matplotlib \
    spacy[cuda12x] \
    numpy==1.23.5 \
    chumpy
RUN python -m spacy download en_core_web_sm

#    _libgcc_mutex==0.1 \
#    _openmp_mutex==5.1 \
#    beautifulsoup4==4.11.1 \
#    blas==1.0 \
#    brotlipy==0.7.0 \
#    ca-certificates==2022.07.19 \
#    catalogue==2.0.8 \
#    certifi==2022.6.15 \
#    cffi==1.15.1 \
#    charset-normalizer==2.1.1 \
#    colorama==0.4.5 \
#    cryptography==35.0.0 \
#    cudatoolkit==11.0.221 \
#    cycler==0.11.0 \
#    cymem==2.0.6 \
#    dataclasses==0.8 \
#    dbus==1.13.18 \
#    expat==2.4.9 \
#    fftw==3.3.9 \
#    filelock==3.8.0 \
#    fontconfig==2.13.1 \
#    freetype==2.11.0 \
#    gdown==4.5.1 \
#    giflib==5.2.1 \
#    glib==2.69.1 \
#    gst-plugins-base==1.14.0 \
#    gstreamer==1.14.0 \
#    h5py==3.7.0 \
#    hdf5==1.10.6 \
#    icu==58.2 \
#    idna==3.4 \
#    intel-openmp==2021.4.0 \
#    jinja2==3.1.2 \
#    joblib==1.1.0 \
#    jpeg==9b \
#    kiwisolver==1.4.2 \
#    langcodes==3.3.0 \
#    lcms2==2.12 \
#    ld_impl_linux-64==2.38 \
#    libffi==3.3 \
#    libgcc-ng==11.2.0 \
#    libgfortran-ng==11.2.0 \
#    libgfortran5==11.2.0 \
#    libgomp==11.2.0 \
#    libpng==1.6.37 \
#    libstdcxx-ng==11.2.0 \
#    libtiff==4.1.0 \
#    libuuid==1.0.3 \
#    libuv==1.40.0 \
#    libwebp==1.2.0 \
#    libxcb==1.15 \
#    libxml2==2.9.14 \
#    lz4-c==1.9.3 \
#    markupsafe==2.1.1 \
#    matplotlib==3.1.3 \
#    matplotlib-base==3.1.3 \
#    mkl==2021.4.0 \
#    mkl-service==2.4.0 \
#    mkl_fft==1.3.1 \
#    mkl_random==1.2.2 \
#    ncurses==6.3 \
#    ninja==1.10.2 \
#    ninja-base==1.10.2 \
#    numpy==1.21.5 \
#    numpy-base==1.21.5 \
#    openssl==1.1.1q \
#    packaging==21.3 \
#    pathy==0.6.2 \
#    pcre==8.45 \
#    pillow==9.2.0 \
#    pip==22.2.2 \
#    pycparser==2.21 \
#    pydantic==1.8.2 \
#    pyopenssl==22.0.0 \
#    pyparsing==3.0.9 \
#    pyqt==5.9.2 \
#    pysocks==1.7.1 \
#    python==3.7.13 \
#    python-dateutil==2.8.2 \
#    python_abi==3.7 \
#    qt==5.9.7 \
#    readline==8.1.2 \
#    requests==2.28.1 \
#    scikit-learn==1.0.2 \
#    scipy==1.7.3 \
#    setuptools==63.4.1 \
#    shellingham==1.5.0 \
#    sip==4.19.8 \
#    six==1.16.0 \
#    smart_open==5.2.1 \
#    soupsieve==2.3.2.post1 \
#    spacy==3.3.1 \
#    spacy-legacy==3.0.10 \
#    spacy-loggers==1.0.3 \
#    sqlite==3.39.3 \
#    threadpoolctl==2.2.0 \
#    tk==8.6.12 \
#    tornado==6.2 \
#    tqdm==4.64.1 \
#    trimesh==3.15.3 \
#    typer==0.4.2 \
#    wheel==0.37.1 \
#    xz==5.2.6 \
#    zipp==3.8.1 \
#    zlib==1.2.12 \
#    zstd==1.4.9

# Optionally, you can specify the CUDA version if needed

# Install PyTorch with GPU support (adjust the version and other flags as needed)
# For PyTorch with CUDA 11.1, you can use:
# RUN pip install torch==1.9.1+cu111 torchvision==0.10.1+cu111 torchaudio==0.9.1 -f https://download.pytorch.org/whl/torch_stable.html

# Set the working directory
# WORKDIR /app

# Copy your application code into the container (assuming your code is in the same directory as your Dockerfile)
#COPY . /app
