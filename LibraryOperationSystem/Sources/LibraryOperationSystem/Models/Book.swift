class Book {
    let code: Int
    let name: String
    let author: String
    let genre: Genre

    init(code: Int, name: String, author: String, genre: Genre) {
        self.code = code
        self.name = name
        self.author = author
        self.genre = genre
    }
}


enum Genre {
    case crimeAndMystery
    case nonFiction
    case romance
    case scienceFiction
    case biography
}