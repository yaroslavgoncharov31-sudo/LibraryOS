class Member {
    let name: String
    let id: Int
    var borrowedBooks: [Book] = []

    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }    

}