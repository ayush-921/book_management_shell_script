# Book Management System

This repository contains shell scripts for managing a library system. The scripts provide various functionalities, 
including adding books, modifying book details, searching by different criteria, and deleting books by book number.


## Functionalities:

### 1. Starting the script (`main.sh`)
 - Starting point of the project
 - Prompts user with choice of add, modify, delete, view or exit the record

### 2. Adding Books (`add.sh`)

- Accepts details for books, including Book No, Name of the book, Author, Publishers Name, Price, Year of release, and Subject Code.
- Performs validations such as checking for duplicate Book No, ensuring non-blank fields, validating the year of release, ensuring non-zero price, and validating the subject code.
- Allows the user to enter multiple records.

### 3. Modifying Book Details (`modify.sh`)

- If a book number exist all the field can be modified
- User will be promted sequentially for new value for each field if left empty then no     modification on that field
- All the field are validated if validation fails then value is not updated
- Mulitple fields can be modified

### 4. Deleting Books by Book Number (`delete.sh`)

- Deletes the book record if the book number entered by user is correct
- The deletion is interactive
- Multilple records can be deleted

### 5. Viewing or Searching the data (`view.sh`)

- User can see all record or can be prompted with various choice
- Search choice include by author name, book name, book number, subject code
- Displays all the record based on the above search criteria

## How to Use:

1. Clone the repository: `https://github.com/ayush-921/book_management_shell_script`
2. Navigate to the repository: `cd book_management_shell_script`
3. Run the script: `./main.sh`,
   
---
