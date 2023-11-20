# Imagen de CUDA 12.2.2 con CUDNN 8 y Ubuntu
FROM nvidia/cuda:12.2.2-cudnn8-runtime-ubuntu20.04

# Dependencias de sistema
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    wget \
    ca-certificates \
    python3 \
    python3-pip \
    python3-venv \
    python3-dev \
    cuda-toolkit \
    nvidia-gds

# Establecer el directorio de trabajo
WORKDIR /workspace

# Instalar Jupyter
RUN pip3 install notebook

# Exponer puerto
EXPOSE 8888

# Iniciar servidor Jupyter en local
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
