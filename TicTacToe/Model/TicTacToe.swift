//
//  TicTacToe.swift
//  TicTacToe
//
//  Created by Onur Kayhan on 2024-09-07.
//

import Foundation

class TicTacToe {
        
    private var players: [Player] = []
    
    func addPlayer(player: Player) {
        players.append(player)
        print("Player added: \(player.username)")
        print("Current players: \(players.map { $0.username })")
    }

        
    // Array for game
    var gameArray: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    // Winner combinations in 2D array
    var winCombinations = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6],
    ]
    
    // Players
    var PLAYER_ONE = 1
    var PLAYER_TWO = 2
    
    // Player state
    var currentPlayer = true
    
    var isAgainstComputer = false
    
    // Closure
    var onGameOver: ((String) -> Void)?
    
    func startGame(at index: Int) -> Bool? {
        
        if gameArray[index] == 0 {
            
            gameArray[index] = currentPlayer ? PLAYER_ONE : PLAYER_TWO
            
            currentPlayer.toggle()
                        
            
        }
        
        return checkWinner(gameArray: gameArray, combinations: winCombinations)
    }
    
    func checkWinner(gameArray: [Int], combinations: [[Int]]) -> Bool?{
        
        for combination in combinations {
            print(combination)
            let checkWin = combination.map { gameArray[$0] }
            print(checkWin)
            if checkWin.allSatisfy({ $0 == 1 }) {
                onGameOver?("Player 1 wins")
                return true
            } else if checkWin.allSatisfy({ $0 == PLAYER_TWO }) {
                let winner = isAgainstComputer ? "Computer wins" : "Player 2 wins"
                onGameOver?(winner)
                return true
            }
        }
        
        if (!gameArray.contains(0)) {
            onGameOver?("It's a tie")
            return false
        }
        return false
    }
        
    func resetGame() {
        gameArray = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    }
}


/*
 - mayb remove ? from onGameOver as well
 - dictionary for username and highscore to print it in the highscore page
 */
