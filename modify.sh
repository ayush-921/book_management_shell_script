isExist(){
	local book_no=$1
	grep -q "^$book_no:" books.data
	return $?
}

while true; do
	read -p "Enter the book number to modify: " book_no
	
	isExist "$book_no"
	if [ $? -eq 1 ]; then
		echo "Book code does not exist. Enter a valid book code"
		continue
	fi
	
	echo "Current Book Details"
	echo "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
	awk -F ":" '{ printf "%-35s%-35s%-25s%-25s%-25s%-25s%-12s|\n", $1, $2, $3, $4, $5, $6, $7}' formatter.txt
	echo "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------" 
	awk -F ":" -v book_num="$book_no" '$1 ~ book_num { printf "%-35s%-35s%-25s%-25s%-25d%-25d%-15s|\n", $1, $2, $3, $4, $5, $6, $7}' books.data 	
	echo "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
	echo
	
	#modify book name
	read -p "Enter the new book name: " book_name
	if [ -n "$book_name" ]; then
		old_book_name=$(awk -F ":" -v book_num="$book_no" '$1 ~ book_num {print $2}' books.data)
		#echo "Old book name = $old_book_name"
		#echo "New book name = $book_name"
		sed -i "s/$old_book_name/$book_name/" books.data
	else
		echo "No Change in Book Name since input was empty"
	fi
	
	#modify author name
	read -p "Enter the new author name: " author
	if [ -n "$author" ]; then
		old_author=$( awk -F ":" -v book_num="$book_no" '$1 ~ book_num {print $3}' books.data)
		sed -i "s/$old_author/$author/" books.data
	else
		echo "No Change in author name since input was empty"
	fi	
	
	#modify publisher
	read -p "Enter the new publisher name: " publisher
	if [ -n "$publisher" ]; then
		old_publisher=$( awk -F ":" -v book_num="$book_no" '$1 ~ book_num {print $4}' books.data)
		sed -i "s/$old_publisher/$publisher/" books.data
	else
		echo "No Change in publisher name since input was empty"
	fi

	
	read -p "Enter the new price: " price
	if [ -n "$price" ] && [ $price != 0 ]; then
		old_price=$( awk -F ":" -v book_num="$book_no" '$1 ~ book_num {print $5}' books.data)
		sed -i "s/$old_price/$price/" books.data
	else
		echo "No Change in price. Either input was empty or 0"
	fi

	
	read -p "Enter the new publish year: " year
	if [ -n "$year" ] && [ $price -le 1996 ]; then
		old_year=$( awk -F ":" -v book_num="$book_no" '$1 ~ book_num {print $6}' books.data)
		sed -i "s/$old_year/$year/" books.data
	else
		echo "No Change in year. Either empty or greater than 1996"
	fi
	
	
	read -p "Enter the new subject code (UNIX/C) : " sub_code
	if [ "$sub_code" == "UNIX" ] || [ "$sub_code" == "C" ]; then
		old_sub_code=$( awk -F ":" -v book_num="$book_no" '$1 ~ book_num {print $7}' books.data)
		sed -i "s/$old_sub_code/$sub_code/" books.data
	else
		echo "No Change in Subject code. Either it was empty or was not among UNIX or C"
	fi
	
	echo "Modified Entry: "
	echo "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
	awk -F ":" '{ printf "%-35s%-35s%-25s%-25s%-25s%-25s%-12s|\n", $1, $2, $3, $4, $5, $6, $7}' formatter.txt
	echo "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------" 
	awk -F ":" -v book_num="$book_no" '$1 ~ book_num { printf "%-35s%-35s%-25s%-25s%-25d%-25d%-15s|\n", $1, $2, $3, $4, $5, $6, $7}' books.data 	
	echo "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
		
	read -p "Do you want to modify another book (y/n): " input
	if [ "$input" != "y" ]; then
		break;
	fi 

done

echo "Going back to main menu:"
