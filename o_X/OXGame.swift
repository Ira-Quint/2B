//
//  OXGame.swift
//  o_X
//
//  Created by Ira Quint on 6/29/16.
//  Copyright © 2016 iX. All rights reserved.
//

import Foundation

enum CellType: String {
    case O = "O"
    case X = "X"
    case Empty = ""

}

enum OXGameState {
    case InProgress
    case Tie
    case Won
}

class OXGame{
    
    var startingTurn: CellType = CellType.X
    
    private var board = [CellType](count: 9, repeatedValue: CellType.Empty)
    
    private var startType = CellType.X
    
    var turnCounter: Int = 0
    
    func turnCount() -> Int {
        return turnCounter
    }
    
    func whoseTurn() -> CellType {
        if (turnCount() % 2) == 0 {
            turnCounter += 1
            return CellType.X
        }
        else {
            turnCounter += 1
            return CellType.O
        }
    }
    
    func playMove(cellNum: Int) -> CellType {
        board[cellNum] = self.whoseTurn()
        return board[cellNum]
        
    }
    
    func gameWon() -> Bool {
        return  (board[0]==board[1] && board[1]==board[2] && board[2] != CellType.Empty) ||
                (board[3]==board[4] && board[4]==board[5] && board[5] != CellType.Empty) ||
                (board[6]==board[7] && board[7]==board[8] && board[8] != CellType.Empty) ||
                (board[0]==board[3] && board[3]==board[6] && board[6] != CellType.Empty) ||
                (board[1]==board[4] && board[4]==board[7] && board[7] != CellType.Empty) ||
                (board[2]==board[5] && board[5]==board[8] && board[8] != CellType.Empty) ||
                (board[6]==board[4] && board[4]==board[2] && board[2] != CellType.Empty) ||
                (board[0]==board[4] && board[4]==board[8] && board[8] != CellType.Empty)
    }
    
    func state() -> OXGameState {
        if gameWon() {
            return OXGameState.Won
        }
        else if turnCount() >= 9 {
            return OXGameState.Tie
        }
        else {
            return OXGameState.InProgress
        }
    }
    
    func reset() -> Void {
        board = [CellType](count: 9, repeatedValue: CellType.Empty)
        turnCounter = 0
        }
    }