import ArgumentParser
import Foundation

struct HeaderReplace: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "A Swift command-line tool to update comment headers in a given directory",
        subcommands: [PerformUpdate.self])

    init() {
    }
}

HeaderReplace.main()

struct PerformUpdate: ParsableCommand {

    public static let configuration = CommandConfiguration(abstract: "Start to update comment headers in a given directory.")

    @Argument(help: "The copyright info to replace the header comments with")
    private var copyRight: String

    @Option(name: .shortAndLong, help: "The path of the directory from where the search begins.")
    private var path: String

    @Flag(name: .shortAndLong, help: "Show extra logging for debugging purposes.")
    private var verbose = false

    func run() throws {
        let updater: FileUpdater
        if verbose {
             updater = FileUpdater(verbose: true, path: path, copyRight: copyRight)
        } else {
             updater = FileUpdater(path: path, copyRight: copyRight)
        }
        try updater.run()
    }
}

