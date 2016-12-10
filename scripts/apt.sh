#/bin/sh

packages="texlive texlive-xetex latexmk xzdec"

if [ ! -d ~/.apt ] ; then
	mkdir -p ~/.apt/{archives,lock,partial}
	sudo apt-get update
	apt-get -d -o=dir::cache=~/.apt install $packages
fi

ls ~/.apt