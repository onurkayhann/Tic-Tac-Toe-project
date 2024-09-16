//
//  RegisterPlayerViewController.swift
//  TicTacToe
//
//  Created by Onur Kayhan on 2024-09-12.
//

import UIKit

class RegisterPlayerViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var playerOneTextField: UITextField!
    @IBOutlet weak var playerTwoTextField: UITextField!
    
    var player: TicTacToe?
    
    var segueToGame = "segueToGame"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToGame {
            guard let destinationVC = segue.destination as? GameViewController,
                  let playerOneName = playerOneTextField.text,
                  let playerTwoName = playerTwoTextField.text else { return }
            
            let playerOne = Player(username: playerOneName)
            let playerTwo = Player(username: playerTwoName)
            print(playerOne, playerTwo)
            
            destinationVC.playerOneName = playerOneName
            destinationVC.playerTwoName = playerTwoName
        }
        
    }
    
}
