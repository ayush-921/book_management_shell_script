
check_duplicate() {
	local book_no=$1
	grep -q "^$book_no" books.data
	return $?
}

while true; do
	read -p "Enter the Book No: " book_no
	
	check_duplicate "$book_no"
	if [ $? -eq 0 ]; then
		echo "Book No already Exists. Please enter unique number."
		continue
	fi
	
	#reading and validating book_name
	read -p "Enter the book name: " book_name
	while [ -z "$book_name" ]; do
		echo "Book Name can not be empty"
		echo -e "Enter the book name: \c"
		read book_name
	done
	
	#reading and validating author_name
	read -p "Enter the author: " author
	while [ -z "$author" ]; do
		echo "Author can not be empty"
		echo -e "Enter the author: \c"
		read author
	done
	
	#reading and validating publisher
	read -p "Enter the publisher name: " publisher
	while [ -z "$publisher" ]; do
		echo "Publisher name can not be empty"
		echo -e "Enter the publisher: \c"
		read publisher
	done
	
	#reading and validating price
	read -p "Enter price: " price
	while [ -z "$price" ] || [ $price -eq 0 ]; do
		echo "Price can neither be empty nor be 0"
		echo -e "Enter the price: \c"
		read price
	done

	#reading and validating year
	read -p "Enter the year of release: " year
	while [ -z "$year" ] || [ $year -gt 1996 ]; do
		echo "Year shoud neither be empty nor greater than 1996"
		echo -e "Enter the year: \c"
		read year
	done
	
	#reading and validating subject code
	read -p "Enter the subject code: " sub_code
	while [ "$sub_code" != "UNIX" ] && [ "$sub_code" != "C" ]; do
		echo "Subject code should either be \"UNIX\" or \"C\" "
		echo -e "Enter the subject code: \c" 
		read sub_code
	done
	
	echo "$book_no:$book_name:$author:$publisher:$price:$year:$sub_code" >> books.data
	
	read -p "Do you want to enter another record? (y/n): " choice
	if [ "$choice" != "y" ]; then
		break
	fi
done

echo "Details entered successfully. Thank you!"
echo "Going back to choice menu"
sleep 1
