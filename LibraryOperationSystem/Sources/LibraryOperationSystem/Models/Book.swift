import Foundation

struct Book: Identifiable {
    let id: Int
    let name: String
    let author: String
    let genre: Genre
}

enum Genre: String, CaseIterable {
    case crimeAndMystery = "Crime & Mystery"
    case nonFiction = "Non-fiction"
    case romance = "Romance"
    case scienceFiction = "Science Fiction"
    case biography = "Biography"
}
