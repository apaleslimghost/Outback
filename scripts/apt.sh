#/bin/sh

packages="texlive texlive-xetex latexmk xzdec"

if [ ! -d ~/.apt ] ; then
	mkdir -p ~/.apt
	pushd ~/.apt
	sudo apt-get update
	sudo apt-get download $packages
	popd
fi

sudo dpkg --install --recursive ~/.apt