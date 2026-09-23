#!/bin/bash

dnf5 -y install \
    hipblas \
    hipblaslt \
    hipfft \
    hiprand \
    hipsolver \
    hipsparse \
    hipsparselt \
    miopen \
    rccl \
    rocm-hip \
    rocm-opencl \
    rocm-smi \
    rocminfo \
    rocsolver \
    roctracer
