#!/bin/sh

./parted <<EOF
mklabel gpt
mkpart primary ext3 65536s 8323071s
mkpart primary linux-swap 8323072s 9371647s
mkpart primary ext4 9371648s -1s
quit
EOF
# Restore special MBR of PLX
dd if=mbr.bin of=/dev/sda count=446 bs=1