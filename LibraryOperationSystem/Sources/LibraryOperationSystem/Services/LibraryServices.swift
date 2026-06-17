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
}
}
