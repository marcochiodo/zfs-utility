#!/usr/bin/sh


last_remote=$(ssh "$2" zfs list -t snapshot -S creation -o name | grep "$1" | head -1)
 

 
last_local=$(zfs list -t snapshot -S creation -o name | grep "$1" | head -1)


ssh "$2" zfs list -t snapshot -S creation -o name | grep "$1" | while read tmp
 do
 
  first_local=$tmp

  if [ "$first_local" = "$last_remote" ]; then
   zfs send -I "$first_local" "$last_local" | ssh "$2" zfs recv -F -d "$1"
   break
  fi

 done
 
