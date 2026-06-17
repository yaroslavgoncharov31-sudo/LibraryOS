import Foundation 

final class InputValidator: Sendable {
    static let shared = InputValidator()

    private init() {}

    func isNameValid() -> String? {
        print("Enter the name of the book.")
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
}

