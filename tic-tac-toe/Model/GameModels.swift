//
//  Models.swift
//  tic-tac-toe
//
//  Created by Esraa Gamal on 18/01/2022.
//

import Foundation

enum SquareState : String{
    case X = "x"
    case O = "o"
    case empty = ""
}

enum GameState : String{
    case XWin = "X Win"
    case OWin = "O Win"
    case gameOver = "Even"
    case onGoing = ""
}

struct Square {
    var status : SquareState
    
    init(_ status : SquareState) {
        self.status = status
    }
}
