#!/bin/bash

# Set error handling
set -e

# Detect number of CPU cores for parallel build
CORES=$(nproc)

# Common CMake arguments
CMAKE_COMMON_ARGS=(
    -DCMAKE_INSTALL_PREFIX=$HOME/local/llvm-zig
    -DCMAKE_BUILD_TYPE=Release
    -DLLVM_ENABLE_PROJECTS="clang;lld;compiler-rt"
    -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi;libunwind"
    -DLLVM_TARGETS_TO_BUILD="X86;AArch64;ARM;WebAssembly"
    -DLLVM_ENABLE_ASSERTIONS=ON
    -DLLVM_OPTIMIZED_TABLEGEN=ON
    -DLLVM_ENABLE_ZLIB=ON
    -DLLVM_ENABLE_TERMINFO=OFF
    -DLLVM_ENABLE_LIBEDIT=OFF
    -DLLVM_PARALLEL_LINK_JOBS=1
    -DLLVM_INCLUDE_EXAMPLES=OFF
    -DLLVM_INCLUDE_TESTS=OFF
    -DLLVM_INCLUDE_BENCHMARKS=OFF
    -DLLVM_BUILD_TOOLS=ON
    -DLLVM_ENABLE_LIBXML2=OFF
    -DLLVM_ENABLE_LTO=ON
    -DCLANG_ENABLE_BOOTSTRAP=ON
    -DLLVM_BUILD_LLVM_DYLIB=ON
    -DLLVM_LINK_LLVM_DYLIB=ON
    -DLLVM_INSTALL_UTILS=ON
    -DLLVM_ENABLE_Z3_SOLVER=OFF
    -DLLVM_ENABLE_LIBCXX=ON
    -DCLANG_DEFAULT_CXX_STDLIB=libc++
    -DCLANG_DEFAULT_RTLIB=compiler-rt
    -DLLVM_ENABLE_RTTI=ON
    -DLLVM_ENABLE_EH=ON
    -DLLVM_ENABLE_THREADS=ON
    -DLLVM_ENABLE_PIC=ON
    -G Ninja
)

# Create build directory
mkdir -p llvm-project/build
cd llvm-project/build

# Configure LLVM, Clang, and LLD build
cmake ../llvm "${CMAKE_COMMON_ARGS[@]}"

# Build LLVM, Clang, and LLD
ninja -j$CORES

# Install LLVM, Clang, and LLD
ninja install

cd ../..

echo "LLVM, Clang, and LLD build complete. Installed to $HOME/local/llvm-zig"

# Create symbolic links for easier access
ln -sf $HOME/local/llvm-zig/bin/clang $HOME/local/llvm-zig/bin/clang-cl
ln -sf $HOME/local/llvm-zig/bin/lld $HOME/local/llvm-zig/bin/ld.lld
ln -sf $HOME/local/llvm-zig/bin/lld $HOME/local/llvm-zig/bin/lld-link
ln -sf $HOME/local/llvm-zig/bin/lld $HOME/local/llvm-zig/bin/wasm-ld

echo "Symbolic links created for clang-cl, ld.lld, lld-link, and wasm-ld"

