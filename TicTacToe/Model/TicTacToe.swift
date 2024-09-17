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
        
        return checkWinner(gameArray: gameArray, winCombinations: winCombinations)
    }
    
    /** function that loops throguh gameArray and winCombinations and decides winner or tie */
    func checkWinner(gameArray: [Int], winCombinations: [[Int]]) -> Bool? {
        
        for winCombination in winCombinations {
            let checkWin = winCombination.map { gameArray[$0] }
            if checkWin.allSatisfy({ $0 == PLAYER_ONE }) {
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
            return true
        }
        
        return false
    }
        
    func resetGame() {
        gameArray = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    }
}
