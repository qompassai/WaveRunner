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

# LLVM
mkdir -p llvm/build-debug
cd llvm/build-debug
cmake .. \
  -DCMAKE_INSTALL_PREFIX=$HOME/local/llvm18-debug \
  -DCMAKE_PREFIX_PATH=$HOME/local/llvm18-debug \
  -DCMAKE_BUILD_TYPE=Debug \
  -DLLVM_ENABLE_LIBXML2=OFF \
  -DLLVM_ENABLE_TERMINFO=OFF \
  -DLLVM_ENABLE_LIBEDIT=OFF \
  -DLLVM_PARALLEL_LINK_JOBS=1 \
  -G Ninja \
  $MACOS_ARGS
ninja install
cd ../..

# LLD
mkdir -p lld/build-debug
cd lld/build-debug
cmake .. \
  -DCMAKE_INSTALL_PREFIX=$HOME/local/llvm18-debug \
  -DCMAKE_PREFIX_PATH=$HOME/local/llvm18-debug \
  -DCMAKE_BUILD_TYPE=Release \
  -DLLVM_PARALLEL_LINK_JOBS=1 \
  -DCMAKE_CXX_STANDARD=17 \
  -G Ninja \
  $MACOS_ARGS
ninja install
cd ../..

# Clang
mkdir -p clang/build-debug
cd clang/build-debug
cmake .. \
  -DCMAKE_INSTALL_PREFIX=$HOME/local/llvm18-debug \
  -DCMAKE_PREFIX_PATH=$HOME/local/llvm18-debug \
  -DCMAKE_BUILD_TYPE=Release \
  -DLLVM_PARALLEL_LINK_JOBS=1 \
  -DLLVM_INCLUDE_TESTS=OFF \
  -G Ninja \
  $MACOS_ARGS
ninja install
cd ../..

