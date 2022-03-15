import Foundation
import ProjectAutomation

/// copyed from MicroFeatureGroup.swift
/// I don't know how to avoid duplicated codes
enum MicroFeatureGroup: String {
    case none
    case infrastructure = "Infrastructure"
    case applicationServices = "ApplicationServices"
    case utilities = "Utilities"
    case common = "Common"
}

@discardableResult
func shell(_ args: [String]) -> String {
    let task = Process()

    task.launchPath = "/usr/bin/env"
    task.arguments = args

    let pipe = Pipe()
    task.standardOutput = pipe

    task.launch()
    task.waitUntilExit()

    let output_from_command = String(data: pipe.fileHandleForReading.readDataToEndOfFile(), encoding: String.Encoding.utf8)!

    return output_from_command
}

typealias Strings = [String]

enum Template: String {
    case prism = "Prism"
    case lenses = "AutoLenses"
    case caseName = "AutoCaseName"
}

let appFolder = URL(string: FileManager.default.currentDirectoryPath)!
struct Templates: CustomStringConvertible, ExpressibleByArrayLiteral {
    let templates: [Template]
    let templateFolder: URL = appFolder.appendingPathComponent("Sourcery", isDirectory: true)

    init(arrayLiteral elements: Template...) {
        templates = elements
    }

    var description: String {
        let templateStrs: [URL] = templates.map {
            templateFolder.appendingPathComponent($0.rawValue, isDirectory: true)
        }

        return templateStrs.map { "--templates \($0)" }.joined(separator: " ")
    }
}

enum TargetType {
    case framework

    func path(projectName: String) -> String {
        switch self {
        case .framework:
            return "Sources/\(projectName)/Classes"
        }
    }
}

struct Command {
    let app: String = "sourcery"
    let projectName: String
    var group: MicroFeatureGroup = .none
    let targetType: TargetType
    let templates: Templates
    let libs: Strings

    var projectPath: String {
        if group == .none {
            return "Targets/\(projectName)/Targets/" + targetType.path(projectName: projectName)
        } else {
            return "Targets/\(group.rawValue)/\(projectName)/Targets/" + targetType.path(projectName: projectName)
        }
    }

    var outputPath: String {
        projectPath + "/.." + "/Generated"
    }

    var imports: String {
        if libs.count == 1 {
            return "import=\(libs.first!)" // I don't know how to send array of size 1 to sourcery commandline arguments
        }

        return libs.map {
            "imports=\($0)"
        }.joined(separator: ",")
    }

    var commandStr: String {
        return "/opt/homebrew/bin/sourcery --sources \(projectPath) \(templates) --args \(imports) --output \(outputPath)"
    }
}

let task = Task(
    options: [
    ]
) { _ in
}
