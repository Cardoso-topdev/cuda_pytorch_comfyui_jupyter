# Stage 1: Download models
FROM oscar2468/cpcj-models as downloader

# OR build from scratch
# FROM alpine:latest as downloader

# # Install necessary tools
# RUN apk add --no-cache wget

# # Create directories for models
# RUN mkdir -p /workspace/ComfyUI/models/deepbump /workspace/ComfyUI/models/ipadapter /workspace/ComfyUI/models/clip_vision /workspace/ComfyUI/models/upscale_models /workspace/ComfyUI/models/checkpoints /workspace/ComfyUI/models/vae

# # Download models
# RUN cd /workspace/ComfyUI/models/deepbump && wget https://github.com/HugoTini/DeepBump/raw/master/deepbump256.onnx
# RUN cd /workspace/ComfyUI/models/ipadapter && wget https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus_sdxl_vit-h.safetensors
# RUN cd /workspace/ComfyUI/models/clip_vision && wget https://huggingface.co/h94/IP-Adapter/resolve/main/models/image_encoder/model.safetensors && \
#     mv model.safetensors CLIP-ViT-H-14-laion2B-s32B-b79K.safetensors
# RUN cd /workspace/ComfyUI/models/upscale_models && wget https://huggingface.co/gemasai/4x_NMKD-Siax_200k/resolve/main/4x_NMKD-Siax_200k.pth
# RUN cd /workspace/ComfyUI/models/checkpoints && wget https://huggingface.co/RunDiffusion/Juggernaut-XL-v9/resolve/main/Juggernaut-XL_v9_RunDiffusionPhoto_v2.safetensors && \
#     wget https://civitai.com/api/download/models/456538 -O Juggernaut-XL_inpaint.safetensors
# RUN cd /workspace/ComfyUI/models/vae && wget https://huggingface.co/stabilityai/sdxl-vae/resolve/main/sdxl_vae.safetensors



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

COPY --from=downloader /workspace/ComfyUI/models /workspace/ComfyUI/models

# Set the default command for the container
CMD ["bash", "-c", "nohup jupyter notebook --ip=0.0.0.0 --no-browser --allow-root --NotebookApp.token=${JUPYTER_PASSWORD} & python3 /workspace/ComfyUI/main.py --listen --port=3000"]