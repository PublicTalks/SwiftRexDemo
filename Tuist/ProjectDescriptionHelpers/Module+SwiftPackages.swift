//
//  Framework+SwiftPackages.swift
//  ProjectDescriptionHelpers
//
//  Created by Hai Feng Kao on 2022/1/3.
//

import Foundation

extension Module {

    static let SwiftCollection: Module = .package(SwiftPackage(name: "Collections", url: "https://github.com/apple/swift-collections.git", requirement: .upToNextMajor(from: "1.0.2")))


    static let Fakery: Module = .package(SwiftPackage(name: "Fakery", url: "https://github.com/vadymmarkov/Fakery.git", requirement: .upToNextMajor(from: "5.1.0")))

    static let Tagged: Module = .package(SwiftPackage(name: "Tagged", url: "https://github.com/pointfreeco/swift-tagged.git", requirement: .upToNextMajor(from: "0.6.0")))

    static let Difference: Module = .package(SwiftPackage(name: "Difference", url: "https://github.com/krzysztofzablocki/Difference.git", requirement: .upToNextMajor(from: "1.0.1")))
}
