//
//  ShopAction.swift
//  Shop
//
//  Created by Hai Feng Kao on 2022/3/15.
//  Copyright © 2022 io.tuist. All rights reserved.
//

import Foundation

public enum ShopAction {
    case changeSection(ShopState.Mode)
    case buy(Item)
}
