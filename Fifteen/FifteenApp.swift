//
//  FifteenApp.swift
//  Fifteen
//
//  Created by ProstoKakTo on 26.06.2021.
//
//
// добавить аллерт при начале нов игры если есть сохраненная
// добавить фиксацию окончания игры
//

import SwiftUI

@main
struct FifteenApp: App {
    
    var viewModelNewGame = ViewModelNewGame()
//    var viewModelContinueGame = ViewModelContinueGame()
    var body: some Scene {
        WindowGroup {
//            ContentView(viewModel: viewModel)
            MainMenuView()
                .environmentObject(viewModelNewGame)
                .environmentObject(viewModelNewGame.viewModelContinueGame)
        }
    }
}
