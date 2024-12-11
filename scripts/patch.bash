#!/bin/env bash
for file in pyvyxal/*.js; do
    #fix double exports into single exports
    sed -i "s/export { \(\$t.*\), \(\$u.*\) };/export { \1 };\nexport { \2 };/g" "$file"
    #patch single exports into module.exports
    sed -i "s/export { \(.*\) as \(.*\) };/module.exports.\2 = \1;/g" "$file"
    #patch imports into requires
    sed -i "s/import \* as \(.*\) from \(.*\);/var \1=require(\2);/g" "$file"
done
#patch version number to reflect the heresy we just did
sed -i "/prototype\.getVersion/{n;s/\"\(.*\)\"/\"\1-pyvyxal\"/}" pyvyxal/vyxal.js