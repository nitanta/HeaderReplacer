# HeaderReplacer

Repaces all the pre existing headers of a swift project.

xcode provides a default comments on the header for every new file we create. It is possible to implement a way through which we can customize how new headers comments are created using `IDETemplateMacros.plist` mentioned [here](https://oleb.net/blog/2017/07/xcode-9-text-macros/)

Developed using this [blog](https://www.avanderlee.com/swift/command-line-tool-package-manager/)

However, we still need a way to replace the pre existing headers, and this is not possible doing manually.


## Installation

This executable can be installed using [mint](https://github.com/yonaskolb/Mint)

```
brew install mint
mint install nitanta/yourCommandLineRepo
```

## Usage

Right now, we need to run the package using Mint. 

```mint run HeaderReplacer header-replace perform-update <copy-right> --path <path> [--verbose]```

However, we can make it to work globally

```/Users/[your_username]/.mint/bin must be added to your $PATH if you wish to run this package outside of mint```

and be used as

```
header-replace perform-update <copy-right> --path <path> [--verbose]
```
