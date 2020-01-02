#!/bin/bash
cd /dev/disk/by-label
for label in *
do
    partition=$(basename $(readlink $label))
    sudo mkdir /media/$USER/$label
    sudo mount /dev/$partition /media/$USER/$label
done
exit
