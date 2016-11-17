#!/bin/bash

set -e

function do_test()
{
    echo "CCFLAGS: $CCFLAGS"
    gcc $CCFLAGS -c a.c
    gcc $CCFLAGS -c b.c
    ld -no-warn-mismatch --nmagic -o join.elf -T join.x a.o b.o
    readelf -x .rodata join.elf
    objdump -Mintel -d join.elf
}

echo "--------------------------------------------------------------------------------"
CCFLAGS="-Wall -Werror -Os -fno-merge-constants -m32"
do_test


echo "--------------------------------------------------------------------------------"
CCFLAGS="-Wall -Werror -Os -m32"
do_test
