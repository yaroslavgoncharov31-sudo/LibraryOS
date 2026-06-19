class Book: Codable {
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


enum Genre: Int, Codable {
    case crimeAndMystery = 1
    case nonFiction = 2
    case romance = 3
    case scienceFiction = 4
    case biography = 5
}

extension Book: CustomStringConvertible { 
    var description: String {
        return "\(name), \(author), Genre: \(genre)"
    }
}

extension Genre: CustomStringConvertible {
    var description: String {
        switch self {
            case .crimeAndMystery: return "Crime and Mystery"
            case .nonFiction: return "Non-Fiction"
            case .romance: return "Romance"
            case .scienceFiction: return "Science Fiction"
            case .biography: return "Biography"
        }
    }
}