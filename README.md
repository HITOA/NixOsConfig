qemu is required to run the VM

first run of startvm.sh use the -i argument

# Installation "step"

- Setup partition with fdisk (EFI, SWAP, System partition, other..) and set type of boot partition to EFI (in fdisk, i and partition number)
- mkfs.fat -F 32 for the boot partition (EFI)
- fatlabel to name the boot partition
- mkswap for the swap partition
- mkfs.ext4 for all other partition
- -L LabelName at the end of command with mkfs and mkswap to name a partition
- mount system partition to /mnt
- mkdir -p /mnt/boot
- mount boot partition to /mnt/boot
- swapon swap partition
- nix shell nixpkgs#git to get git
- git clone repos . in /etc/nixos directory
- run tools/generate-hardware-config.sh from repos root
- git add the generated hardware-configuration
- install with flake (nixos-install --flake /mnt/etc/nixos#Profile)