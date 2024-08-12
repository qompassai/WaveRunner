#!/bin/bash

# Set error handling
set -e

# Detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    IS_MACOS=true
else
    IS_MACOS=false
fi

# Common macOS arguments
MACOS_ARGS=""
if $IS_MACOS; then
    MACOS_ARGS="-DCMAKE_OSX_ARCHITECTURES=x86_64;arm64 -DCMAKE_OSX_DEPLOYMENT_TARGET=10.15"
fi

# Get the current directory
CURRENT_DIR=$(pwd)

# Common arguments for all builds
COMMON_ARGS=(
    -DCMAKE_INSTALL_PREFIX=$CURRENT_DIR/install
    -DCMAKE_PREFIX_PATH=$CURRENT_DIR/install
    -DCMAKE_BUILD_TYPE=Release
    -DLLVM_ENABLE_PROJECTS="clang;lld;mlir;polly;bolt;clang-tools-extra;lldb;openmp;pstl;flang"
    -DLLVM_ENABLE_RUNTIMES="compiler-rt;libcxx;libcxxabi;libunwind"
    -DLLVM_TARGETS_TO_BUILD="X86;AArch64;NVPTX;ARM;AMDGPU;PowerPC"
    -DLLVM_ENABLE_ASSERTIONS=ON
    -DLLVM_ENABLE_DOXYGEN=OFF
    -DLLVM_BUILD_DOCS=OFF
    -DLLVM_ENABLE_SPHINX=OFF
    -DLLVM_ENABLE_LIBXML2=ON
    -DLLVM_ENABLE_TERMINFO=ON
    -DLLVM_ENABLE_LIBEDIT=ON
    -DLLVM_PARALLEL_LINK_JOBS=1
    -DLLVM_ENABLE_ZLIB=ON
    -DLLVM_ENABLE_THREADS=ON
    -DLLVM_ENABLE_LTO=ON
    -DLLVM_ENABLE_RTTI=OFF
    -DLLVM_ENABLE_EH=OFF
    -DLLVM_USE_INTEL_JITEVENTS=ON
    -DLLVM_INCLUDE_TESTS=OFF
    -DLLVM_INCLUDE_EXAMPLES=OFF
    -DLLVM_ENABLE_Z3_SOLVER=ON
    -DCMAKE_CXX_STANDARD=17
    -G Ninja
    $MACOS_ARGS
)

# Create build directory in the current directory
mkdir -p build
cd build

# Configure LLVM, Clang, and LLD build
cmake ../llvm "${COMMON_ARGS[@]}"

# Build and install LLVM, Clang, and LLD
ninja install

# Return to the original directory
cd ..

echo "LLVM, Clang, and LLD build complete. Installed to $CURRENT_DIR/install"

