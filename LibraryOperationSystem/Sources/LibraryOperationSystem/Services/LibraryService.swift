import Foundation

actor LibraryService {
    private var books: [Book] = []
    private var members: [Member] = []

    private var borrowedBookCodes: Set<Int> {
        Set(members.flatMap { $0.borrowedBookCodes })
    }

    func listAllBooks() -> [Book] {
        books
    }

    func listAllMembers() -> [Member] {
        members
    }

    func listAvailableBooks() -> [Book] {
        books.filter { !borrowedBookCodes.contains($0.id) }
    }

    func listBorrowedBooks() -> [Book] {
        books.filter { borrowedBookCodes.contains($0.id) }
    }

    func addBook(code: Int, name: String, author: String, genre: Genre) throws {
        guard books.first(where: { $0.id == code }) == nil else {
            throw LibraryErrors.bookAlreadyExists
        }

        let book = Book(id: code, name: name, author: author, genre: genre)
        books.append(book)
    }

    func addMember(id: Int, name: String) throws {
        guard members.first(where: { $0.id == id }) == nil else {
            throw LibraryErrors.memberAlreadyExists
        }

        let member = Member(id: id, name: name)
        members.append(member)
    }

    func borrowBook(bookCode: Int, memberID: Int) throws {
        guard books.contains(where: { $0.id == bookCode }) else {
            throw LibraryErrors.bookNotFound
        }

        guard let index = members.firstIndex(where: { $0.id == memberID }) else {
            throw LibraryErrors.memberNotFound
        }

        guard !borrowedBookCodes.contains(bookCode) else {
            throw LibraryErrors.alreadyBorrowed
        }

        members[index].borrowedBookCodes.insert(bookCode)
    }

    func returnBook(bookCode: Int, memberID: Int) throws {
        guard let index = members.firstIndex(where: { $0.id == memberID }) else {
            throw LibraryErrors.memberNotFound
        }

        guard members[index].borrowedBookCodes.contains(bookCode) else {
            throw LibraryErrors.bookNotBorrowedByMember
        }

        members[index].borrowedBookCodes.remove(bookCode)
    }

    func isBookBorrowed(bookCode: Int) -> Bool {
        borrowedBookCodes.contains(bookCode)
    }

    func borrower(of bookCode: Int) -> Member? {
        members.first(where: { $0.borrowedBookCodes.contains(bookCode) })
    }
}
