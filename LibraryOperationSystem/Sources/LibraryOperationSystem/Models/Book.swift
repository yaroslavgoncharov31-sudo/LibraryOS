class Book {
    let code: Int
    let name: String
    let author: String
    var status: BookStatus
    let genre: Genre

    init(code: Int, name: String, author: String, status: BookStatus, genre: Genre) {
        self.code = code
        self.name = name
        self.author = author
        self.status = status
        self.genre = genre
    }
}

enum BookStatus {
    case available 
    case borrowed
}

enum Genre {
    case crimeAndMystery
    case nonFiction
    case romance
    case scienceFiction
    case biography
}