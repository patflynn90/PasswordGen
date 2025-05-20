import ArgumentParser

@main
struct PasswordGen: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "pg",
        abstract: "A macOS command-line password generator"
    )

    @Flag(help: "Display the raw generated password in stdout (not recommended)")
    var unsafe: Bool = false

    @Flag(help: "Do not copy password to system clipboard (implies --unsafe)")
    var nocopy: Bool = false

    func run() throws {
        let generator = PasswordGenerator()
        let password = try generator.generatePassword()

        // Determine whether to show the raw password
        let shouldShowRawPassword = unsafe || nocopy
        
        // Copy to clipboard unless nocopy is specified
        if !nocopy {
            let clipboard = ClipboardManager()
            clipboard.copyToClipboard(password)
            print("Password has been copied to the clipboard.")
        }
        
        // Display the password (masked or raw)
        let displayPassword = shouldShowRawPassword ? password : String(repeating: "*", count: password.count)
        print("Generated password: \(displayPassword)")
    }
}
