//
//  ComputerViewController.swift
//  TicTacToe
//
//  Created by Onur Kayhan on 2024-09-16.
//

import UIKit

class ComputerViewController: UIViewController {
    
    // Outlet Collection - squares
    @IBOutlet var squares: [UIImageView]!
    
    // Player labels
    @IBOutlet weak var playerOneLabel: UILabel!
    @IBOutlet weak var playerTwoLabel: UILabel!
    
    var playerOneName: String?
    var computerName: String?
    
    // Outlets - symbols
    @IBOutlet weak var xSymbol: UIImageView!
    @IBOutlet weak var circleSymbol: UIImageView!
    
    // Outlets - scores
    @IBOutlet weak var playerOneScore: UILabel!
    @IBOutlet weak var playerTwoScore: UILabel!
    
    var valuePlayerOne = 0
    var valuePlayerTwo = 0
    
    // Instance of the game logic
    var game = TicTacToe()
    
    var xSymbolPosition: CGPoint = CGPoint.zero
    var circleSymbolPosition: CGPoint = CGPoint.zero
    
    // Navigation variable
    var segueToMainMenu = "segueToMainMenu"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        xSymbolPosition = xSymbol.center
        circleSymbolPosition = circleSymbol.center
        
        playerOneLabel.text = playerOneName ?? "Player 1"
        playerTwoLabel.text = computerName ?? "Computer"
        
        highlightPlayerTurn()
        
        game.onGameOver = { [weak self] resultMessage in
            self?.gameMessage(message: resultMessage)
        }
    }
    
    func gameMessage(message: String) {
        // Create the alert
        let alert = UIAlertController(title: "Game Over", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Play Again", style: .default, handler: { action in
            self.resetBoard()
            self.highlightPlayerTurn()
        }))
        
        alert.addAction(UIAlertAction(title: "Main Menu", style: .default, handler: { action in
            self.performSegue(withIdentifier: self.segueToMainMenu, sender: self)
        }))
        
        self.present(alert, animated: true, completion: nil)
        
        if message.contains("Player 1 wins") {
            valuePlayerOne += 1
            playerOneScore.text = "Score: \(valuePlayerOne)"
        } else if message.contains("Player 2 wins") {
            valuePlayerTwo += 1
            playerTwoScore.text = "Score: \(valuePlayerTwo)"
        }
    }
    
    // Actions
    @IBAction func onDragX(_ sender: UIPanGestureRecognizer) {
        onDragSymbol(sender, symbol: xSymbol, systemName: "xmark", originalPosition: xSymbolPosition, opponentSymbolImage: circleSymbol.image, currentPlayer: true)
    }
    
    /**
     reusable function to minimize the code, so that instead of having bunch of codes for X and Circle, they can use this function instead
     */
    func onDragSymbol(_ sender: UIPanGestureRecognizer, symbol: UIImageView, systemName: String, originalPosition: CGPoint, opponentSymbolImage: UIImage?, currentPlayer: Bool) {
        let translation = sender.translation(in: self.view)
        
        symbol.center = CGPoint(x: symbol.center.x + translation.x, y: symbol.center.y + translation.y)
        
        sender.setTranslation(CGPoint.zero, in: self.view)
        
        if sender.state == .ended {
            
            for (index, square) in squares.enumerated() {
                
                let squareFrameInSuperView = square.convert(square.bounds, to: self.view)
                let symbolFrameInSuperView = symbol.convert(symbol.bounds, to: self.view)
                
                if squareFrameInSuperView.contains(symbolFrameInSuperView) && square.image != opponentSymbolImage && game.currentPlayer == currentPlayer {
                    square.image = UIImage(systemName: systemName)
                    square.tintColor = (systemName == "xmark") ? UIColor.greenCustom : UIColor.grayCustom
                    
                    game.startGame(at: index)
                    highlightPlayerTurn()
                    print(game.gameArray)
                    
                    game.currentPlayer = false
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                        self.onDragComputer()
                    }
                }
            }
            
            symbol.center = originalPosition
        }
    }
    
    func onDragComputer() {
        
        print("Computer's turn")
        
        let emptySquares = squares.filter { $0.image == UIImage(systemName: "square") }
        
        if let computerChoice = emptySquares.randomElement(), let index = squares.firstIndex(of: computerChoice) {
            
            computerChoice.image = UIImage(systemName: "circle")
            computerChoice.tintColor = UIColor.grayCustom
            
            game.currentPlayer = false
            
            game.startGame(at: index)
            
            highlightPlayerTurn()
            
            game.currentPlayer = true
            
            print(game.gameArray)
        }
    }
    
    /**
     Function to reset board to its default value --> squares
     */
    func resetBoard() {
        
        for square in squares {
            
            square.image = UIImage(systemName: "square")
            square.tintColor = .black
            
        }
        
        game.resetGame()
        print(game.gameArray)
        game.currentPlayer = true
        
    }
    
    /**
     This function will outgray the disabled player, for the view purpose. This function will also highlight current player by blinking animation
     */
    func highlightPlayerTurn() {
        // Adding the delay before executing the main logic
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            
            if self.game.currentPlayer {
                // Player One's turn
                self.circleSymbol.tintColor = UIColor.systemGray3
                self.xSymbol.tintColor = UIColor.greenCustom
                
                self.playerTwoLabel.textColor = UIColor.systemGray3
                self.playerOneLabel.textColor = UIColor.greenCustom
                
                self.playerOneLabel.alpha = 1
                self.playerTwoLabel.alpha = 1
                
                self.playerOneLabel.layer.removeAllAnimations()
                self.playerTwoLabel.layer.removeAllAnimations()
                
                UIView.animate(withDuration: 0.6,
                               delay: 0.0,
                               options: [.repeat, .autoreverse],
                               animations: {
                    self.playerOneLabel.alpha = 0
                }, completion: nil)
                
            } else {
                
                // Player Two's turn
                self.xSymbol.tintColor = UIColor.systemGray3
                self.circleSymbol.tintColor = UIColor.grayCustom
                
                self.playerTwoLabel.textColor = UIColor.grayCustom
                self.playerOneLabel.textColor = UIColor.systemGray3
                
                self.playerOneLabel.alpha = 1
                self.playerTwoLabel.alpha = 1
                
                self.playerOneLabel.layer.removeAllAnimations()
                self.playerTwoLabel.layer.removeAllAnimations()
                
                UIView.animate(withDuration: 0.6,
                               delay: 0.0,
                               options: [.repeat, .autoreverse],
                               animations: {
                    self.playerTwoLabel.alpha = 0
                }, completion: nil)
            }
        }
    }
}
