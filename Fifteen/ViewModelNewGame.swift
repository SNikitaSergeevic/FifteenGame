//
//  ViewModel.swift
//  Fifteen
//
//  Created by ProstoKakTo on 26.06.2021.
//

import SwiftUI
import Foundation

class ViewModelNewGame: ObservableObject {
    
    private static let number = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
    
    var viewModelContinueGame = ViewModelContinueGame()
    func viewModelForContinueGame() -> ViewModelContinueGame {
        viewModelContinueGame
    }
    
    
// MARK: - Create Game
    private static func createGame()->Model   {
        let model = Model(newGamme: number)
        return model
    }
    
    
    
    func saveGameCount() -> Bool{
        if UserDefaults.standard.array(forKey: "content") != nil {
            return true
        } else {
            return false
        }
    }
    
    func saveGame() {
        var content: [Int] = []
        let quantityMove: Int = model.quantityMove
        print("USE saveGame")
        for item in model.gameField {
            content.append(item.content.id)
        }
        viewModelContinueGame.updateModel(num: content, move: quantityMove)
        UserDefaults.standard.set(content, forKey: "content")
        UserDefaults.standard.set(quantityMove, forKey: "quantityMove")
        print(content)
    }
    
    
    
    
    @Published var model: Model = createGame()

    
// MARK: - Intent
    func swipe (number: Int) {
        model.swipe(cell: number)
//        print("swipe", model.gameField)
//        model.swipe(cell: cell, side: side)
    }
    
    
    
    func shape () {
        model.shapes()
    }
    
    
} // ViewModel
