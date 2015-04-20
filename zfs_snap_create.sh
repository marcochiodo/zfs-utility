#!/usr/bin/sh

date_time="`date "+%d-%b-%y---%H:%M:%S"`"

zfs snap -r "$1-$date_time"

