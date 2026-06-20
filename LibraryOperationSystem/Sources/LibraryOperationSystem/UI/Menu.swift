struct Menu {
    static func showMainMenu() {
        print("""

        Choose an option:
        1. Show all books
        2. Show all members
        3. Show available books
        4. Borrow book
        5. Return book
        6. Add a member
        7. Add a book
        8. Delete member
        9. Delete book
        10. Exit
        """)
    }
    static func showGenreMenu() {
        print("""

        Choose a genre:
        1. Crime and Mystery
        2. Non-Fiction
        3. Romance
        4. Science Fiction
        5. Biography
        """)
    }
}