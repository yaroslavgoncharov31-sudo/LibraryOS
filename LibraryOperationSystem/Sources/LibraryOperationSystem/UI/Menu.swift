struct Menu {
    static func showMainMenu() {
        print("""
        Choose an option:

        1. Show all books
        2. Show available books
        3. Borrow book
        4. Return book
        5. Add a member
        6. Add a book
        7. Exit
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