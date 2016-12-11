#/bin/bash

set -x -e

packages="texlive texlive-xetex latexmk xzdec"

if [ ! -d ~/.apt ] ; then
	mkdir -p ~/.apt
	pushd ~/.apt
	sudo apt-get update
	deps=$(apt-cache depends -i PACKAGE | awk '/Depends:/ {print $2}' | xargs echo) 
	sudo apt-get download $packages $deps
	popd
fi

sudo dpkg --install --recursive ~/.apt