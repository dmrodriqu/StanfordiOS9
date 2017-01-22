//
//  ViewController.swift
//  stanfordioslesson1
//
//  Created by Dylan Rodriquez on 1/18/17.
//  Copyright © 2017 Dylan Rodriquez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var display: UILabel!
    
    private var userIsCurrentlyTyping = false
    
    // decimal is not typed, true if typed, similar to userIsCurrentlyTyping
    private var decimalHasNotBeenTyped = true
    
    @IBOutlet weak var Decimal: UIButton!
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        let decimalIsThere = display.text!.range(of: ".") != nil
        if decimalIsThere {
            Decimal.isEnabled = false
        }
        if userIsCurrentlyTyping{
            let textCurrentlyInDisplay = display.text
            display.text = textCurrentlyInDisplay! + digit
        }
        else{
            display.text = digit
            Decimal.isEnabled = true
        }
        userIsCurrentlyTyping = true
        print("pressed \(digit) digit")
    }
    
    var displayValue: Double {
        get{
            return Double (display.text!)! 
        }
        set{
            display.text = String(newValue)
        }
    }
    private var brain: CalculatorBrain = CalculatorBrain()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsCurrentlyTyping{
            brain.setOperand(operand: displayValue)
        }
        userIsCurrentlyTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(symbol: mathematicalSymbol)
            Decimal.isEnabled = true
        }
        displayValue = brain.result
    }
}

