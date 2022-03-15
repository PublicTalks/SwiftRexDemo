//
//  ShopReduxFramework.swift
//  Shop
//
//  Created by Hai Feng Kao on 2022/3/15.
//  Copyright © 2022 io.tuist. All rights reserved.
//

import Foundation
import SwiftRex

func updateSecion(state: inout ShopState, action: ShopAction) {
    if case let ShopAction.changeSection(m) = action {
        state.mode = m
    }
}
