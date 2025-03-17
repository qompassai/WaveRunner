* X86_64_QEMU_Arch

```
qemu-system-x86_64 \
  -enable-kvm -m 4G -smp 4 -cpu host \
  -kernel /boot/vmlinuz-linux-primo \
  -initrd /boot/initramfs-linux-primo.img \
  -append "rootfstype=btrfs root=/dev/vda1 rootflags=subvol=@,compress=zstd:3,ssd,discard=async,space_cache=v2,commit=120 loglevel=3 quiet nvidia_drm.modeset=1 nvidia_drm.fbdev=1 thunderbolt.dyndbg=+p i915.enable_psr=0 modprobe.blacklist=nouveau zswap.enabled=1 zswap.compressor=zstd zswap.max_pool_percent=20 zswap.zpool=zsmalloc nvidia.NVreg_PreserveVideoMemoryAllocations=1 nvidia.NVreg_UsePageAttributeTable=1 intel_iommu=on iommu=pt i915.enable_dp_mst=1 nvidia.NVreg_EnableResizableBar=1 nvidia.NVreg_DynamicPowerManagement=0x01 nvidia.NVreg_EnableS0ixPowerManagement=0 nvidia.NVreg_EnableMSI=1 nvidia.NVreg_EnableStreamMemOPs=1 pcie_aspm.policy=performance pcie_port_pm=off pcie_aspm_l1_2=3 nvme_core.default_ps_max_latency_us=0 processor.max_cstate=0 nowatchdog mitigations=off preempt=full threadirqs init_on_alloc=0 init_on_free=0 page_alloc.shuffle=1 split_lock_detect=off transparent_hugepage=always nvidia.NVreg_RegistryDwords=\"PowerMizerEnable=0x1;PerfLevelSrc=0x2222;PreferredMode=0x1;EnableBrightnessControl=1\" nvidia.NVreg_OpenRmEnableUnsupportedGpus=1 clocksource=tsc tsc=reliable nvidia.NVreg_InitialPerformanceState=0x1 workqueue.power_efficient=0 nvme.noacpi=1 default_hugepagesz=2M hugepagesz=2M numa_balancing=disable cpufreq.default_governor=performance intel_pstate=active pcie_ports_native=1 drm.syncobj_period=2000000 drm.nvidia.synchronize_irqs=1 i915.enable_guc=2 i915.enable_dc=0 i915.enable_fbc=1 nvidia.NVreg_EnableGpuFirmware=1 acpi_osi=Linux acpi_backlight=vendor console=ttyS0" \
  -drive file=arch-test.qcow2,format=qcow2 \
  -vga virtio \
  -display gtk,gl=on
```


