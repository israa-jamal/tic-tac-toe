//
//  GameModel.swift
//  tic-tac-toe
//
//  Created by Esraa Gamal on 18/01/2022.
//

import Foundation

class TicTacToeController{
    
    var squares : [Square] = []
    var currentPlayer : SquareState
    var xScore : Int
    var oScore : Int
    lazy var possibleWinnings = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    init() {
        xScore = 0
        oScore = 0
        self.currentPlayer = .X
        for _ in 0...8 {
            squares.append(Square(.empty))
        }
    }
    
    func resetGame() {
        squares.removeAll()
        for _ in 0...8 {
            squares.append(Square(.empty))
        }
    }
    
    func playTurn(at index : Int) -> GameState {
        if squares[index].status == .empty {
            squares[index].status = currentPlayer
            currentPlayer = (currentPlayer == .X) ? .O : .X
            return checkMove()
        }
        return .onGoing
    }
    
    private func checkMove() -> GameState {
        for moves in possibleWinnings {
            let result = checkIndices(moves)
            if result != .onGoing {
                return result
            }
        }
        return .onGoing
    }
    
    private func checkIndices(_ indices : [Int]) -> GameState {
        var xCounter = 0
        var oCounter = 0
        
        indices.forEach { index in
            if squares[index].status == .O {
                oCounter += 1
            } else if squares[index].status == .X {
                xCounter += 1
            }
        }
        
        if xCounter == 3 {
            xScore += 1
            currentPlayer = .X
            return .XWin
        } else if oCounter == 3 {
            oScore += 1
            currentPlayer = .O
            return .OWin
        } else {
            return squares.allSatisfy({$0.status != .empty}) ? .gameOver : .onGoing
        }
    }
    
}
