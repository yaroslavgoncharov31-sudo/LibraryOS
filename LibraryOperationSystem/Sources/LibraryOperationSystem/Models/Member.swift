class Member: Codable {
    let name: String
    let id: Int
    var borrowedBooksCodes: Set<Int> = []

    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }    
}
extension Member: CustomStringConvertible {
    var description: String {
        "\(name) (ID: \(id)), borrowed: \(borrowedBooksCodes)"
    }
}