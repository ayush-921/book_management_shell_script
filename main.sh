while true;
do
    echo "Menu:"
    echo "1. Add"
    echo "2. Modify"
    echo "3. Delete"
    echo "4. View"
    echo "5. Exit"

	read -p "Enter your choice: " choice

    case $choice in
        1)
            ./add.sh
            ;;
        2)
			./modify.sh
            ;;
        3)
            ./delete.sh
            ;;
        4)
            ./view.sh
            ;;
        5)
            echo "Exiting the Program."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter a number between 1 and 5
            ;;
    esac
done
