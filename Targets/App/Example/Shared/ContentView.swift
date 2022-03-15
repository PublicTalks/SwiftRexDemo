//
//  ContentView.swift
//  Shared
//
//  Created by Hai Feng Kao on 2021/12/9.
//

import App
import Shop
import SwiftUI
import CombineRex

public struct ContentView: View {
    public typealias ViewState = AppState
    public typealias ViewAction = AppAction
    public typealias ViewModel = ObservableViewModel<ViewAction, ViewState>
    @ObservedObject public var viewModel: ViewModel
    
    public init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var state: ViewState {
        self.viewModel.state
    }

    public var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: ShopView(viewModel: viewModel.projection(action: AppAction.shop, state: \.shopState).asObservableViewModel(initialState: .fake, emitsValue: .always))) {
                    Text("Shop")
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
