import ArgumentParser

@main
struct PasswordGen: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "pg",
        abstract: "A macOS command-line password generator"
    )

    @Flag(help: "Display the generated password in stdout (not recommended)")
    var unsafe: Bool = false

    func run() throws {
        let generator = PasswordGenerator()
        let password = try generator.generatePassword()

        let clipboard = ClipboardManager()
        clipboard.copyToClipboard(password)

        let displayPassword = unsafe ? password : String(repeating: "*", count: password.count)
        print("Generated password: \(displayPassword)")
        print("Password has been copied to the clipboard.")
    }
}
