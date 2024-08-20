# ComfyUI Docker Image Creation

## Purpose of the Document

This document serves as a comprehensive guide on how to build, run, and deploy the ComfyUI Docker image with custom models on the Akash network. It outlines various solutions considered during the development process, their advantages and drawbacks, and the final approach taken.

## Solutions Considered

### 1. Build the Image Including the Model

**Description**: This approach involved creating a Docker image that includes both the ComfyUI application and the custom models. [Dockerfile](./Dockerfile), The SDL is here: [SDL](./sdl.yml)

**Issues that might be faced**:

- **Large Image Size**: Including models significantly increases the size of the Docker image, making it cumbersome to build and deploy. This resulted in the image size being 18.77 GB when compressed.
- **Deployment Timeouts**: The Akash network providers often timed out during the deployment process due to the lengthy build times associated with large images. N/B: This may be due to insufficient space, do well to add use right storage volume.

### 2. Build the Image Without the Models

**Description**: This approach involves creating a Docker image that contains the ComfyUI application and its dependencies but does not include the custom models. See [Dockerfile](./Dockerfile_noModels) and the SDL is same as no. 1 except with the tag being 1.0.0 and the custom script being added. [SDL](./sdl_no_models.yml)

**Advantage**

The absence of large model files results in a significantly smaller Docker image, making it faster to build and deploy. This resulted in an image size of 3.45GB when compressed.

### 3. Using a Bash Script for Setup

**Description**: Instead of building a Docker image, a bash script is utilized as a user-data script that runs on startup to download models and set up project dependencies (pytorch, cuda, python, etc). This still uses a prebuilt image with nvidia cuda 12.1.0 installed on ubuntu 22.04 Here's the [SDL](./sdl_no_image.yml)

**Advantages**:

- This method simplifies the deployment process by avoiding the complexities of Docker image management.
- The script can be easily modified to accommodate changes in model requirements or dependencies.

**Drawback**:
Room for potential for errors. If the script fails during execution, it may leave the environment in an inconsistent state, and slow startup time.

## Building the Docker Image

You can build the image using the following commands.

```bash
docker build -t cuda_pytorch_comfyui_jupyter .

# The above may take a long time so you could run it in the background
nohup docker build -t cuda_pytorch_comfyui_jupyter . &
```

[Click here](./Dockerfile) to see the Dockerfile.

## Deploy/Run the image on Akash

After building the image, you can run it on akash by using the image tag in the image field of your akash sdl. See example below.

```yml
---
version: "2.0"
services:
  custom-comfyui:
    image: oscar2468/cuda_pytorch_comfyui_jupyter
```

[Click here](./sdl.yml) to see the SDL.

## Conclusion

After evaluating the three solutions, the second option of building an image without including the model might be deemed the most effective. It balances image size and deployment speed while allowing for flexibility in model management.
