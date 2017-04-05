#!/usr/bin/env bash

cd $SRC/mysql

adduser -S mysql

abuild -F checksum
abuild -F unpack
abuild -F build
abuild -F package

cp -r $SRC/mysql/pkg/mysql/* $ROOTFS/
mkdir -p $ROOTFS/var/lib/mysql-files
mkdir -p $ROOTFS/var/lib/mysql
mkdir -p $ROOTFS/data
mkdir -p $ROOTFS/etc/mysql/conf.d
