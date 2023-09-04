select DRINK in tea coffee juice water apple none
do
	case $DRINK in
		tea|coffee|water)
			echo "go to canteen"
			;;
		none)
			break
			;;
		*)
			echo "invalid selection"
			;;
	esac
done

