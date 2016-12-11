#/bin/bash

set -x -e

packages="texlive texlive-xetex latexmk xzdec"

if [ ! -d ~/.apt ] ; then
	mkdir -p ~/.apt
	pushd ~/.apt
	sudo apt-get update
	sudo apt-get install apt-rdepends
	installed=$(dpkg -l)
	deps=$(apt-rdepends $packages | awk '/Depends:/ {print $2}' | sort | uniq) 
	sudo apt-get download --ignore-missing $packages $(comm -23 <(echo $deps) <(echo $installed))
	popd
fi

sudo dpkg --install --recursive ~/.apt