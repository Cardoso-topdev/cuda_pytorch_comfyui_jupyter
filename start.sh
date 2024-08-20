#!/bin/bash

cd /workspace/ComfyUI

mkdir -p /workspace/ComfyUI/custom_nodes
git clone --depth 1 https://github.com/jags111/ComfyUI_Jags_VectorMagic
git clone --depth 1 https://github.com/WASasquatch/was-node-suite-comfyui
git clone --depth 1 https://github.com/cubiq/ComfyUI_IPAdapter_plus
git clone --depth 1 https://github.com/pythongosssss/ComfyUI-WD14-Tagger
git clone --depth 1 https://github.com/pythongosssss/ComfyUI-Custom-Scripts
git clone --depth 1 https://github.com/Jordach/comfy-plasma
git clone --depth 1 https://github.com/melMass/comfy_mtb
git clone --depth 1 https://github.com/sipherxyz/comfyui-art-venture
git clone --depth 1 https://github.com/twri/sdxl_prompt_styler
git clone --depth 1 https://github.com/hylarucoder/comfyui-copilot
git clone --depth 1 https://github.com/theUpsider/ComfyUI-Logic
git clone --depth 1 https://github.com/alsritter/asymmetric-tiling-comfyui
git clone --depth 1 https://github.com/spinagon/ComfyUI-seamless-tiling
git clone --depth 1 https://github.com/cubiq/ComfyUI_essentials
git clone --depth 1 https://github.com/kijai/ComfyUI-KJNodes
git clone --depth 1 https://github.com/FlyingFireCo/tiled_ksampler
git clone --depth 1 https://github.com/gokayfem/ComfyUI-Texture-Simple
git clone --depth 1 https://github.com/KoreTeknology/ComfyUI-Universal-Styler
git clone --depth 1 https://github.com/jakechai/ComfyUI-JakeUpgrade
git clone --depth 1 https://github.com/rgthree/rgthree-comfy

# Create necessary directories
mkdir -p /workspace/ComfyUI/models
mkdir -p /workspace/ComfyUI/models/deepbump
mkdir -p /workspace/ComfyUI/models/ipadapter
mkdir -p /workspace/ComfyUI/models/clip_vision
mkdir -p /workspace/ComfyUI/models/upscale_models
mkdir -p /workspace/ComfyUI/models/checkpoints
mkdir -p /workspace/ComfyUI/models/vae

# Download deepbump model
# cd /workspace/ComfyUI/models/deepbump/
# wget -q https://github.com/HugoTini/DeepBump/blob/master/deepbump256.onnx

# # Download IP-Adapter model
# cd /workspace/ComfyUI/models/ipadapter/
# wget -q https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus_sdxl_vit-h.safetensors

# # Download CLIP vision model
# cd /workspace/ComfyUI/models/clip_vision/
# wget -q https://huggingface.co/h94/IP-Adapter/resolve/main/models/image_encoder/model.safetensors
# mv model.safetensors CLIP-ViT-H-14-laion2B-s32B-b79K.safetensors

# # Download upscale model
# cd /workspace/ComfyUI/models/upscale_models/
# wget -q https://huggingface.co/gemasai/4x_NMKD-Siax_200k/resolve/main/4x_NMKD-Siax_200k.pth

# # Download checkpoints
# cd /workspace/ComfyUI/models/checkpoints/
# wget -q https://huggingface.co/RunDiffusion/Juggernaut-XL-v9/resolve/main/Juggernaut-XL_v9_RunDiffusionPhoto_v2.safetensors
# wget -q https://civitai.com/api/download/models/456538 -O Juggernaut-XL_inpaint.safetensors

# # Download VAE model
# cd /workspace/ComfyUI/models/vae/
# wget -q https://huggingface.co/stabilityai/sdxl-vae/resolve/main/sdxl_vae.safetensors

cd /workspace/