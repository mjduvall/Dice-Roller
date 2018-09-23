//
//  ViewController.swift
//  DiceRoller
//
//  Created by Mandy Duvall on 9/23/18.
//  Copyright © 2018 Mandy Duvall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var diceSelectionLabel: UILabel!
    
    @IBAction func rollButton(_ sender: Any) {
        rollDice()
    }
    
    @IBAction func sliderChanged(_ slider: UISlider) {
        var diceType: String
        
        switch Int(slider.value) {
        case 1:
            diceType = "4"
        case 2:
            diceType = "6"
        case 3:
            diceType = "8"
        case 4:
            diceType = "10"
        case 5:
            diceType = "12"
        case 6:
            diceType = "20"
        default:
            diceType = "?"
        }
        
        diceSelectionLabel.text = diceType
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        diceSelectionLabel.text = "?"
    }
    
    func showErrorAlert() {
        let alert = UIAlertController(title: "Error", message: "Select a dice to continue", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    func showResultAlert(_ result: String) {
        let alert = UIAlertController(title: "You rolled a", message: "\(result)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome!", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }

    func rollDice() {
        let result: String
        
        switch diceSelectionLabel.text {
        case "?":
            showErrorAlert()
        default:
            result = calculateRoll(Int(diceSelectionLabel.text!)!)
            showResultAlert(result)
        }
    }
    
    func calculateRoll(_ maxValue: Int) -> String {
        let result = Int.random(in: 1...maxValue)
        return "\(result)"
    }
}

