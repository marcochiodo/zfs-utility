#!/usr/bin/sh

keep=$(($2 + 1))

zfs list -t snapshot -S creation -o name | grep "$1" | tail -n +$keep | while read snapname
 do
  zfs destroy $snapname
 done
