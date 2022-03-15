//
//  Module+Shop.swift
//  ProjectDescriptionHelpers
//
//  Created by Hai Feng Kao on 2022/2/15.
//

import Foundation

extension Module {
    static let Shop: Module = .uFeature(name: "Shop",
                                        group: .none,
                                        targets: [
                                            .framework: .resourcesWithModules([.Armor]),
                                            .unitTests: .empty,
                                            .exampleApp: .empty

                                        ])
    static let Armor: Module = .uFeature(name: "Armor",
                                        group: .none,
                                        targets: [
                                            .framework: .modules([]),
                                            .unitTests: .empty,
                                          

                                        ])
}
