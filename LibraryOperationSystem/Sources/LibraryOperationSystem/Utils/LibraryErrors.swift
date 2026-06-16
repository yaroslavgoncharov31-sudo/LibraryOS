import Foundation

enum LibraryErrors: Error, CustomStringConvertible {
    case alreadyBorrowed
    case bookNotFound
    case memberNotFound
    case bookAlreadyExists
    case memberAlreadyExists
    case bookNotBorrowedByMember

    var description: String {
        switch self {
        case .alreadyBorrowed:
            return "The book is already borrowed."
        case .bookNotFound:
            return "The requested book was not found."
        case .memberNotFound:
            return "The requested member was not found."
        case .bookAlreadyExists:
            return "A book with this code already exists."
        case .memberAlreadyExists:
            return "A member with this ID already exists."
        case .bookNotBorrowedByMember:
            return "This member does not have the requested book."
        }
    }
}
