# HeaderReplacer

Repaces all the pre existing headers of a swift project.

xcode provides a default comments on the header for every new file we create. It is possible to implement a way through which we can customize how new headers comments are created using `IDETemplateMacros.plist` mentioned [here](https://oleb.net/blog/2017/07/xcode-9-text-macros/)

Developed using this [blog](https://www.avanderlee.com/swift/command-line-tool-package-manager/)

However, we still need a way to replace the pre existing headers, and this is not possible doing manually.

## Usage

```
header-replace perform-update <copy-right> --path <path> [--verbose]
```

## Installation


