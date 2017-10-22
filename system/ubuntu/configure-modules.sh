#!/bin/sh

if [ `id -u` -ne 0 ] ; then
    echo "Must run as root"
    exit 1
fi

cat >>/etc/modules <<EOF
loop
virtio
9p
9pnet
9pnet_virtio
EOF
