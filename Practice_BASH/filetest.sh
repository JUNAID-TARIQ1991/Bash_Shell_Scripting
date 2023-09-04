


echo -e "enter the name of the file : \c"
read directory_name
if [ -d $directory_name ]
then
echo " $directory_name  foud"
else 
echo "$directory_name not found"
fi