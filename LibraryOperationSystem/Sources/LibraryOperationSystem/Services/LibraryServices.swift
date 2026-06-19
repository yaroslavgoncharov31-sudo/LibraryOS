import Foundation
extension Library {
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
}
extension Library {
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
}

extension Library {
    func addMember(name: String) {
        let newID = members.count + 1
        let member: Member = Member(name: name, id: newID)
        self.members.append(member)
        PersistenceService.shared.save(library: self)
    }
}
extension Library {
    func addBook(name: String, author: String, genre: Genre) {
        let newCode = books.count + 1
        let book: Book = Book(code: newCode, name: name, author: author, genre: genre)
        self.books.append(book)
        PersistenceService.shared.save(library: self)
    }
}