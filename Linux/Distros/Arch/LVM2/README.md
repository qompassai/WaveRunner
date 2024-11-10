# Create mount points
mkdir -p /mnt/{home,var/log,var/pkg,.snapshots}

# Mount subvolumes
```bash
sudo mount /dev/mapper/ArchinstallVg-root /mnt -o subvol=@
sudo mount /dev/mapper/ArchinstallVg-root /mnt/home -o subvol=@home
sudo mount /dev/mapper/ArchinstallVg-root /mnt/var/log -o subvol=@log
sudo mount /dev/mapper/ArchinstallVg-root /mnt/var/cache/pacman/pkg -o subvol=@cache
sudo mount /dev/mapper/ArchinstallVg-root /mnt/.snapshots -o subvol=@snapshots
```

```bash
sudo mount -t vfat UUID=516B-4659 /mnt/boot
```

# Mount essential file systems

```
sudo mount --bind /dev /mnt/dev
sudo mount --bind /proc /mnt/proc
sudo mount --bind /sys /mnt/sys
sudo mount --bind /run /mnt/run

```
