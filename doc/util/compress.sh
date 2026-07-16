#!/bin/bash
cd "$(dirname "$0")"

mogrify -quality 75 -format jpg -path ../img/compressed ../img/*.png