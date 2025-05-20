import ArgumentParser

@main
struct PasswordGen: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "pg",
        abstract: "A macOS command-line password generator",
        version: "0.1.0"
    )

    @Flag(help: "Display the raw generated password in stdout (not recommended)")
    var unsafe: Bool = false

    @Flag(help: "Raw password output to stdout (no clipboard, no extra output)")
    var raw: Bool = false

    func run() throws {
        let generator = PasswordGenerator()
        let password = try generator.generatePassword()

        if raw {
            // Raw mode: only the password goes to stdout, no clipboard
            print(password)
        } else {
            // Copy to clipboard in all non-raw modes
            let clipboard = ClipboardManager()
            clipboard.copyToClipboard(password)
            print("Password has been copied to the clipboard.")

            // Display the password (masked or raw)
            let displayPassword = unsafe ? password : String(repeating: "*", count: password.count)
            print("Generated Password: \(displayPassword)")
        }
    }
}
