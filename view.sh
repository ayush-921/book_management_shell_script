while true; do
	echo "Search Option"
	echo "1) Show All Records"
	echo "2) Search by Book Number"
	echo "3) Search by Subject Code"
	echo "4) Search by Author"
	echo "5) Search by Book Name"
	echo "6) Exit"
	
	read -p "Enter a choice " choice
	
	case $choice in
		1)
			echo "--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
			awk -F ":" '{ printf "%-35s%-35s%-25s%-25s%-25s%-25s%-25s\n", $1, $2, $3, $4, $5, $6, $7}' formatter.txt
			echo "--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------" 
			awk -F ":" '{ printf "%-35s%-35s%-25s%-25s%-25d%-25d%-25s\n", $1, $2, $3, $4, $5, $6, $7}' books.data 
			;;
		6)
			echo "Going back to Main Menu"
			exit 0
			;;
		*) 
			echo "Enter a valid choice"
			;;
	esac

	echo "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
	
	read -p "\nDo you want to search for another book? (y/n) " isYes
	if [ "$isYes" != "y" ]; then
		break
	fi

done

echo "Search Compelete. Thank You"
echo "Going back to Choice Menu"

sleep 1
