//
//  Model.swift
//  Fifteen
//
//  Created by ProstoKakTo on 26.06.2021.
//

import Foundation
 
struct Model {
//    var gameContent: [Cell] = []
    var gameField: [Field] = []
    var quantityMove: Int = 0
    
    init (newGamme content: [Int]) {
            for index in content {
                let cell = Cell(id: index)
                gameField.append(Field(id: index, content: cell))
            }
            if gameField[0].content.id == 0 {
                let temp = gameField.first
                gameField.remove(at: 0)
                gameField.append(temp!)
                gameField.shuffle()
                print("init")
                
            }
    }
    
    init (continue content: [Int], move: Int) {
            for index in content {
                let cell = Cell(id: index)
                gameField.append(Field(id: index, content: cell))
            }
        quantityMove = move
//            if gameField[0].content.id == 0 {
//                let temp = gameField.first
//                gameField.remove(at: 0)
//                gameField.append(temp!)
//                gameField.shuffle()
//                print("init")
//
//            }
    }
    
   
    
    
    
    mutating func shapes () {
        gameField.shuffle()
        quantityMove = 0
    }
    
    mutating func swipe (cell: Int) {
        
        switch cell {
        
        case 0 : if gameField[cell+1].content.id == 0 {
            right(cell:cell)
        } else if gameField[cell+4].content.id == 0 {
            down(cell: cell)
        }
        case 1...3 : if gameField[cell-1].content.id == 0 {
            left(cell:cell)
        }else if gameField[cell+1].content.id == 0 {
            if cell != 3 {
                right(cell:cell)
            }
        } else if gameField[cell+4].content.id == 0 {
            down(cell: cell)
        }
        case 4...11 : if gameField[cell-1].content.id == 0 {
            if cell != 4 && cell != 8 {
                left (cell: cell)
            }
        } else if gameField[cell+1].content.id == 0 {
            if cell != 3 && cell != 7 && cell != 12 && cell != 11 {
                right (cell:cell)
            }
        } else if gameField[cell+4].content.id == 0 {
            down (cell:cell)
        } else if gameField[cell-4].content.id == 0 {
            up (cell:cell)
        }
        case 12...14 : if gameField[cell-1].content.id == 0 {
            if cell != 12 {
                left (cell: cell)
            }
        } else if gameField[cell+1].content.id == 0 {
            if cell != 11 {
                right (cell:cell)
            }
        } else if gameField[cell-4].content.id == 0 {
            up (cell:cell)
        }
        default :
            if gameField[cell-1].content.id == 0 {
                if cell != 12  {
                    left (cell: cell)
                }
            }   else if gameField[cell-4].content.id == 0 {
                up (cell: cell)
            }
        }
    
        
        func right (cell: Int) {
            let temp = gameField[cell].content
            gameField[cell].content = gameField[cell+1].content
            gameField[cell+1].content = temp
            quantityMove += 1
        }
        
        func left (cell: Int) {
            let temp = gameField[cell].content
            gameField[cell].content = gameField[cell-1].content
            gameField[cell-1].content = temp
            quantityMove += 1
        }
        
        func up (cell: Int) {
            let temp = gameField[cell].content
            gameField[cell].content = gameField[cell-4].content
            gameField[cell-4].content = temp
            quantityMove += 1
        }
        
        func down (cell: Int) {
            let temp = gameField[cell].content
            gameField[cell].content = gameField[cell+4].content
            gameField[cell+4].content = temp
            quantityMove += 1
        }
        
        
        
            
    } // Swipe
    
    
    func examField() {
        
    }
    
    
    struct Cell: Identifiable {
        let id: Int
        var tap = false
//        var content: Int
    } // Cell
    
    struct Field: Identifiable {
        let id: Int
        var content: Cell
    }
    
    
    
}
