


echo -e "enter the name of the file: \c"
read file_name
if [ -f $file_name ]
then
	if [ -w $file_name ]
	then
		echo "type some text or press ctrl+d to exit."
		cat >> $file_name
	else
		echo "file donot have write permission"
	fi

else
	echo "file not found"
fi

