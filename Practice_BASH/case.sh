echo "enter the name of vehicle"

read vehicle 
case $vehicle in
	"car" )
		echo "not availble" ;;
	"van" )
		echo "on rent 200$" ;;
	"bus" )
		echo "on rent 250$" ;;
	* )
		echo "unknown input" ;;
esac

	
		
