//
//  ViewController.swift
//  stanfordioslesson1
//
//  Created by Dylan Rodriquez on 1/18/17.
//  Copyright © 2017 Dylan Rodriquez. All rights reserved.
//

import UIKit

// class inheriting from UIViewController
class ViewController: UIViewController {
    // Connecting display - a read only text - the Label Class
    // type UILabel!
    @IBOutlet private weak var display: UILabel!
    
    // all properties must have an initial value
    // 1. create an initializer
    // 2. initialize with a value upon declaration
    // however: optionals are always initialized to not set
    private var userIsCurrentlyTyping = false // do not need to define type
    
    // connecting button (action) to method
    // remember to change from any to UIButton
    // local function for button actions
    // func funcName(arg,arg:type) -> returnType{funcHere}
    @IBAction private func touchDigit(_ sender: UIButton) {
        // calling function
        // dotPhrase.tabbing autofills
        // self.nameOrPropertyToAccess
        // ~~~~~~~~~~~~~~~~~~EXAMPLE ~~~~~~~~~~~~~~~~~~~~~~
        // self.pressDigit(someDigit, otherArg: Int)
        // never type the type of first arg!!
        let digit = sender.currentTitle!
        if userIsCurrentlyTyping{
            let textCurrentlyInDisplay = display.text // currently getting text from display
            display.text = textCurrentlyInDisplay! + digit // + can concatenate strings in swift much like python
        }else{
            display.text = digit
        }
        userIsCurrentlyTyping = true
        
        // logic --> you are unable to append until you enter a digit. userIsCurrentlyTyping remains false. this does not allow you to append any digits in display. The only condition that is allowed is the "else" condition -> display.text = digit. Once completed userIsCurrentlyTyping == True
        
        print("pressed \(digit) digit")
        
        // dataType? == Optional with associated dataType
        // no title set, anything can be optional.
        // title is optional.
        // Swift infers type
        // incorrect style to identify Type
        // how do we get value? (!) -> gets associated value
        // why do we have optional instead of EmptyString
        // memory is hidden away and one way of determining this across
        // ALL dataTypes
        // if (NIL?)! -> will crash.
    }
    
    var displayValue: Double {
        get{
            return Double (display.text!)! // display.text! may not be convertable op op
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
        }
        displayValue = brain.result
    }
}

