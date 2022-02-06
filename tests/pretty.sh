#!/bin/bash
# taken from https://raw.githubusercontent.com/dusty-phillips/rescript-dexie/main/tests/pretty.sh

parent_path=$(dirname $(dirname $(realpath $0)))
pta=$parent_path/node_modules/.bin/pta
tapdiff=$parent_path/node_modules/.bin/tap-diff2

$pta tests/*.test.mjs | $tapdiff
