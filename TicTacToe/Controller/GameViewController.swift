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
                    
                    square.image = xSymbol.image
                    square.tintColor = xSymbol.tintColor
                
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
                    
                    square.image = circleSymbol.image
                    square.tintColor = circleSymbol.tintColor
                    
                    game.startGame(at: index)
                    
                    print(game.gameArray)
                }
                
            }
            
            circleSymbol.center = circleSymbolPosition
        }
    }

}

/*
    MARK: TODOS!!
    - navigation to WinnerViewController/LoserViewController or exit to MainMenuController
    - make score unique for each player
    - simulate computer moves
    - make if-statements in my checkWinner much shorter
    - reset tic-tac-toe
    - something similar like Toast in android to announce winner or tie
*/
