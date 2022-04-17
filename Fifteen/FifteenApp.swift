//
//  FifteenApp.swift
//  Fifteen
//
//  Created by ProstoKakTo on 26.06.2021.
//
// add continue with userDefaults
//
//

import SwiftUI

@main
struct FifteenApp: App {
    var viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
//            ContentView(viewModel: viewModel)
            MainMenuView(viewModel: viewModel)
        }
    }
}
