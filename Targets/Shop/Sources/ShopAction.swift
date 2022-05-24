//
//  ShopAction.swift
//  Shop
//
//  Created by Hai Feng Kao on 2022/3/15.
//  Copyright © 2022 io.tuist. All rights reserved.
//

import Foundation

protocol AutoCaseName {}

// sourcery: Prism
public enum ShopAction: AutoCaseName {
    case changeSection(ShopState.Mode)
    case buy(Item)
}


