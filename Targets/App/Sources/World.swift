//
//  World.swift
//  SwiftRexDemo
//
//  Created by Hai Feng Kao on 2022/3/15.
//

import CombineRex
import Foundation
import SwiftRex
public enum AppAction {}

public struct AppState {
    static let empty: Self = .init()
}

public class World {
    var store: AnyStoreType<AppAction, AppState>?

    init() {
        let initialState = AppState.empty

        let store: ReduxStoreBase<AppAction, AppState> = .init(
            subject: .combine(initialValue: initialState),
            reducer: .identity,

            middleware: IdentityMiddleware(),

            emitsValue: .always // AppState always change upon receiving any actions. there is no reason to waste time for comparison. leave it to ObservableViewModel(it use .whenDifferent by default) for comparison
        )
        self.store = store.eraseToAnyStoreType()
    }
}
