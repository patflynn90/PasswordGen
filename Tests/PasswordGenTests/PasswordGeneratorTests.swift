import XCTest

@testable import PasswordGen

final class PasswordGeneratorTests: XCTestCase {
    func testPasswordFormat() throws {
        let generator = PasswordGenerator()
        let password = try generator.generatePassword()

        let components = password.split(separator: "-")
        XCTAssertEqual(components.count, 3, "Password should have 3 segements separated by '-'")

        for segment in components {
            XCTAssertEqual(segment.count, 6, "Each segment should be 6 characters long")
        }
    }
}
