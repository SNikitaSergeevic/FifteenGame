//
//  ViewModel.swift
//  Fifteen
//
//  Created by ProstoKakTo on 26.06.2021.
//

import SwiftUI

class ViewModel: ObservableObject {
    
    private static let number = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
    
// MARK: - Create Game
    private static func createGame()->Model   {
        Model(content: number)
    }
    
    func resetForNewGame() {
        
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
