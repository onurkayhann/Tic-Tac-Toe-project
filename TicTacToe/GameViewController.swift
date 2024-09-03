//
//  ViewController.swift
//  TicTacToe
//
//  Created by Onur Kayhan on 2024-09-03.
//

import UIKit

class GameViewController: UIViewController {
    
    // Players
    let PLAYER_ONE = 1
    let PLAYER_TWO = 2
    
    // Outlets - squares
    @IBOutlet weak var squareOne: UIImageView!
    @IBOutlet weak var squareTwo: UILabel!
    @IBOutlet weak var squareThree: UIImageView!
    @IBOutlet weak var squareFour: UIImageView!
    @IBOutlet weak var squareFive: UILabel!
    @IBOutlet weak var squareSix: UIImageView!
    @IBOutlet weak var squareSeven: UIImageView!
    @IBOutlet weak var squareEight: UILabel!
    @IBOutlet weak var squareNine: UIImageView!
    
    // Outlets - symbols
    @IBOutlet weak var xSymbol: UIImageView!
    @IBOutlet weak var circleSymbol: UIImageView!
    
    // Outlets - scores
    @IBOutlet weak var playerOneScore: UILabel!
    @IBOutlet weak var playerTwoScore: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

