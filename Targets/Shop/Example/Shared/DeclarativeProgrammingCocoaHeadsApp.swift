//
//  DeclarativeProgrammingCocoaHeadsApp.swift
//  Shared
//
//  Created by Hai Feng Kao on 2021/12/9.
//

import Shop
import SwiftUI
@main
struct DeclarativeProgrammingCocoaHeadsApp: App {
    var body: some Scene {
        WindowGroup {
            ShopView(state: .fake)
        }
    }
}
