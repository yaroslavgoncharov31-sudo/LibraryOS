enum LibraryErrors: Error {
    case alreadyBorrowed
    case bookNotFound
    case memberNotFound
    case bookNotBorrowedByMember
}
