# PasswordGen (`pg`)

[![Version](https://img.shields.io/badge/version-0.1.0-4eaeff.svg)](https://github.com/patflynn90/PasswordGen/releases/tag/v0.1.0) ![Platform](https://img.shields.io/badge/platform-macOS-31de6e.svg) ![License](https://img.shields.io/github/license/patflynn90/PasswordGen?color=e96658)

A macOS command-line password generator that creates strong, secure passwords and automatically copies them to your clipboard.

## Version

Current version: 0.1.0

## Features

- Generates passwords with 3 segments of 6 characters each (format: `xxxxxx-xxxxxx-xxxxxx`)
- Uses cryptographically secure random generation via Apple's Security framework
- Automatically copies passwords to clipboard for security (no plaintext display by default)
- Simple command-line interface with sensible defaults
- No external dependencies beyond Apple frameworks and Swift ArgumentParser

## Requirements

- macOS 15 or later
- Swift 6.1 or later (for building from source)

## Installation

### Using Swift Package Manager

```
git clone https://github.com/yourusername/PasswordGen.git
cd PasswordGen
swift build -c release
sudo cp .build/release/pg /usr/local/bin/pg
```

## Usage

Generate a password (copied to clipboard):

```
pg
```

Show the generated password in the terminal (not recommended for sensitive environments):

```
pg --unsafe
```

Generate a password without copying to clipboard (raw output to stdout only):

```
pg --raw
```

### Command-line Options

- `--unsafe`: Display the raw generated password in stdout (not recommended)
- `--raw`: Raw password output to stdout (no clipboard, no extra output)

## How It Works

PasswordGen creates passwords with the following characteristics:
- 3 segments of 6 alphanumeric characters (a-z, A-Z, 0-9)
- Segments are separated by hyphens
- Total length: 20 characters (including separators)
- Example: `a1Bc9Z-2xYz3w-7pQ8rS`

The password generation uses Apple's `SecRandomCopyBytes` function for cryptographically secure random number generation.

## Building from Source

1. Ensure you have Swift 6.1 or later installed
2. Clone the repository:
   ```
   git clone https://github.com/yourusername/PasswordGen.git
   ```
3. Navigate to the project directory:
   ```
   cd PasswordGen
   ```
4. Build the project:
   ```
   swift build -c release
   ```
5. The executable will be located at `.build/release/pg`

## Running Tests

```
swift test
```

## License

See the [LICENSE](LICENSE) file for details.
