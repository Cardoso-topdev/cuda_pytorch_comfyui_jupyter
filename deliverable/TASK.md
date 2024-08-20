# AI/ML DevOps Candidate Test: ComfyUI Docker Image Creation

## Objective

Create a minimal, efficient Docker image that runs ComfyUI with specific dependencies and executes a provided installation script. The image should be deployable on Akash Network and include Jupyter notebook functionality.

## Requirements

### Base Image

1. Start with a clean Ubuntu 22.04 base image.
2. Do not use RunPod images as a base, they can be used as reference though. This is the base we used previously: https://hub.docker.com/layers/runpod/pytorch/2.2.0-py3.10-cuda12.1.1-devel-ubuntu22.04/images/sha256-75bf115d87ee3813f8026fed3e11bae3bf68bfd789a9566878735245b723ef8b?context=explore

### Core Components

1. Install CUDA 12.1 (this is a mandatory requirement).
2. Install PyTorch 2.3.0 and ensure all related libraries are compatible with this version.
3. Install all other necessary libraries required by the below ComfyUI workflow.

### ComfyUI Setup

1. Clone and set up ComfyUI in the image.
2. Include and execute the provided `install_mgen_comfyui_dependencies.sh` script during the image build process.
3. Ensure all dependencies and models specified in the script are correctly installed and accessible.

### Additional Software

1. Install Jupyter Notebook with token-based authentication.
2. Include only the necessary dependencies for running ComfyUI and the provided workflow. Avoid including unnecessary packages to keep the image size minimal.

### Testing and Validation

1. Verify that the provided test workflow can be loaded and runs without errors in ComfyUI.
2. Ensure that all custom nodes, models, and other components specified in the installation script are functional.

### Image Optimization

1. Optimize the Docker image for size and performance. Use multi-stage builds if appropriate.
2. Implement best practices for Docker image creation (e.g., layer caching, minimizing the number of layers).

### Documentation

1. Provide basic documentation on how to build and run the Docker image.

### Deployment

1. Ensure the image is compatible with Akash Network deployment specifications.
2. Provide a sample deployment configuration for Akash Network.

## Deliverables

1. Dockerfile and any necessary build scripts.
2. Documentation for building, running, and deploying the image.

## Time Allocation

Please manage your time effectively and communicate any significant roadblocks you encounter.
