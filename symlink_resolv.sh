#!/bin/sh

# go through each file
find * -type f -print0 | while read -d $'\0' file; do
	# echo $file
	# if is ASCII file - try to copy file from content into itself
	if file $file | grep -q 'ASCII'; then
		# not safe...
		echo cp `dirname $file`/`cat $file` $file
		cp `dirname $file`/`cat $file` $file
	fi
done
