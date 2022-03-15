//
//  World.swift
//  SwiftRexDemo
//
//  Created by Hai Feng Kao on 2022/3/15.
//

import CombineRex
import Foundation
import SwiftRex
import Shop
public enum AppAction {
    case shop(ShopAction)
}

extension AppAction {
    var shop: ShopAction? {
        if case let AppAction.shop(action) = self {
            return action
        }
        return nil
    }
}

public struct AppState {
    public var shopState: ShopState
    public static let empty: Self = .init(shopState: .fake)
}

public class World {
    public var store: AnyStoreType<AppAction, AppState>!

    init() {
        let initialState = AppState.empty

        let store: ReduxStoreBase<AppAction, AppState> = .init(
            subject: .combine(initialValue: initialState),
            reducer: ShopReduxFramework.reducer.lift(action: \AppAction.shop, state: \AppState.shopState),

            middleware: IdentityMiddleware(),

            emitsValue: .always // AppState always change upon receiving any actions. there is no reason to waste time for comparison. leave it to ObservableViewModel(it use .whenDifferent by default) for comparison
        )
        self.store = store.eraseToAnyStoreType()
    }
}


public extension World {
    static let origin: World = .init()
}
