//
//  ShopReduxFramework.swift
//  Shop
//
//  Created by Hai Feng Kao on 2022/3/15.
//  Copyright © 2022 io.tuist. All rights reserved.
//

import Foundation

public struct ShopState {
    public enum Mode {
        case weapon
        case armor
    }

    var mode: Mode = .weapon

    let weapons: [Weapon]
    let armors: [Armor]

    public static let fake: Self = .init(weapons: .fake, armors: .fake)
}
