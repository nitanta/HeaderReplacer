//Copyright © 2022 and Confidential to ___ORGANIZATIONNAME___ All rights reserved.
   

import Foundation

public final class FileUpdater {
    
    let copyRightString: String
    let filePath: String

    let verbose: Bool
    public init(verbose: Bool = false, path: String, copyRight: String) {
        self.verbose = verbose
        self.filePath = path
        self.copyRightString = copyRight
    }

    public func run() throws {
        print("🔎 Searching Files")
        let files = findFiles(rootPath: filePath, suffix: ".swift") ?? []
        if files.isEmpty {
            print("🥴 No files found")
        } else {
            for file in files {
                if verbose {
                    print("🚧 Updating \(file)")
                }
                var lines = Array(open(file).components(separatedBy: "\n").reversed())
                while lines.last?.hasPrefix("//") == true || lines.last == "" {
                    _ = lines.popLast()
                }
                let result = lines.reversed().joined(separator: "\n")
                save(copyRightString + "\n\n" + result, file)
            }
            print("🟢 Update Complete")
        }
    }

    func findFiles(rootPath: String, suffix: String, ignoreDirs: Bool = true) -> [String]? {
        var result = [String]()
        let fileManager = FileManager.default
        if let paths = fileManager.subpaths(atPath: rootPath) {
            let swiftPaths = paths.filter { $0.hasSuffix(suffix) }
            for path in swiftPaths {
                var isDir : ObjCBool = false
                let fullPath = (rootPath as NSString).appendingPathComponent(path)
                if fileManager.fileExists(atPath: fullPath, isDirectory: &isDir) {
                    if ignoreDirs == false || (ignoreDirs && isDir.boolValue == false) {
                        result.append(fullPath)
                    }
                }
            }
        }
        return result.count > 0 ? result : nil
    }

    func open(_ file: String) -> String {
        return try! String(contentsOfFile: file, encoding: .utf8)
    }

    func save(_ result: String, _ file: String) {
        try? result.write(toFile: file, atomically: false, encoding: .utf8)
    }
}
