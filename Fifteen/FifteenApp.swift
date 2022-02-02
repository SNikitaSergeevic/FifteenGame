//
//  FifteenApp.swift
//  Fifteen
//
//  Created by ProstoKakTo on 26.06.2021.
//

import SwiftUI

@main
struct FifteenApp: App {
    var viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
