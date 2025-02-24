function start-ewe-rv64
    qemu-system-riscv64 \
        -smp 8 -m 4G \
        -machine virt \
        -drive file=/home/adamanteye/Documents/archive/ewe-rv64.qcow2,format=qcow2,if=virtio \
        -bios /usr/share/qemu/opensbi-riscv64-generic-fw_dynamic.bin \
        -cdrom /home/adamanteye/Documents/archive/eweos-riscv64-liveimage-standard.iso \
        -device virtio-net-device,netdev=ewe -netdev user,id=ewe \
        # -device virtio-gpu \
        # -display sdl,gl=on \
        -device virtio-mouse \
        -device virtio-keyboard \
        -audiodev alsa,id=eweaudio \
        -device virtio-serial-device \
        -chardev pty,id=virtserial0 \
        -serial mon:stdio \
        -d guest_errors,unimp
end
