import Foundation
import Security

struct PasswordGenerator {
    private let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    private let separators = "-"
    private let segmentLength = 6
    private let numberOfSegments = 3

    func generatePassword() throws -> String {
        var passwordSegments: [String] = []

        for _ in 0..<numberOfSegments {
            var segment = ""
            for _ in 0..<segmentLength {
                let randomIndex = try secureRandomIndex(in: 0..<characters.count)
                let character = characters[
                    characters.index(characters.startIndex, offsetBy: randomIndex)]
                segment.append(character)
            }
            passwordSegments.append(segment)
        }
        return passwordSegments.joined(separator: separators)
    }

    private func secureRandomIndex(in range: Range<Int>) throws -> Int {
        var randomValue: Int32 = 0
        let result = SecRandomCopyBytes(kSecRandomDefault, MemoryLayout<Int32>.size, &randomValue)
        if result != errSecSuccess {
            throw SecurityError.invalidRandomGeneration
        }
        // Ensure we get a positive index by using the absolute value
        return abs(Int(randomValue)) % range.count + range.lowerBound
    }
}

enum SecurityError: Error {
    case invalidRandomGeneration
}
