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
        
        demo()
    }
}


public extension World {
    static let origin: World = .init()
}


func demo() {
    
    let action: ShopAction = .changeSection(.armor)
    
    if let section = action.changeSection {
        print(section)
    }
    
    
    let action2: ShopAction = .changeSection(.weapon)
    print(action.caseName == action2.caseName)
    
    let weapon: Weapon = .init(name: "木棒", damage: 6.0, price: 1)
    
    let weapon2 = weapon |> Weapon.lens.name .~ "鐵棒"
    |> Weapon.lens.price .~ 5
    
    print(weapon2)
}
