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
}

