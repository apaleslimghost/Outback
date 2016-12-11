#/bin/bash

set -x -e

packages="texlive-base texlive-latex-base texlive-binaries tipa tex-common texlive-fonts-recommended texlive-latex-recommended texlive texlive-xetex latexmk xzdec"

if [ ! -d ~/.apt ] ; then
	mkdir -p ~/.apt
	pushd ~/.apt
	sudo apt-get update
	sudo apt-get download $packages
	popd
fi

sudo dpkg --install --recursive ~/.apt