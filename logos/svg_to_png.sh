#!/usr/bin/env bash
set -Eeuo pipefail
set -x

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

for svg in "$SCRIPT_DIR/svg/"*.svg; do
    png="$SCRIPT_DIR/png/$(basename ${svg%.svg}).png"
    inkscape -w 1000 -h 1000 "$svg" -o "$png"
    optipng "$png"
done
