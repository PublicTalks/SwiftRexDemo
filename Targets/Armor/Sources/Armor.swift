//
//  Armor.swift
//  DeclarativeProgrammingCocoaHeads
//
//  Created by Hai Feng Kao on 2021/12/9.
//

import Foundation

public struct Armor {
    let name: String
    let defense: Float
    let price: Int
}

extension Array where Element == Armor {
    static let fake: Self = [
        .init(name: "皮甲", defense: 11.0, price: 10),
        .init(name: "鑲釘皮甲", defense: 12.0, price: 45),
        .init(name: "鱗甲", defense: 14.0, price: 50),
        .init(name: "鎖子甲", defense: 16.0, price: 75),
        .init(name: "全身板甲", defense: 18.0, price: 1500),
        .init(name: "盾牌", defense: 2.0, price: 10),
    ]
}
