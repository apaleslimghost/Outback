#/bin/bash

set -x -e

packages="texlive texlive-xetex latexmk xzdec"

if [ ! -d ~/.apt ] ; then
	mkdir -p ~/.apt
	pushd ~/.apt
	sudo apt-get update
	sudo apt-get install apt-rdepends
	deps=$(apt-rdepends $packages | awk '/Depends:/ {print $2}' | xargs echo) 
	sudo apt-get download --ignore-missing $packages $deps
	popd
fi

sudo dpkg --install --recursive ~/.apt