#!/bin/bash

# $1 = project file

source /etc/vimconfig.cnf

FILES=""

while read -r line
do
	name=$line
	FILES="$FILES $name"
done < $1

/bin/bash $VIMOPEN $FILES
