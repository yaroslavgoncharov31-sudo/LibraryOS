import Foundation

@MainActor
class Library {

    private init() {}

    static let shared = Library()
    var members: [Member] = []
    var books: [Book] = []
    var availableBooks: [Book] {
        books.filter { $0.status == .available }
    }
    var borrowedBooks: [Book] {
        books.filter { $0.status == .borrowed }
    }
}