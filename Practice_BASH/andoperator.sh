echo "enter your age"
read -p 'age:' age

if [ "$age" -gt 20 ] && [ "$age" -lt 30 ]
then
echo "valid age"
else 
echo "invalid age"
fi