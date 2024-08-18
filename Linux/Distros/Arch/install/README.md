# Installing Arch Linux ISO on USB

This guide explains how to write the Arch Linux ISO to a USB drive using the `dd` command on Linux.

## Prerequisites

- Arch Linux ISO downloaded: https://archlinux.org/download/
- A USB drive (at least 8GB)
- Root or sudo access on your Linux machine

## Steps

- 1. Insert your USB drive into your computer.

- 2. Open a terminal.

- 3. Identify your USB drive using the following command:

```bash
lsblk -o NAME,SIZE,TYPE,MOUNTPOINT
```
- Look for a device that matches your USB drive's size. It will typically be named something like `sdb` or `sdc`.

- 4. If your USB drive is mounted, unmount it:
```bash
sudo umount /dev/sdX
```
- Replace `sdX` with your USB drive identifier (e.g., `sdb`).

5. Use the following `dd` command to write the ISO to your USB drive:
```bash
sudo dd bs=4M if=/path/to/archlinux.iso of=/dev/sdX status=progress && sync
```

Replace `/path/to/archlinux.iso` with the actual path to your ISO file, and `sdX` with your USB drive identifier.

- 6. Wait for the process to complete. This may take several minutes.

- 7. Once finished, your USB drive will be ready to boot Arch Linux.

## Command Breakdown

- `sudo`: Run the command with root privileges
- `dd`: The command used to copy and convert files
- `bs=4M`: Set the block size to 4 megabytes for faster copying
- `if=/path/to/archlinux.iso`: Input file (your Arch Linux ISO)
- `of=/dev/sdX`: Output file (your USB drive)
- `status=progress`: Show the progress of the operation
- `&& sync`: Ensure all data is written to the USB drive before finishing

## Warning

Be extremely careful to select the correct device as the output file (`of=`). Writing to the wrong device can result in data loss. Double-check your USB drive identifier before running the command.

## Example

- For a system where the Arch Linux ISO is in the Downloads folder and the USB drive is identified as `sda`:
```bash
sudo dd bs=4M if=/home/username/Downloads/archlinux-2024.08.01-x86_64.iso of=/dev/sda status=progress && sync
```

- Replace `username` with your actual username.

