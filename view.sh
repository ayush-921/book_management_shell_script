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
			echo "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
			awk -F ":" '{ printf "%-35s%-35s%-25s%-25s%-25s%-25s%-12s|\n", $1, $2, $3, $4, $5, $6, $7}' formatter.txt
			echo "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------" 
			awk -F ":" '{ printf "%-35s%-35s%-25s%-25s%-25d%-25d%-15s|\n", $1, $2, $3, $4, $5, $6, $7}' books.data 
			;;
		2)
			read -p "Enter Book Number: " book_no
			while [ -z "$book_no" ]; do
				echo "Book Number can't be empty"
				echo -e "Enter the Book Number: \c"
				read book_no
			done
			echo "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
			awk -F ":" '{ printf "%-35s%-35s%-25s%-25s%-25s%-25s%-12s|\n", $1, $2, $3, $4, $5, $6, $7}' formatter.txt
			echo "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------" 
			awk -F ":" -v book_num="$book_no" '$1 ~ book_num { printf "%-35s%-35s%-25s%-25s%-25d%-25d%-15s|\n", $1, $2, $3, $4, $5, $6, $7}' books.data 
			;;
		3)
			read -p "Enter the Subject Code (\"UNIX\" or \"C\") : " sub_code
			while [ "$sub_code" != "UNIX" ] && [ "$sub_code" != "C" ]; do
				echo -e "Enter Valid Code UNIX or C: \c"
				read sub_code
 			done
			echo "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
			awk -F ":" '{ printf "%-35s%-35s%-25s%-25s%-25s%-25s%-12s|\n", $1, $2, $3, $4, $5, $6, $7}' formatter.txt
			echo "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------" 
			awk -F ":" -v sub_code="$sub_code" '$7 ~ sub_code { printf "%-35s%-35s%-25s%-25s%-25d%-25d%-15s|\n", $1, $2, $3, $4, $5, $6, $7}' books.data 
			;;
			
		6)
			echo "Going back to Main Menu"
			exit 0
			;;
		*) 
			echo "Enter a valid choice"
			;;
	esac

	echo "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
	echo
	read -p "Do you want to search for another book? (y/n) " isYes
	if [ "$isYes" != "y" ]; then
		break
	fi

done

echo "Search Compelete. Thank You"
echo "Going back to Choice Menu"

sleep 1
