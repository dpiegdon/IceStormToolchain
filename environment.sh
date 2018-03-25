#!/bin/sh

echo "reminder: always source this script, not simply execute it."
echo "setting up build environment:"

newpath="build/bin"
newfullpath="`dirname $0`/$newpath"
echo "$PATH" | grep "$newpath" > /dev/null || export PATH="$newfullpath:$PATH"
echo "PATH += $newfullpath"
