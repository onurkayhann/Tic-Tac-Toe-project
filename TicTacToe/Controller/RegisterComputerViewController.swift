//
//  RegisterComputerViewController.swift
//  TicTacToe
//
//  Created by Onur Kayhan on 2024-09-16.
//

import UIKit

class RegisterComputerViewController: UIViewController {

    // Outlets
    @IBOutlet weak var playerOneTextField: UITextField!
    @IBOutlet weak var computerNameTextField: UITextField!
    
    var player: TicTacToe?
    
    var segueToComputerGame = "segueToComputerGame"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        computerNameTextField.text = "Computer"
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToComputerGame {
            guard let destinationVC = segue.destination as? ComputerViewController,
                  let playerOneName = playerOneTextField.text,
                  let computerName = computerNameTextField.text else { return }
            
            let playerOne = Player(username: playerOneName)
            let computer = Player(username: computerName)
            print(playerOne, computerName)
            
            destinationVC.playerOneName = playerOneName
            destinationVC.computerName = computerName
        }
        
    }
    
}
