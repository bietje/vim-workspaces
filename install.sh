#!/bin/bash

#
# (c) Michel Megens
#

FILE=/usr/bin/vimws
CONFIG=/etc/vimconfig.cnf

if [ -f $FILE ]; then
	rm -v $FILE
fi
ln -s `pwd`/vimws.sh $FILE
sed 's?#PATH-TOKEN#?'`pwd`'?' vimconfig.cnf > $CONFIG
