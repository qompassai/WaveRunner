# OpenBLAS: High-Performance Basic Linear Algebra Subprograms

OpenBLAS is an optimized implementation of BLAS (Basic Linear Algebra Subprograms) based on GotoBLAS2 1.13 BSD version. It provides a set of low-level routines for performing common linear algebra operations such as vector addition, scalar multiplication, dot products, linear combinations, and matrix multiplication.

## Why OpenBLAS Matters for GenAI Workloads

1. Performance: OpenBLAS is highly optimized for various CPU architectures, providing near-optimal performance for linear algebra operations crucial in machine learning and AI algorithms.

2. Foundation for AI Frameworks: Many popular AI and machine learning frameworks (e.g., TensorFlow, PyTorch) rely on BLAS libraries like OpenBLAS for their core computations.

3. Efficient Matrix Operations: GenAI models, particularly large language models, heavily depend on matrix multiplications and other linear algebra operations. OpenBLAS accelerates these computations, significantly reducing training and inference times.

4. Hardware Optimization: This build is optimized for Intel Haswell architecture, ensuring excellent performance on compatible systems.

5. Multi-threading Support: With OpenMP support, OpenBLAS can efficiently utilize multi-core processors, further speeding up AI workloads.

6. Memory Efficiency: OpenBLAS implements algorithms that make efficient use of CPU caches, crucial for handling the large matrices involved in GenAI models.

By using OpenBLAS, developers and researchers can significantly accelerate their GenAI workflows, from data preprocessing to model training and inference, ultimately enabling faster iteration and more complex models.


# Qompass OpenBLAS Release

Version: 0.3.28.dev, compiled on Arch Linux machine with x86_64 processor

## Build Instructions

1. Clone the OpenBLAS repository:
   ```bash
   git clone https://github.com/xianyi/OpenBLAS.git
   cd OpenBLAS
   ```

## Build Instructions

2. Build OpenBLAS:
   ```bash
   make TARGET=<target> USE_OPENMP=1
   ```
   Replace <target> with one of the following options:

   x86/x86_64 targets:
   - KATMAI, COPPERMINE, NORTHWOOD, PRESCOTT, BANIAS, CORE2
   - PENRYN, DUNNINGTON, NEHALEM, SANDYBRIDGE, HASWELL, SKYLAKEX
   - COOPERLAKE, SAPPHIRERAPIDS, ZEN, ALDERLAKE
   - ATOM, ATHLON, OPTERON, OPTERON_SSE3, BARCELONA
   - BOBCAT, BULLDOZER, PILEDRIVER, STEAMROLLER, EXCAVATOR

   ARM targets:
   - CORTEXA15, CORTEXA9, ARMV7, ARMV6, ARMV8, ARMV8SVE
   - CORTEXA53, CORTEXA57, CORTEXA72, CORTEXA73, NEOVERSEN1
   - CORTEXA510, CORTEXA710, CORTEXX1, CORTEXX2, NEOVERSEN2
   - FALKOR, THUNDERX, THUNDERX2T99, TSV110, EMAG8180

   POWER targets:
   - POWER6, POWER8, POWER9, POWER10

   MIPS targets:
   - P5600, I6400, P6600, I6500

   RISC-V targets:
   - RISCV64_GENERIC, RISCV64_SIFIVE_U74

   Other targets:
   - GENERIC, LOONGSON3A, LOONGSON3B, ZARCH_GENERIC, Z13, Z14

3. Install OpenBLAS:
   ```bash
   sudo make PREFIX=/usr/local install
   sudo ldconfig
   ```

## Notes

- Choose the appropriate TARGET for your CPU architecture.
- OpenMP support is enabled for multi-threading.
- The library is installed in /usr/local/lib and headers in /usr/local/include.
- For best performance, use the most specific target that matches your CPU.
- If unsure, use GENERIC or consult the OpenBLAS documentation for your CPU.
