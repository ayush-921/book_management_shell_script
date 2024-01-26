ifExist(){
	#checks wether given book number exist
	local book_no=$1
	grep -q "^$book_no:" books.data
	return $?
}

while true; do
	read -p "Enter the Book Number to delete: " book_no
	ifExist "$book_no"
	if [ $? -eq 0 ]; then
		echo "Book Number Exist"
		echo "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
		awk -F ":" '{ printf "%-35s%-35s%-25s%-25s%-25s%-25s%-12s|\n", $1, $2, $3, $4, $5, $6, $7}' formatter.txt
		echo "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------" 
		awk -F ":" -v book_num="$book_no" '$1 ~ book_num { printf "%-35s%-35s%-25s%-25s%-25d%-25d%-15s|\n", $1, $2, $3, $4, $5, $6, $7}' books.data 	
		echo "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
		echo 
		read -p "Do you want to delete the book (y/n): " choice
		
		if [ "$choice" == "y" ]; then
			sed -i "/^$book_no:/d" books.data
			echo "Book Deleted Successfully"
		fi
	else
		echo "The Book Number does not exist"
	fi
	
	read -p "Do you want to delete another book (y/n): " input
	if [ "$input" != "y" ]; then
		break;
	fi
done

echo "Deletion Successful"
echo "Going back to main menu"
