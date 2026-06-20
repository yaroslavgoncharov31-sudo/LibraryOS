import Foundation 

final class InputValidator: Sendable {
    static let shared = InputValidator()

    private init() {}

    func isBookNameValid() -> String? {
        print("Enter the book name.")
        guard let input = readLine(), !input.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            print("Invalid input.")
            return nil
        }
        return input
    }
    func isAuthorNameValid() -> String? {
        print("Enter the author.")
        guard let input = readLine(), !input.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            print("Invalid input.")
            return nil
        }
        return input
    }
     func isMemberNameValid() -> String? {
        print("Enter the name.")
        guard let input = readLine(), !input.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            print("Invalid input.")
            return nil
        }
        return input
    }
    func readBookCode() -> Int? {
        print("Enter a book code:")
        guard let input = readLine(),
            let number = Int(input) else {
                print("Invalid input.")
                return nil
            }
            return number

    }
    func readMemberID() -> Int? {
        print("Enter a member ID:")
        guard let input = readLine(),
            let number = Int(input) else {
                print("Invalid input.")
                return nil
            }
            return number

    }
     func readGenre() -> Int? {
        guard let input = readLine(),
            let number = Int(input) else {
                print("Invalid input.")
                return nil
            }
            return number
    }

}

