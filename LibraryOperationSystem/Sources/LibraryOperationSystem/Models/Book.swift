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


enum Genre: Int {
    case crimeAndMystery = 1
    case nonFiction = 2
    case romance = 3
    case scienceFiction = 4
    case biography = 5
}