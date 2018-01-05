#!/bin/bash

###########################################################
#
# Copyright (c) 2017 codeliveroil. All rights reserved.
#
# This work is licensed under the terms of the MIT license.
# For a copy, see <https://opensource.org/licenses/MIT>.
#
###########################################################

makepkg() {
  local os=$1
  local arch=$2
  local alias=$3

  echo "Building for $alias..."

  GOOS=${os} GOARCH=${arch} go build ../
  zip img_${alias}.zip ./img ./install.sh

  rm img
}

echo "Cleaning..."
rm -rf build
mkdir build
cd build

cp ../install.sh .
makepkg darwin 386 macos
makepkg linux 386 linux
rm install.sh

echo "Done."
