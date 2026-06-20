import Foundation

final class ConsoleHelper: Sendable {

    static let shared = ConsoleHelper()

    private init() {}
    func readMenuChoice() -> Int? {
        guard let input = readLine(),
              let result = Int(input),
              result > 0 && result <= 10 else {
            print("Invalid input.")
            return nil
        }
        return result
    }
    func readGenreMenuChoice() -> Int? {
        guard let input = readLine(),
              let result = Int(input),
              result > 0 && result <= 5 else {
            print("Invalid input.")
            return nil
        }
        return result
    }

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
        guard let input = readLine(), let number = Int(input) else {
            print("Invalid input.")
            return nil
        }
        return number
    }
    func readMemberID() -> Int? {
        print("Enter a member ID:")
        guard let input = readLine(), let number = Int(input) else {
            print("Invalid input.")
            return nil
        }
        return number
    }
}