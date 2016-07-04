//
//  OXGameController.swift
//  o_X
//
//  Created by Ira Quint on 6/29/16.
//  Copyright © 2016 iX. All rights reserved.
//

import Foundation

class OXGameController {
    
    static let sharedInstance = OXGameController()
    
    private init() {}
    
    private var currentGame = OXGame()
    
    func getCurrentGame() -> OXGame {
        return currentGame
    }
    
    func restartGame() {
        currentGame.reset()
    }
    
    func playMove(cellNum: Int) -> CellType {
        return currentGame.playMove(cellNum)
    }
    
    func getGames(onCompletion onCompletion: ([OXGame]?, String?) -> Void) {
        
        onCompletion([OXGame()], nil)
        
    }
    
}
    
    


