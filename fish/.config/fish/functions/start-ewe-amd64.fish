function start-ewe-amd64
    qemu-system-x86_64 \
        -smp 8 -m 16G -cpu host \
        -machine type=q35,accel=kvm \
        -drive file=/home/adamanteye/Documents/archive/ewe-amd64.qcow2,format=qcow2,if=virtio \
        -cdrom /home/adamanteye/Documents/archive/eweos-x86_64-liveimage-standard.iso \
        -device virtio-net,netdev=ewe -netdev user,id=ewe \
        -drive if=pflash,format=raw,readonly=on,file=/usr/share/OVMF/x64/OVMF_CODE.4m.fd \
        -device virtio-vga -display gtk \
        -device virtio-sound-pci,audiodev=eweaudio -audiodev alsa,id=eweaudio \
        -device qemu-xhci,id=xhci \
        -device usb-tablet,bus=xhci.0 \
        -device usb-kbd,bus=xhci.0
end
