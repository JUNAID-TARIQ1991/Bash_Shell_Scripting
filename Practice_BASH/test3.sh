if [ -f $inputname2='w+'] 
then
echo 'creating' $currentdir/$inputname2
mkdir -p $inputname2

p -RT $currentdir/$WOrigional/ $currentdir/$inputname2
elif [ -f $inputname2='w-'] 
then
    echo 'creating ' $currentdir/$inputname2
    mkdir -p $inputname2
cp -RT $currentdir/$WOrigional/ $currentdir/$inputname2

else
echo 'invalid input' 

fi