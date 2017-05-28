#!/bin/bash

sed -i "s/-C -c \/tmp\/no-ip2.conf/-U 1 -d -u "$NOIP_USER" -p \"$(echo $NOIP_PASSWORD | sed -e 's/\\/\\\\/g; s/\//\\\//g; s/&/\\\&/g')\" -C -c \/tmp\/no-ip2.conf/g" Makefile

make install

noip2 -d -F

while true; do
    wait
done
