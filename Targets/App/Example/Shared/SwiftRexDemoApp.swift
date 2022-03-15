//
//  DeclarativeProgrammingCocoaHeadsApp.swift
//  Shared
//
//  Created by Hai Feng Kao on 2021/12/9.
//

import App
import SwiftUI

@main
struct SwiftRextDemoApp: App {
    
    let viewModel: ContentView.ViewModel = World.origin.store.asObservableViewModel(initialState: .empty, emitsValue: .always)
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
