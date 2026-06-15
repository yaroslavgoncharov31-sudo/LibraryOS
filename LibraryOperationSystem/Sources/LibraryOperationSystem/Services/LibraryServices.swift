func borrowBook(bookCode: Int, memberID: Int) throws  {
 
    guard let member = Library.shared.members.first(where: { $0.id == memberID }) else {
        throw LibraryErrors.memberNotFound
    }
    
    guard let book = Library.shared.books.first(where: { $0.code == bookCode }) else {
        throw LibraryErrors.bookNotFound
    }
    guard book.status == .available else {
        throw LibraryErrors.alreadyBorrowed
    }

    member.borrowedBooks.append(book)
    book.status = .borrowed
}


