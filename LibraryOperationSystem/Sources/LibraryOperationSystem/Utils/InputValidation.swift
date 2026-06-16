import Foundation

final class InputValidator {
    static let shared = InputValidator()

    private init() {}

    func readNonEmptyString(prompt: String) -> String? {
        print(prompt)
        guard let input = readLine(), !input.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            print("Invalid input. Please try again.")
            return nil
        }
        return input
    }

    func readInt(prompt: String) -> Int? {
        print(prompt)
        guard let raw = readLine(), let value = Int(raw.trimmingCharacters(in: .whitespacesAndNewlines)) else {
            print("Please enter a valid number.")
            return nil
        }
        return value
    }
}

