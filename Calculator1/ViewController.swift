//
//  ViewController.swift
//  Calculator1
//
//  Created by Macbook Air on 11.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    var stillTyping = false
    var firstNum: Double = 0
    var secondNum: Double = 0
    var operation = 0
    var currentInput: Double {
        get {
            return Double(resultLabel.text!)!
        }
        set {
            resultLabel.text = "\(newValue)"
            stillTyping = false
        }
    }
    
    // Created the function for number buttons
    @IBAction func buttonNumber(_ sender: UIButton) {
        let number = sender.tag
        if stillTyping {
            resultLabel.text = resultLabel.text! + "\(number)"
        } else {
            resultLabel.text = "\(number)"
            stillTyping = true
        }
    }
    // Created the function for action button (plus, minus, definioton, multiply)
    @IBAction func actionButton(_ sender: UIButton) {
        operation = sender.tag
        firstNum = currentInput
        stillTyping = false
    }
    func actions(action: (Double, Double) -> Double) {
        currentInput = action(firstNum, secondNum)
        stillTyping = false
    }
    // Created the function for equal button
    @IBAction func equalButton(_ sender: UIButton) {
        if stillTyping {
            secondNum = currentInput
        }
        switch operation {
        case 10:
            actions {$0 + $1}
        case 11:
            actions {$0 - $1}
        case 12:
            actions {$0 * $1}
        case 13:
            actions {$0 / $1}
        default: break
        }
    }
    // Created the function for reset button. The equal button has sender.tag number 19
    @IBAction func resetButton(_ sender: UIButton) {
        if sender.tag == 19 && stillTyping == false {
            currentInput = 0
            resultLabel.text = "\(currentInput)"
            stillTyping = false
        }
    }
}
