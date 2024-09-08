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
            
            gameArray[index] = currentPlayer ? PLAYER_ONE : PLAYER_TWO
            
            currentPlayer.toggle()
            
        }
        
        checkWinner()
    }
    
    
    func checkWinner() {
        
        // Possibilites for player one to win horizontally:
        if (gameArray[0] == PLAYER_ONE && gameArray[1] == PLAYER_ONE && gameArray[2] == PLAYER_ONE) {
            print("Player one wins by horizontal combination in horizontal row 1")
            resetGame()
        }
        
        if (gameArray[3] == PLAYER_ONE && gameArray[4] == PLAYER_ONE && gameArray[5] == PLAYER_ONE) {
            print("Player one wins by horizontal combination in horizontal row 2")
            resetGame()
        }
        
        if (gameArray[6] == PLAYER_ONE && gameArray[7] == PLAYER_ONE && gameArray[8] == PLAYER_ONE) {
            print("Player one wins by horizontal combination in horizontal row 3")
            resetGame()
        }
        
        // Possibilites for player one to win vertically:
        if (gameArray[0] == PLAYER_ONE && gameArray[3] == PLAYER_ONE && gameArray[6] == PLAYER_ONE) {
            print("Player one wins by vertical combination in row 1")
            resetGame()
        }
        
        if (gameArray[1] == PLAYER_ONE && gameArray[4] == PLAYER_ONE && gameArray[7] == PLAYER_ONE) {
            print("Player one wins by vertical combination in row 2")
            resetGame()
        }
        
        if (gameArray[2] == PLAYER_ONE && gameArray[5] == PLAYER_ONE && gameArray[8] == PLAYER_ONE) {
            print("Player one wins by vertical combination in row 3")
            resetGame()
        }
        
        // Possibilites for player one to win dioganally:
        
        if (gameArray[0] == PLAYER_ONE && gameArray[4] == PLAYER_ONE && gameArray[8] == PLAYER_ONE) {
            print("Player one wins by dioganal combination")
            resetGame()
        }
        
        if (gameArray[2] == PLAYER_ONE && gameArray[4] == PLAYER_ONE && gameArray[6] == PLAYER_ONE) {
            print("Player one wins by dioganal combination")
            resetGame()
        }
        
        
        // Possibilites for player two to win horizontally:
        if (gameArray[0] == PLAYER_TWO && gameArray[1] == PLAYER_TWO && gameArray[2] == PLAYER_TWO) {
            print("Player two wins by horizontal combination in horizontal row 1")
            resetGame()
        }
        
        if (gameArray[3] == PLAYER_TWO && gameArray[4] == PLAYER_TWO && gameArray[5] == PLAYER_TWO) {
            print("Player two wins by horizontal combination in horizontal row 2")
            resetGame()
        }
        
        if (gameArray[6] == PLAYER_TWO && gameArray[7] == PLAYER_TWO && gameArray[8] == PLAYER_TWO) {
            print("Player two wins by horizontal combination in horizontal row 3")
            resetGame()
        }
        
        // Possibilites for player two to win vertically:
        if (gameArray[0] == PLAYER_TWO && gameArray[3] == PLAYER_TWO && gameArray[6] == PLAYER_TWO) {
            print("Player two wins by vertical combination in row 1")
            resetGame()
        }
        
        if (gameArray[1] == PLAYER_TWO && gameArray[4] == PLAYER_TWO && gameArray[7] == PLAYER_TWO) {
            print("Player two wins by vertical combination in row 2")
            resetGame()
        }
        
        if (gameArray[2] == PLAYER_TWO && gameArray[5] == PLAYER_TWO && gameArray[8] == PLAYER_TWO) {
            print("Player two wins by vertical combination in row 3")
            resetGame()
        }
        
        // Possibilites for player two to win dioganally:
        
        if (gameArray[0] == PLAYER_TWO && gameArray[4] == PLAYER_TWO && gameArray[8] == PLAYER_TWO) {
            print("Player two wins by dioganal combination")
            resetGame()
        }
        
        if (gameArray[2] == PLAYER_TWO && gameArray[4] == PLAYER_TWO && gameArray[6] == PLAYER_TWO) {
            print("Player two wins by dioganal combination")
            resetGame()
        }
        
        if (!gameArray.contains(0)) {
            print("It's a tie!")
            resetGame()
        }
        
        
    }
    
    func resetGame() {
        gameArray = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    }
    
    
    
}
