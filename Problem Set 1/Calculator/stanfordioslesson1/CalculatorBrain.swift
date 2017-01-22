//
//  CalculatorBrain.swift
//  stanfordioslesson1
//
//  Created by Dylan Rodriquez on 1/20/17.
//  Copyright © 2017 Dylan Rodriquez. All rights reserved.
//

import Foundation

class CalculatorBrain {
    private var accumulator: Double = 0.0
    internal func setOperand (operand: Double){
        accumulator = operand
    }
    
    // operations -> dictionary of string and enum of operations
    
    var operations: Dictionary <String, Operation> = [
        "π": Operation.Constant(M_PI),
        "e" : Operation.Constant(M_E),
        "√" : Operation.UnaryOperation(sqrt), // sqrt
        "cos": Operation.UnaryOperation(cos), // cos
        "x" : Operation.BinaryOperation({$0 * $1}),
        "+" : Operation.BinaryOperation({$0 + $1}),
        "-" : Operation.BinaryOperation({$0 - $1}),
        "÷" : Operation.BinaryOperation({$0 / $1}),
        "n": Operation.BinaryOperation({pow($0, $1)}),
        "=" : Operation.Equals,
        "C" : Operation.Clear
    ]
    enum Operation {
        
        case Constant(Double)
        case UnaryOperation ((Double) -> Double)
        case BinaryOperation ((Double, Double) -> Double)
        case Equals
        case Clear
    }
    
    func performOperation (symbol: String) {
        if let operation = operations[symbol]{
            switch operation {
            case .Constant (let value):
                accumulator = value
            case .UnaryOperation (let unifoo):
                accumulator = unifoo(accumulator)
            case .BinaryOperation (let bifoo):
                executeBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryFunction: bifoo, firstOperand: accumulator)
            case .Equals:
               executeBinaryOperation()
            case .Clear:
                pending = nil
                accumulator = 0.0
            }
        }
    }
    private func executeBinaryOperation() // () -> returns void
    {
        if pending != nil{
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
        }
    }
    
    private var pending: PendingBinaryOperationInfo?
    
    struct PendingBinaryOperationInfo {
        var binaryFunction: (Double,Double) -> Double
        var firstOperand: Double
    }

    
    var result: Double{
        get {
            return accumulator
        }
    }
}

    
    
