#!/bin/bash

comm -13 <(ag '\input' . | grep -v sty | rev | cut -d '{' -f 1 | cut -d '}' -f 2 | rev | sed 's/$/.tex/' | sort) <(find sections -name '*.tex' | sort)
