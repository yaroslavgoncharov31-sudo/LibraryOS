import Foundation

struct PersistenceService {
    
    static let shared = PersistenceService()
    private init() {}

private let fileURL = URL(fileURLWithPath: "library.json")

func save(library: Library) {
    let encoder = JSONEncoder()
    let libraryData = LibraryData(books: library.books, members: library.members)

    do {
        let data = try encoder.encode(libraryData)
        try data.write(to: fileURL)
    } catch {
        print("Something went wrong \(error.localizedDescription)")
    }
}

func load(into library: Library) {
    let decoder = JSONDecoder()
    do { 
        let data = try Data(contentsOf: fileURL)
        let libraryData = try decoder.decode(LibraryData.self, from: data)
        library.books = libraryData.books
        library.members = libraryData.members
    } catch {
       print("Something went wrong \(error.localizedDescription)") 
    }
}
}