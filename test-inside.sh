#!/bin/bash
if [ ! -f /.dockerenv ]; then
    >&2 echo Don\'t run this outside a container!
    exit 1
fi
./dotty -b
stat .a.file
