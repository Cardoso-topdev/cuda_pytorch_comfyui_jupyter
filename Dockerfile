# Main build    
FROM nvidia/cuda:12.1.0-base-ubuntu22.04

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV JUPYTER_PASSWORD=Kfeij149EAhna14a
ENV SHELL=/bin/bash

# Set the working directory
WORKDIR /

# Create workspace directory
RUN mkdir /workspace

# Update, upgrade, install packages, install python if PYTHON_VERSION is specified, clean up
RUN apt-get update --yes && \
    apt-get upgrade --yes && \
    apt install --yes --no-install-recommends git wget curl bash libgl1 software-properties-common openssh-server && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen

# Set up Python and pip
RUN apt-get update && apt-get install -y --no-install-recommends python3 python3-pip python3-dev build-essential

# Setup jupyter notebook and pytorch
RUN pip3 install --no-cache-dir notebook torch==2.3.0 torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu121

# Install ComfyUI and ComfyUI Manager
RUN cd /workspace && git clone https://github.com/comfyanonymous/ComfyUI.git && \
    cd /workspace/ComfyUI && \
    pip3 install -r requirements.txt

# Start Scripts
COPY start.sh /start.sh
RUN chmod +x /start.sh && ./start.sh

# Set the default command for the container
CMD ["bash", "-c", "nohup jupyter notebook --ip=0.0.0.0 --no-browser --allow-root --NotebookApp.token=${JUPYTER_PASSWORD} & python3 /workspace/ComfyUI/main.py --listen --port=3000"]