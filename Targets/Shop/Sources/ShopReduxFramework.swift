//
//  ShopReduxFramework.swift
//  Shop
//
//  Created by Hai Feng Kao on 2022/3/15.
//  Copyright © 2022 io.tuist. All rights reserved.
//

import Foundation
import SwiftRex

func updateSecion(action: ShopAction, state: inout ShopState) {
    if case let ShopAction.changeSection(m) = action {
        state.mode = m
    }
}


public enum ShopReduxFramework {
    public static let reducer: Reducer<ShopAction, ShopState> = .reduce(updateSecion)
}
