//
//  TicTacToe.swift
//  TicTacToe
//
//  Created by Onur Kayhan on 2024-09-07.
//

import Foundation

class TicTacToe {
    
    // Array for game
    var gameArray: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    // Players
    var PLAYER_ONE = 1
    var PLAYER_TWO = 2
    
    // Player state
    var currentPlayer = true
    
    
    func startGame(at index: Int) {
        
        if gameArray[index] == 0 {
            
            if currentPlayer {
                gameArray[index] = PLAYER_ONE
                
            } else {
                gameArray[index] = PLAYER_TWO
            }
            
            currentPlayer.toggle()
            
        }
        
    }
}
