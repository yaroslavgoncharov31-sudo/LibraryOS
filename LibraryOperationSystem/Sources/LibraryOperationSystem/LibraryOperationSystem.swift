import Foundation

@main
struct LibraryOperationSystem {
    static func main() async {
        let library = Library()
        await runApplication(using: library)
    }

    private static func runApplication(using library: Library) async {
        print("Welcome to LibraryOS")

        while true {
            printMenu()

            guard let choice = InputValidator.shared.readInt(prompt: "Select an option:") else {
                continue
            }

            switch choice {
            case 1:
                await listAllBooks(library)
            case 2:
                await listAllMembers(library)
            case 3:
                await addBook(library)
            case 4:
                await addMember(library)
            case 5:
                await borrowBook(library)
            case 6:
                await returnBook(library)
            case 7:
                print("Goodbye.")
                return
            default:
                print("Unknown option. Please choose a number from 1 to 7.")
            }
        }
    }

    private static func printMenu() {
        print("\n=== LibraryOS Menu ===")
        print("1. List all books")
        print("2. List all members")
        print("3. Add a book")
        print("4. Add a member")
        print("5. Borrow a book")
        print("6. Return a book")
        print("7. Exit")
    }

    private static func listAllBooks(_ library: Library) async {
        let books = await library.books
        let borrowedBooks = await library.borrowedBooks

        guard !books.isEmpty else {
            print("No books available in the library.")
            return
        }

        for book in books {
            let status = borrowedBooks.contains(where: { $0.id == book.id }) ? "Borrowed" : "Available"
            print("\(book.id): \(book.name) by \(book.author) [\(book.genre.rawValue)] - \(status)")
        }
    }

    private static func listAllMembers(_ library: Library) async {
        let members = await library.members

        guard !members.isEmpty else {
            print("No members registered.")
            return
        }

        for member in members {
            let borrowedBookCount = member.borrowedBookCodes.count
            print("\(member.id): \(member.name) — borrowed books: \(borrowedBookCount)")
        }
    }

    private static func addBook(_ library: Library) async {
        guard let code = InputValidator.shared.readInt(prompt: "Enter book code:") else { return }
        guard let name = InputValidator.shared.readNonEmptyString(prompt: "Enter book name:") else { return }
        guard let author = InputValidator.shared.readNonEmptyString(prompt: "Enter book author:") else { return }

        print("Choose a genre:")
        Genre.allCases.enumerated().forEach { index, genre in
            print("\(index + 1). \(genre.rawValue)")
        }

        guard let genreIndex = InputValidator.shared.readInt(prompt: "Select a genre number:"),
              genreIndex >= 1,
              genreIndex <= Genre.allCases.count else {
            print("Invalid genre selection.")
            return
        }

        let genre = Genre.allCases[genreIndex - 1]

        do {
            try await library.addBook(code: code, name: name, author: author, genre: genre)
            print("Book added successfully.")
        } catch {
            print("Failed to add book: \(error)")
        }
    }

    private static func addMember(_ library: Library) async {
        guard let id = InputValidator.shared.readInt(prompt: "Enter member ID:") else { return }
        guard let name = InputValidator.shared.readNonEmptyString(prompt: "Enter member name:") else { return }

        do {
            try await library.addMember(id: id, name: name)
            print("Member added successfully.")
        } catch {
            print("Failed to add member: \(error)")
        }
    }

    private static func borrowBook(_ library: Library) async {
        guard let memberID = InputValidator.shared.readInt(prompt: "Enter member ID:") else { return }
        guard let bookCode = InputValidator.shared.readInt(prompt: "Enter book code:") else { return }

        do {
            try await library.borrowBook(bookCode: bookCode, memberID: memberID)
            print("Book borrowed successfully.")
        } catch {
            print("Failed to borrow book: \(error)")
        }
    }

    private static func returnBook(_ library: Library) async {
        guard let memberID = InputValidator.shared.readInt(prompt: "Enter member ID:") else { return }
        guard let bookCode = InputValidator.shared.readInt(prompt: "Enter book code:") else { return }

        do {
            try await library.returnBook(bookCode: bookCode, memberID: memberID)
            print("Book returned successfully.")
        } catch {
            print("Failed to return book: \(error)")
        }
    }
}
