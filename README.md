# Custom Comfyui Image

The provided Dockerfile is designed to run a ComfyUI instance with some specific dependencies and Jupyter notebook. ComfyUI is a node-based user interface for Stable Diffusion, a popular AI model for generating images from text prompts. This setup utilizes the NVIDIA CUDA base image to leverage GPU acceleration for deep learning tasks.

## Requirements

- Docker Environment
- Nvidia GPU
- Atleast 30 GB storage space, 16GB Memory

## How to run

> First note this, https://docs.github.com/en/actions/using-github-hosted-runners/using-larger-runners/about-larger-runners

### Build and run locally

```bash
# Clone repo
git clone git@github.com:Cardoso-topdev/cuda_pytorch_comfyui_jupyter.git
cd cuda_pytorch_comfyui_jupyter

# Build image
docker build -t custom-comfyui:latest .

# Run container
docker run -p 80:80 -p 8888:8888 custom-comfyui
```

### Running

```bash
# Simply pull and run from docker hub
docker run oscar2468/cuda_pytorch_comfyui_jupyter
```

## Author

- Oscar Cardoso ([Cardoso-topdev](https://github.com/Cardoso-topdev))
