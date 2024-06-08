if [ ! -e "data" ]
then
    mkdir data
fi

if [ ! -e "data/nixos.iso" ] 
then
    curl -Lo data/nixos.iso https://channels.nixos.org/nixos-24.05/latest-nixos-minimal-x86_64-linux.iso
fi

if [ ! -e "data/nixos.qcow2" ]
then
    qemu-img create -f qcow2 data/nixos.qcow2 16G
fi

qemu-system-x86_64 \
    -drive if=pflash,format=raw,readonly=on,file=/usr/share/edk2/x64/OVMF_CODE.4m.fd \
    -drive if=pflash,format=raw,file=OVMF_VARS.4m.fd \
    -enable-kvm \
    -m 2048 \
    -nic user,model=virtio \
    -vga virtio \
    -display gtk,gl=on \
    -hda data/nixos.qcow2 \
    -cdrom data/nixos.iso \
    -boot menu=on