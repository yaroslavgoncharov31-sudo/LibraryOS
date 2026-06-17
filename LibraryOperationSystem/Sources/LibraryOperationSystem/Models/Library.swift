import Foundation

class Library {

    private init() {}

    @MainActor static let shared = Library()
    var members: [Member] = []
    var books: [Book] = []
    var availableBooks: [Book] {
        books.filter { book in
            !members.contains(where: { $0.borrowedBooksCodes.contains(book.code) } )
        }
    }
    var borrowedBooks: [Book] {
         books.filter { book in
            members.contains(where: { $0.borrowedBooksCodes.contains(book.code) } )
        }
    }
}

