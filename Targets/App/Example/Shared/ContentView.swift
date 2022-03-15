//
//  ContentView.swift
//  Shared
//
//  Created by Hai Feng Kao on 2021/12/9.
//

import App
import Shop
import SwiftUI

public struct ContentView: View {
    public init(state: AppState) {
        self.state = state
    }

    let state: AppState

    public var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: ShopView(state: state.shopState)) {
                    Text("Shop")
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(state: .empty)
    }
}
