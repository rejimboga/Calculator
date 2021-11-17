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
    var dotIsSetted = false
    var firstNum: Double = 0
    var secondNum: Double = 0
    var operation: OperationType?
    var currentInput: Double {
        get {
            return Double(resultLabel.text!)!
        }
        set {
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            if valueArray [1] == "0" {
                resultLabel.text = "\(valueArray [0])"
            } else {
                resultLabel.text = "\(value)"
            }
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
    // Created the function for action button (plus, minus, division, multiply)
    @IBAction func actionButton(_ sender: UIButton) {
        operation = OperationType(rawValue: sender.tag)
        firstNum = currentInput
        stillTyping = false
        dotIsSetted = false
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
        
        dotIsSetted = false
        
        switch operation {
        case .plus:
            actions {$0 + $1}
        case .minus:
            actions {$0 - $1}
        case .multiply:
            actions {$0 * $1}
        case .definioton:
            actions {$0 / $1}
        default: break
        }
    }
    // Created the function for reset button. The equal button has sender.tag number 19
    @IBAction func resetButton(_ sender: UIButton) {
        if sender.tag == 19 && stillTyping == false {
            firstNum = 0
            secondNum = 0
            currentInput = 0
            resultLabel.text = "0"
            stillTyping = false
            dotIsSetted = false
        }
    }
    // Created the function for button which changes a sign
    @IBAction func plusMinusButton(_ sender: UIButton) {
        currentInput = -currentInput
    }
    // Created the function for percent button
    @IBAction func percentButton(_ sender: UIButton) {
        secondNum = firstNum * currentInput / 100
        stillTyping = false
    }
    // Created the function for square button
    @IBAction func squareButton(_ sender: UIButton) {
        currentInput = sqrt(currentInput)
        stillTyping = false
    }
    // Created the function to set a number with type Double
    @IBAction func pointButton(_ sender: UIButton) {
        if stillTyping == true && dotIsSetted == false {
            resultLabel.text = resultLabel.text! + "."
            dotIsSetted = true
        } else if stillTyping == false && dotIsSetted == false {
            resultLabel.text = "0."
            stillTyping = true
            dotIsSetted = true
        }
    }
}
