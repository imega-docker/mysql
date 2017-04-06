#!/usr/bin/env bash

cd $SRC/mysql

adduser -S mysql

abuild -F checksum
abuild -F unpack
abuild -F build
abuild -F package

mkdir -p $ROOTFS/usr/bin
cp -r $SRC/mysql/pkg/mysql/usr/bin/* $ROOTFS/usr/bin/
mkdir -p $ROOTFS/usr/sbin
cp -r $SRC/mysql/pkg/mysql/usr/sbin/* $ROOTFS/usr/sbin/
mkdir -p $ROOTFS/usr/lib/mysql
cp -r $SRC/mysql/pkg/mysql/usr/lib/mysql/* $ROOTFS/usr/lib/mysql/
mkdir -p $ROOTFS/usr/share/mysql/
cp -r $SRC/mysql/pkg/mysql/usr/share/mysql/* $ROOTFS/usr/share/mysql/
cp -r $SRC/mysql/pkg/mysql/var/* $ROOTFS/usr/var/
mkdir -p $ROOTFS/var/lib/mysql-files
mkdir -p $ROOTFS/var/lib/mysql
mkdir -p $ROOTFS/data
mkdir -p $ROOTFS/etc/mysql/conf.d
cp $SRC/my.cnf $ROOTFS/etc/mysql/
