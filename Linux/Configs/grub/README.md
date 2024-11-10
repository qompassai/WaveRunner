# How to build GRUB

On UEFI systems, specify the --efi-directory as /boot (assuming you mounted the boot partition to /boot):

* x86_64

```sh
sudo grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
sudo grub-mkconfig -o /boot/grub/grub.cfg
