#!/bin/env bash

echo "fetch vyxal 3"
git clone -b version-3 https://github.com/Vyxal/Vyxal.git || exit 1


echo "Build vyxal3 js"
# shellcheck disable=SC2164
pushd Vyxal
./mill js.fullLinkJS

# shellcheck disable=SC2164
popd

echo "Patch imports"

mv Vyxal/pages/vyxal.js pyvyxal/
mv Vyxal/pages/internal*.js pyvyxal/
mv Vyxal/pages/*.txt pyvyxal/

./scripts/patch.bash


