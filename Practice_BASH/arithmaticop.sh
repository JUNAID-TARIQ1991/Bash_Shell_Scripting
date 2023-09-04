num1=25
num2=90.90
echo "$num1+$num2" | bc
echo "$num1*$num2" | bc
echo "scale=20;$num2/$num1" | bc #scale=4; set ans upto four decimal places.
echo "$num2%$num1" | bc

echo "scale=10; sqrt($num1)" | bc -l