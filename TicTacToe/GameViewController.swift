//
//  ViewController.swift
//  TicTacToe
//
//  Created by Onur Kayhan on 2024-09-03.
//

import UIKit

class GameViewController: UIViewController {
    
    // Initial value for the Tic Tac Toe board
    var gameArray: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    // Outlet Collection - squares
    @IBOutlet var squares: [UIImageView]!
    
    // Outlets - symbols
    @IBOutlet weak var xSymbol: UIImageView!
    @IBOutlet weak var circleSymbol: UIImageView!
    
    // Outlets - scores
    @IBOutlet weak var playerOneScore: UILabel!
    @IBOutlet weak var playerTwoScore: UILabel!
    
    // Players
    let PLAYER_ONE = 1
    let PLAYER_TWO = 2
    
    var currentPlayer = true
    
    var xSymbolPosition: CGPoint = CGPoint.zero
    var circleSymbolPosition: CGPoint = CGPoint.zero
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        xSymbolPosition = xSymbol.center
        circleSymbolPosition = circleSymbol.center
        
        /*
        
        for (index, square) in squares.enumerated() {
            
            square.tag = index
            print("Square at index \(index): \(square.tag)")
            
        }
        
         */
        
        
        
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
                
                if squareFrameInSuperView.contains(xSymbolFrameInSuperView) && currentPlayer {
                    
                    square.image = xSymbol.image
                    square.tintColor = xSymbol.tintColor
                
                    startGame(at: index)
                    print(gameArray)
                    
            
                    
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
                
                if squareFrameInSuperView.contains(circleSymbolFrameInSuperView) && !currentPlayer {
                    
                    square.image = circleSymbol.image
                    square.tintColor = circleSymbol.tintColor
                    
                    startGame(at: index)
                    
                    print(gameArray)
                }
                
            }
            
            circleSymbol.center = circleSymbolPosition
        }
    }
    
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

