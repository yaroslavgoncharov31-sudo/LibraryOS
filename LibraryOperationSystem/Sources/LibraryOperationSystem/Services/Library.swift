import Foundation

class Library {

    private init() {}

    @MainActor static let shared = Library()
    var members: [Member] = []
    var books: [Book] = []
    var availableBooks: [Book] {
        books.filter { book in
            !members.contains(where: { $0.borrowedBooksCodes.contains(book.code) })
        }
    }
    var borrowedBooks: [Book] {
        books.filter { book in
            members.contains(where: { $0.borrowedBooksCodes.contains(book.code) })
        }
    }
    func borrowBook(bookCode: Int, memberID: Int) throws {

        guard let member = self.members.first(where: { $0.id == memberID }) else {
            throw LibraryErrors.memberNotFound
        }
        guard let book = self.books.first(where: { $0.code == bookCode }) else {
            throw LibraryErrors.bookNotFound
        }
        guard availableBooks.contains(where: { $0.code == book.code }) else {
            throw LibraryErrors.alreadyBorrowed
        }
        member.borrowedBooksCodes.insert(book.code)
        PersistenceService.shared.save(library: self)
    }
    func returnBook(bookCode: Int, memberID: Int) throws {
        guard let member = self.members.first(where: { $0.id == memberID }) else {
            throw LibraryErrors.memberNotFound
        }
        guard let book = self.books.first(where: { $0.code == bookCode }) else {
            throw LibraryErrors.bookNotFound
        }
        guard member.borrowedBooksCodes.contains(book.code) else {
            throw LibraryErrors.bookNotBorrowedByMember
        }

        member.borrowedBooksCodes.remove(book.code)
        PersistenceService.shared.save(library: self)
    }

    func addMember(name: String) {
        let newID = (members.map { $0.id }.max() ?? 0) + 1
        let member: Member = Member(name: name, id: newID)
        self.members.append(member)
        PersistenceService.shared.save(library: self)
    }

    func addBook(name: String, author: String, genre: Genre) throws {
        let newCode = (books.map { $0.code }.max() ?? 0) + 1
        guard !books.contains(where: { $0.name == name }) else {
            throw LibraryErrors.bookAlreadyExists
        }
        let book: Book = Book(code: newCode, name: name, author: author, genre: genre)
        self.books.append(book)
        PersistenceService.shared.save(library: self)
    }

    func deleteMember(id: Int) throws {
        guard let index = members.firstIndex(where: { $0.id == id }) else {
            throw LibraryErrors.memberNotFound
        }
        members.remove(at: index)
        PersistenceService.shared.save(library: self)
    }

    func deleteBook(code: Int) throws {
        guard let index = books.firstIndex(where: { $0.code == code }) else {
            throw LibraryErrors.bookNotFound
        }
        books.remove(at: index)
        PersistenceService.shared.save(library: self)
    }
}
struct LibraryData: Codable {
    var books: [Book]
    var members: [Member]
}
