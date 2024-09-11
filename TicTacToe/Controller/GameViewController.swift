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
    
    // Outlets - symbols
    @IBOutlet weak var xSymbol: UIImageView!
    @IBOutlet weak var circleSymbol: UIImageView!
    
    // Outlets - scores
    @IBOutlet weak var playerOneScore: UILabel!
    @IBOutlet weak var playerTwoScore: UILabel!
    
    // Instance of the game logic
    var game = TicTacToe()
    
    
    var xSymbolPosition: CGPoint = CGPoint.zero
    var circleSymbolPosition: CGPoint = CGPoint.zero
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        xSymbolPosition = xSymbol.center
        circleSymbolPosition = circleSymbol.center
        
        game.onGameOver = { [weak self] resultMessage in
            self?.gameMessage(message: resultMessage)
        }
        
        
    }
    
    func gameMessage(message: String) {
        let alert = UIAlertController(title: "Game Over", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        resetBoard()
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
                    
                    print(game.gameArray)
                    
                    
                }
                
                
            }
            
            circleSymbol.center = circleSymbolPosition
            
            
        }
        
    }
    
    func resetBoard() {
        
        for square in squares {
            
            square.image = UIImage(systemName: "square")
            square.tintColor = .black
            
        }
        
        game.resetGame()
        
    }
    
    
    
}

/*
 MARK: TODOS!!
 - navigation to WinnerViewController/LoserViewController or exit to MainMenuController
 - make score unique for each player
 - simulate computer moves
 - make if-statements in my checkWinner much shorter
 */


/*
 let something = {(name:String) -> Int in
    print(name)
    return 1
 }
 */
