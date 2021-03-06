//
//  Weapon.swift
//  DeclarativeProgrammingCocoaHeads
//
//  Created by Hai Feng Kao on 2021/12/9.
//

import Foundation

protocol AutoLenses {}
protocol AutoGenericLenses {}
public struct Weapon: AutoLenses {
    
    public init(name: String, damage: Float, price: Int) {
        self.name = name
        self.damage = damage
        self.price = price
    }
    
    public let name: String
    let damage: Float
    public let price: Int
}


public extension Array where Element == Weapon {
    static let fake: Self = [
        .init(name: "木棒", damage: 6.0, price: 1),
        .init(name: "匕首", damage: 3.0, price: 2),
        .init(name: "短劍", damage: 20.0, price: 40),
        .init(name: "飛鏢", damage: 3.0, price: 5),
        .init(name: "短弓", damage: 10.0, price: 20),
        .init(name: "大火箭", damage: 200.0, price: 10000),
    ]
}
