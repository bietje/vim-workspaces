#!/bin/bash

#
# (c) Michel Megens 2014
#

source /etc/vimconfig.cnf

VIMFILES=""
#
# $1 == directory
# $1 == extension
#
find_dir_x_files()
{
	find $1 -name "$2"
}

# $1 = directory
find_dir_c_files()
{
	files=`find_dir_x_files $1 '*.c'`
	echo $files
}

find_dir_h_files()
{
	files=`find_dir_x_files $1 '*.h'`
	echo $files
}

find_dir_S_files()
{
	files=`find_dir_x_files $1 '*.S'`
	echo $files
}

CFILES_DIR=""
HFILES_DIR=""
AS_FILES_DIR=""
main()                                                                          
{
	while getopts "h?vtH:S:c:p:" opt; do
		case "$opt" in
			h|\?)
				show_help
				exit 0
				;;
			v)
				verbose=1
				;;
			c)
				CFILES_DIR=$OPTARG
				;;
			t)
				vim_tabs='-p'
				;;
			H)
				HFILES_DIR=$OPTARG
				;;
			S)
				AS_FILES_DIR=$OPTARG
				;;
			p)
				/bin/bash $VIMPROJECT $OPTARG
				exit 0
				;;
		esac                                                            
	done                                                                    
}

show_help()                                                                     
{                                                                               
        echo Usage: $0 \[options\]
}

main "$@"

if test -n "$CFILES_DIR"; then
	VIMFILES=`find_dir_c_files $CFILES_DIR`
fi
if test -n "$HFILES_DIR"; then
	VIMFILES="$VIMFILES `find_dir_h_files $HFILES_DIR`"
fi
if test -n "$AS_FILES_DIR"; then
	VIMFILES="$VIMFILES `find_dir_S_files $AS_FILES_DIR`"
fi

/bin/sh $VIMOPEN $VIMFILES

