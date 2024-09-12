//
//  ViewController.swift
//  TicTacToe
//
//  Created by Onur Kayhan on 2024-09-03.
//

import UIKit

class GameViewController: UIViewController {
    
    // Outlet Collection - squares
    @IBOutlet var squares: [UIImageView]!
    
    // Player labels
    @IBOutlet weak var playerOneLabel: UILabel!
    @IBOutlet weak var playerTwoLabel: UILabel!
    
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
    
    // Navigation variables
    var segueToMainMenu = "segueToMainMenu"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        xSymbolPosition = xSymbol.center
        circleSymbolPosition = circleSymbol.center
                
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
        
        let translation = sender.translation(in: self.view)
        
        xSymbol.center = CGPoint(x: translation.x + xSymbol.center.x, y: translation.y + xSymbol.center.y)
        
        sender.setTranslation(CGPoint.zero, in: self.view)
        
        if sender.state == .ended {
                        
            for (index, square) in squares.enumerated() {
                
                let squareFrameInSuperView = square.convert(square.bounds, to: self.view)
                let xSymbolFrameInSuperView = xSymbol.convert(xSymbol.bounds, to: self.view)
                
                
                if squareFrameInSuperView.contains(xSymbolFrameInSuperView) && game.currentPlayer && square.image != circleSymbol.image {
                    square.image = UIImage(systemName: "xmark")
                    square.tintColor = UIColor.systemIndigo
                                        
                    game.startGame(at: index)
                    highlightPlayerTurn()
                    print(game.gameArray)
                    
                }
                
                                
            }
            
            xSymbol.center = xSymbolPosition
            
        }
        
        
    }
    
    
    
    @IBAction func onDragCircle(_ sender: UIPanGestureRecognizer) {
        
        
        let translation = sender.translation(in: self.view)
        
        circleSymbol.center = CGPoint(x: circleSymbol.center.x + translation.x, y: circleSymbol.center.y + translation.y)
        
        sender.setTranslation(CGPoint.zero, in: self.view)
                
        
        if sender.state == .ended {
                        
            for (index, square) in squares.enumerated() {
                
                
                let squareFrameInSuperView = square.convert(square.bounds, to: self.view)
                let circleSymbolFrameInSuperView = circleSymbol.convert(circleSymbol.bounds, to: self.view)
                
                
                if squareFrameInSuperView.contains(circleSymbolFrameInSuperView) && !game.currentPlayer && square.image != xSymbol.image {

                    square.image = UIImage(systemName: "circle")
                    square.tintColor = UIColor.systemOrange
                    
                    game.startGame(at: index)
                    highlightPlayerTurn()
                    print(game.gameArray)
                    
                }
                

            }
            
            circleSymbol.center = circleSymbolPosition
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
                self.xSymbol.tintColor = UIColor.systemIndigo
                
                self.playerTwoLabel.textColor = UIColor.systemGray3
                self.playerOneLabel.textColor = UIColor.systemIndigo
                
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
                self.circleSymbol.tintColor = UIColor.systemOrange
                
                self.playerTwoLabel.textColor = UIColor.systemOrange
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

/*
 MARK: TODOS!!
 - navigation to WinnerViewController/LoserViewController or exit to MainMenuController
 - make score unique for each player
 - simulate computer moves
 - make onDragCircle and onDragX to a reusabel function
 - try to remove weak self, remove ? from self.
 */
