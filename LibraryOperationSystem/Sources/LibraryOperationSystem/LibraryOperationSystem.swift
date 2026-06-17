@main 
struct LibraryOperationSystem {
   @MainActor static func main() {
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
                        print(library.books)
                    case 2:
                        print(library.availableBooks)
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
                        isRunning = false
                    default: 
                    print("Invalid input.")
                }
            }
        }
    }   
     
