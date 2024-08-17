# Updating Jetson Kernel

## For Ubuntu
```bash
sudo apt-get install git fakeroot build-essential ncurses-dev xz-utils libssl-dev bc flex libelf-dev bison

cd ~/
mkdir Tegra && cd Tegra
wget https://developer.nvidia.com/downloads/embedded/l4t/r36_release_v3.0/release/jetson_linux_r36.3.0_aarch64.tbz2
wget https://developer.nvidia.com/downloads/embedded/l4t/r36_release_v3.0/release/tegra_linux_sample-root-filesystem_r36.3.0_aarch64.tbz2
tar -xvjf jetson_linux_r36.3.0_aarch64.tbz2
wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.10.5.tar.xz
tar -xvjf tegra_linux_sample-root-filesystem_r36.3.0_aarch64.tbz2 -C ./Linux_for_Tegra/
xz -d linux-6.10.5.tar.xz
tar -xf linux-6.10.5.tar
mv linux-6.10.5 kernel-jammy-src
cd Linux_for_Tegra/source/
./source_sync.sh -k -t jetson_36.3
cd kernel && rm -rf kernel-jammy-src
cd ~/Tegra
mv kernel-jammy-src Linux_for_Tegra/source/kernel/
```bash
    
sudo apt-get install -f -y --no-install-recommends \
    ninja-build \
    libopenblas-dev \
    libopenmpi-dev \
    openmpi-bin \
    openmpi-common \
    libomp-dev \
    autoconf \
    bc \
    build-essential \
    cmake \
    ffmpeg \
    g++ \
    gcc \
    gettext-base \
    git \
    gfortran \
    hdf5-tools \
    iputils-ping \
    libatlas-base-dev \
    libavcodec-dev \
    libavdevice-dev \
    libavfilter-dev \
    libavformat-dev \
    libavutil-dev \
    libblas-dev \
    libbz2-dev \
    libc++-dev \
    libcgal-dev \
    libeigen3-dev \
    libffi-dev \
    libfreeimage-dev \
    libfreetype6-dev \
    libglew-dev \
    libgflags-dev \
    libgoogle-glog-dev \
    libgtk-3-dev \
    libgtk2.0-dev \
    libhdf5-dev \
    libjpeg-dev \
    libjpeg-turbo8-dev \
    libjpeg8-dev \
    liblapack-dev \
    liblzma-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libomp-dev \
    libopenblas-dev \
    libopenexr-dev \
    libopenjp2-7 \
    libopenjp2-7-dev \
    libopenmpi-dev \
    libpng-dev \
    libprotobuf-dev \
    libreadline-dev \
    libsndfile1 \
    libsqlite3-dev \
    libssl-dev \
    libswresample-dev \
    libswscale-dev \
    libtbb-dev \
    libtesseract-dev \
    libtiff-dev \
    libv4l-dev \
    libx264-dev \
    libxine2-dev \
    libxslt1-dev \
    libxvidcore-dev \
    libxml2-dev \
    locales \
    moreutils \
    openssl \
    pkg-config \
    python3-dev \
    python3-numpy \
    python3-pip \
    python3-matplotlib \
    qv4l2 \
    rsync \
    scons \
    v4l-utils \
    zlib1g-dev \
    zip \
    nvidia-l4t-gstreamer \
    ubuntu-restricted-extras \
    libsoup2.4-dev \
    libjson-glib-dev
```
# Build kernel modules
```bash
cd Linux_for_Tegra/source/
make defconfig
scripts/config --file .config --enable RUST
scripts/config --file .config --enable ARM64_PMEM
scripts/config --file .config --enable PCIE_TEGRA194
scripts/config --file .config --enable PCIE_TEGRA194_HOST
scripts/config --file .config --enable TEGRA_HOST1X
scripts/config --file .config --enable TEGRA_HOST1X_FIREWALL
scripts/config --file .config --enable BLK_DEV_NVME
scripts/config --file .config --enable NVME_CORE
scripts/config --file .config --enable NVME_MULTIPATH
scripts/config --file .config --enable FB_SIMPLE
scripts/config --file .config --enable DRM_TEGRA
scripts/config --file .config --enable NAMESPACES
scripts/config --file .config --enable CGROUPS
scripts/config --file .config --enable MEMCG
scripts/config --file .config --enable CPUSETS
scripts/config --file .config --enable OVERLAY_FS
scripts/config --file .config --enable VETH
scripts/config --file .config --enable BRIDGE
scripts/config --file .config --enable NETFILTER
scripts/config --file .config --enable NET_CLS_CGROUP
scripts/config --file .config --enable BLK_CGROUP
scripts/config --file .config --enable CGROUP_PIDS
scripts/config --file .config --enable PREEMPT
scripts/config --file .config --enable HIGH_RES_TIMERS
scripts/config --file .config --enable NO_HZ_FULL
scripts/config --file .config --enable HZ_1000
scripts/config --file .config --enable NUMA
scripts/config --file .config --enable TRANSPARENT_HUGEPAGE
scripts/config --file .config --enable MEMORY_HOTPLUG
scripts/config --file .config --enable TEGRA_GRHOST
scripts/config --file .config --enable TEGRA_GRHOST_NVCSI
scripts/config --file .config --enable TEGRA_GRHOST_NVDLA
scripts/config --file .config --enable CPU_FREQ_DEFAULT_GOV_PERFORMANCE
scripts/config --file .config --enable THERMAL
scripts/config --file .config --enable TEGRA_BPMP_THERMAL
scripts/config --file .config --enable NET_SCH_FQ_CODEL
scripts/config --file .config --enable TCP_CONG_BBR
scripts/config --file .config --enable NET_SCH_HTB
scripts/config --file .config --enable IOSCHED_BFQ
scripts/config --file .config --enable BFQ_GROUP_IOSCHED
scripts/config --file .config --enable NUMA_BALANCING
scripts/config --file .config --enable MEMCG_SWAP
scripts/config --file .config --enable CGROUP_PERF
scripts/config --file .config --enable CGROUP_HUGETLB
scripts/config --file .config --enable RT_GROUP_SCHED

###############################################################
# NVIDIA Tegra specific configurations
#Enable RUST
scripts/config --file .config --enable RUST

#scripts/config --file .config --enable ARM64_PMEM
#scripts/config --file .config --enable PCIE_TEGRA194
#scripts/config --file .config --enable PCIE_TEGRA194_HOST
#scripts/config --file .config --enable TEGRA_HOST1X
#scripts/config --file .config --enable TEGRA_HOST1X_FIREWALL

## NVMe support
#scripts/config --file .config --enable BLK_DEV_NVME
#scripts/config --file .config --enable NVME_CORE
#scripts/config --file .config --enable NVME_MULTIPATH

# Framebuffer and display
#scripts/config --file .config --enable FB_SIMPLE
#scripts/config --file .config --enable DRM_TEGRA

# Container and virtualization support
#scripts/config --file .config --enable NAMESPACES
#scripts/config --file .config --enable CGROUPS
#scripts/config --file .config --enable MEMCG
#scripts/config --file .config --enable CPUSETS
#scripts/config --file .config --enable OVERLAY_FS
#scripts/config --file .config --enable VETH
#scripts/config --file .config --enable BRIDGE
#scripts/config --file .config --enable NETFILTER
#scripts/config --file .config --enable NET_CLS_CGROUP
#scripts/config --file .config --enable BLK_CGROUP
#scripts/config --file .config --enable CGROUP_PIDS

# Performance and latency optimizations
#scripts/config --file .config --enable PREEMPT
#scripts/config --file .config --enable HIGH_RES_TIMERS
#scripts/config --file .config --enable NO_HZ_FULL
#scripts/config --file .config --enable HZ_1000
#scripts/config --file .config --enable NUMA
#scripts/config --file .config --enable TRANSPARENT_HUGEPAGE
#scripts/config --file .config --enable MEMORY_HOTPLUG

# GPU and CUDA support
#scripts/config --file .config --enable TEGRA_GRHOST
#scripts/config --file .config --enable TEGRA_GRHOST_NVCSI
#scripts/config --file .config --enable TEGRA_GRHOST_NVDLA

# Power management and thermal control
#scripts/config --file .config --enable CPU_FREQ_DEFAULT_GOV_PERFORMANCE
#scripts/config --file .config --enable THERMAL
#scripts/config --file .config --enable TEGRA_BPMP_THERMAL

# Network optimizations
#scripts/config --file .config --enable NET_SCH_FQ_CODEL
#scripts/config --file .config --enable TCP_CONG_BBR
#scripts/config --file .config --enable NET_SCH_HTB

# I/O schedulers
#scripts/config --file .config --enable IOSCHED_BFQ
#scripts/config --file .config --enable BFQ_GROUP_IOSCHED

# Additional optimizations
#scripts/config --file .config --enable NUMA_BALANCING
#scripts/config --file .config --enable MEMCG_SWAP
#scripts/config --file .config --enable CGROUP_PERF
#scripts/config --file .config --enable CGROUP_HUGETLB
#scripts/config --file .config --enable RT_GROUP_SCHED
```
