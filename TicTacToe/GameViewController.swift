//
//  ViewController.swift
//  TicTacToe
//
//  Created by Onur Kayhan on 2024-09-03.
//

import UIKit

class GameViewController: UIViewController {
    
    // Initial value for the Tic Tac Toe board
    var ticTacToe: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    // Players
    let PLAYER_ONE = 1
    let PLAYER_TWO = 2
    
    // Outlet Collection - squares
    @IBOutlet var squares: [UIImageView]!
    
    // Outlets - symbols
    @IBOutlet weak var xSymbol: UIImageView!
    @IBOutlet weak var circleSymbol: UIImageView!
    
    // Outlets - scores
    @IBOutlet weak var playerOneScore: UILabel!
    @IBOutlet weak var playerTwoScore: UILabel!
    
    var xSymbolPosition: CGPoint = CGPoint.zero
    var circleSymbolPosition: CGPoint = CGPoint.zero
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        xSymbolPosition = xSymbol.center
        circleSymbolPosition = circleSymbol.center
        
        // Try to make this code in function later
        for _ in 0..<5 {
                let newXSymbol = UIImageView(image: xSymbol.image)
                newXSymbol.frame = xSymbol.frame
                newXSymbol.contentMode = .scaleAspectFit
                newXSymbol.isHidden = false
            newXSymbol.tintColor = .systemBlue
                view.addSubview(newXSymbol)
            }
        
        for _ in 0..<5 {
                let newCircleSymbol = UIImageView(image: circleSymbol.image)
            newCircleSymbol.frame = circleSymbol.frame
            newCircleSymbol.contentMode = .scaleAspectFit
            newCircleSymbol.isHidden = false
            newCircleSymbol.tintColor = .systemRed
                view.addSubview(newCircleSymbol)
            }
        
        
    }
    
    func createMultipleSymbols(originalSymbol: UIImageView, count: Int, color: UIColor) {
        for _ in 0..<count {
            let newSymbol = UIImageView(image: originalSymbol.image)
            newSymbol.frame = originalSymbol.frame
            newSymbol.contentMode = .scaleAspectFit
            newSymbol.isUserInteractionEnabled = true
            newSymbol.tintColor = color
            newSymbol.isHidden = false
            view.addSubview(newSymbol)
        }
    }
    
    
    // Actions
    @IBAction func onDragX(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: self.view)
        
        xSymbol.center = CGPoint(x: xSymbol.center.x + translation.x, y: xSymbol.center.y + translation.y)
        
        sender.setTranslation(CGPoint.zero, in: self.view)
        
    }
    
    
    
    @IBAction func onDragCircle(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: self.view)
        
        circleSymbol.center = CGPoint(x: circleSymbol.center.x + translation.x, y: circleSymbol.center.y + translation.y)
        
        sender.setTranslation(CGPoint.zero, in: self.view)
        
        
    }
    

}

