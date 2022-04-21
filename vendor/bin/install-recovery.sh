#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:d1c3de58e8c366452dc010d1460307646ec497eb; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:9d9cd4dca2f2bf9aa608fe03dce1d921ba79bb55 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:d1c3de58e8c366452dc010d1460307646ec497eb && \
      log -t recovery "Installing new oplus recovery image: succeeded" && \
      setprop ro.boot.recovery.updated true || \
      log -t recovery "Installing new oplus recovery image: failed" && \
      setprop ro.boot.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.boot.recovery.updated true
fi
