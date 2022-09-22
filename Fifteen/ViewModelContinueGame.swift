//
//  ViewModelContinueGame.swift
//  Fifteen
//
//  Created by NikitaSergeevich on 21/09/2022.
//

import SwiftUI

class ViewModelContinueGame: ObservableObject {
    
//    static var number: [Int] = []
    static var initModel: Model = Model(continue: [Int](), move: 0)
    
   
    
// MARK: - Create Game
    private static func createGame()->Model   {
        
        var number: [Int] {
            
            if let content = UserDefaults.standard.object(forKey: "content") as? [Int] {
                return content
            } else {
                return [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
            }
            
            
        }
        
        var move: Int {
            
            if let move = UserDefaults.standard.object(forKey: "quantityMove") as? Int {
                return move
            } else {
                return 0
            }
            
        }
        
        initModel = Model(continue: number, move: move)
        print("continueGame", number)
        
        return initModel
    }
    
    
    func saveGameCount() -> Bool{
        if UserDefaults.standard.array(forKey: "content") != nil {
            return true
        } else {
            return false
        }
    }
    
    func updateModel(num: [Int], move: Int) {
        model = Model(continue: num, move: move)
    }
    
    
    
    @Published var model: Model = createGame()
    
    
    func saveGame() {
        var content: [Int] = []
        print("USE saveGame")
        for item in model.gameField {
            content.append(item.content.id)
        }
        
//        ViewModelContinueGame.number = content
    
        
//        UserDefaults.standard.array(forKey: "content") = content
        UserDefaults.standard.set(content, forKey: "content")
        UserDefaults.standard.set(model.quantityMove, forKey: "quantityMove")
        
        print(content)
    }

    
// MARK: - Intent
    func swipe (number: Int) {
        model.swipe(cell: number)
//        print("swipe", model.gameField)
//        model.swipe(cell: cell, side: side)
    }
    
    
    
    func shape () {
        model.shapes()
    }
    
}
