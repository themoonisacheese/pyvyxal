#!/bin/env bash

echo "Fetch vyxal 3"


if [ -d "Vyxal" ]; then
    # shellcheck disable=SC2164
    pushd Vyxal
    git fetch --all || popd && exit 1
    git reset --hard origin/version-3
    # shellcheck disable=SC2164
    popd
else
    git clone -b version-3 https://github.com/Vyxal/Vyxal.git || exit 1
fi


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


