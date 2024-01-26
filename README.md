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

- work in progress

### 4. Deleting Books by Book Number (`delete.sh`)

- work in progress

### 5. Viewing or Searching the data (`view.sh`)

- User can see all record or can be prompted with various choice
- Search choice include by author name, book name, book number, subject code
- Displays all the record based on the above search criteria

## How to Use:

1. Clone the repository: `https://github.com/ayush-921/book_management_shell_script`
2. Navigate to the repository: `cd book_management_shell_script`
3. Run the script: `./main.sh`,
   
---
