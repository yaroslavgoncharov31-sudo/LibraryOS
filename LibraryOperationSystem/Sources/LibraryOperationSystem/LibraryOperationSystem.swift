@main 
struct LibraryOperationSystem {
   @MainActor static func main() {
    PersistenceService.shared.load(into: Library.shared)
     showMenu(library: Library.shared)
   }
   @MainActor private static func showMenu(library: Library) {
            var isRunning = true
            while isRunning {
                Menu.showMainMenu()

                guard let choice = ConsoleHelper.shared.readMenuChoice() else {
                    continue
                }
                switch choice {
                    case 1:
                       library.books.forEach{ print($0) }
                    case 2:
                        library.availableBooks.forEach{ print($0) }
                    case 3:
                       guard let validBookCode: Int = InputValidator.shared.readBookCode() else {
                            print("Invalid input")
                            continue
                       }
                         guard let validMemberID: Int = InputValidator.shared.readMemberID() else {
                            print("Invalid input")
                            continue
                       }
                        do {
                            try Library.shared.borrowBook(bookCode: validBookCode, memberID: validMemberID)
                            print("Book borrowed successfully!")
                        } catch {
                            print("Error: \(error)")
                        }
                       
                    case 4:
                        guard let validBookCode: Int = InputValidator.shared.readBookCode() else {
                            print("Invalid input")
                            continue
                       }
                         guard let validMemberID: Int = InputValidator.shared.readMemberID() else {
                            print("Invalid input")
                            continue
                       }
                        do {
                            try Library.shared.returnBook(bookCode: validBookCode, memberID: validMemberID)
                            print("Book returned successfully!")
                        } catch {
                            print("Error: \(error)")
                        }
                    case 5:
                        guard let validName = InputValidator.shared.isBookNameValid() else {
                            print("Invalid input.")
                            continue 
                        }
                        Library.shared.addMember(name: validName)
                    case 6: 
                        guard let validName = InputValidator.shared.isBookNameValid() else {
                            print("Invalid input.")
                            continue 
                        }
                         guard let validAuthor = InputValidator.shared.isAuthorNameValid() else {
                            print("Invalid input.")
                            continue 
                        }
                        Menu.showGenreMenu()
                        guard let genreChoice = ConsoleHelper.shared.readGenreMenuChoice() else {
                            continue
                        }
                        guard let genre: Genre = Genre(rawValue: genreChoice) else {
                            print("Invalid genre.")
                            continue
                        }
                        Library.shared.addBook(name: validName, author: validAuthor, genre: genre)
                    case 7:
                        isRunning = false
                    default: 
                    print("Invalid input.")
                }
            }
        }
    }   
     
