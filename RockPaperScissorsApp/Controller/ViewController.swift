//
//  ViewController.swift
//  RockPaperScissorsApp
//
//  Created by Salvador Garcia on 1/13/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var opponentSignLabel: UILabel!
    @IBOutlet var statusOfGameLabel: UILabel!
    @IBOutlet var rockButton: UIButton!
    @IBOutlet var paperButton: UIButton!
    @IBOutlet var scissorsButton: UIButton!
    @IBOutlet var playAgainButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(gameStateOfTheGame: .start)
        
    }

    @IBAction func rockButtonPressed(_ sender: UIButton) {
        let mySign = Sign.rock
        paperButton.isHidden = true
        scissorsButton.isHidden = true
        playGame(mySign: mySign)
    }
    
    @IBAction func paperButtonPressed(_ sender: UIButton) {
        let mySign = Sign.paper
        rockButton.isHidden = true
        scissorsButton.isHidden = true
        playGame(mySign: mySign)
    }
    
    @IBAction func scissorsButtonPressed(_ sender: UIButton) {
        let mySign = Sign.scissors
        paperButton.isHidden = true
        rockButton.isHidden = true
        playGame(mySign: mySign)
    }
    
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        updateUI(gameStateOfTheGame: .start)
    }
    
    func updateUI(gameStateOfTheGame: GameState){
            switch gameStateOfTheGame {
            case .start:
                view.backgroundColor = UIColor.blue
                opponentSignLabel.text = "🤖"
                playAgainButton.isHidden =  true
                rockButton.isHidden = false
                paperButton.isHidden = false
                scissorsButton.isHidden = false
                rockButton.isEnabled = true
                paperButton.isEnabled = true
                scissorsButton.isEnabled = true
                statusOfGameLabel.text = "Start!"
            case .win:
                view.backgroundColor = UIColor.green
                statusOfGameLabel.text = "You Won!"
                playAgainButton.isHidden = false
            case .lose:
                view.backgroundColor = UIColor.systemPink
                statusOfGameLabel.text = "You Lost!"
                playAgainButton.isHidden = false
            case .draw:
                view.backgroundColor = UIColor.orange
                statusOfGameLabel.text = "It's a Tie!"
                playAgainButton.isHidden = false
            }

    }
    
    func playGame(mySign: Sign){
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        let opponentSign = randomSign()
        let gameState = mySign.compareSign(opponentSign: opponentSign)
        opponentSignLabel.text = opponentSign.emoji
        updateUI(gameStateOfTheGame: gameState)

    }
}

