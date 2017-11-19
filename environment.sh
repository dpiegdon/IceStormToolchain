#!/bin/sh

echo "reminder: always source this script, not simply execute it."
echo "setting up build environment..."
newpath="build/bin"
newfullpath="`pwd`/$newpath"
echo "$PATH" | grep "$newpath" > /dev/null || export PATH="$newfullpath:$PATH"
