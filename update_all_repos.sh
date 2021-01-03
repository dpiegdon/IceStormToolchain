#!/bin/sh

for R in $(git submodule status | awk '{print $2}'); do
	echo "updating submodule: $R"
	cd "$R"
	git checkout master
	git pull --rebase
	git submodule update
	cd ..
done
