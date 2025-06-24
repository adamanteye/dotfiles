function start-win
    qemu-system-x86_64 \
        -enable-kvm \
        -m 16384 \
        -cpu host \
        -smp cores=6 \
        -machine type=q35,accel=kvm \
        -drive file=/home/adamanteye/Documents/archive/win10.qcow2,format=qcow2 \
        -netdev user,id=net0 -device e1000,netdev=net0 \
        -vga virtio \
        -display gtk \
        -drive if=pflash,format=raw,readonly=on,file=/usr/share/OVMF/x64/OVMF_CODE.4m.fd \
        -drive if=pflash,format=raw,file=/home/adamanteye/Documents/archive/OVMF_VARS.4m.fd \
        -boot d # -cdrom /home/adamanteye/Documents/archive/zh-cn_windows_10_consumer_editions_version_22h2_updated_april_2025_x64_dvd_a39ebe02.iso
end
