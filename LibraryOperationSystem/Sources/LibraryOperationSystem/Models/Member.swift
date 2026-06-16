import Foundation

struct Member: Identifiable {
    let id: Int
    let name: String
    var borrowedBookCodes: Set<Int> = []
}
