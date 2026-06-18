final class ConsoleHelper: Sendable {

    static let shared = ConsoleHelper()

    private init() {}
    func readMenuChoice() -> Int? {
        guard let input = readLine(),
              let result = Int(input),
              result > 0 && result <= 7 else {
            print("Invalid input.")
            return nil
        }
        return result
    }
    func readGenreMenuChoice() -> Int? {
        guard let input = readLine(),
              let result = Int(input),
              result > 0 && result <= 7 else {
            print("Invalid input.")
            return nil
        }
        return result
    }
}