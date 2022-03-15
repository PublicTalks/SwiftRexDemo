//
//  CombinedItem.swift
//  DeclarativeProgrammingCocoaHeads
//
//  Created by Hai Feng Kao on 2021/12/9.
//

import Foundation

struct ComposedItem: Item {
    let items: [Item]

    var name: String {
        let names = items.map(\.name)
        return names.dropFirst().reduce(names[0]) { str, name in
            "\(str)+\(name)"
        } + "組合優惠"
    }

    var price: Int { Int(Float(items.map(\.price).reduce(0, +)) * 0.8) }
}
