//
//  CalculatorBrain.swift
//  stanfordioslesson1
//
//  Created by Dylan Rodriquez on 1/20/17.
//  Copyright © 2017 Dylan Rodriquez. All rights reserved.
//

import Foundation

enum Optional <T> { //This is what an optional looks like
    case None // if none
    case Some(T) // if associated values and can be unwrapped
}


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
        "=" : Operation.Equals,
    ]
    enum Operation { //discrete set of values
        
        case Constant(Double)
        case UnaryOperation ((Double) -> Double)
        case BinaryOperation ((Double, Double) -> Double)
        case Equals
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
            }
        }
    }
    private func executeBinaryOperation() // () -> returns void
    {
        if pending != nil{
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
        }
    }
    //structs like a class. can have vars but no inheritance
    // steucs like enums are passed by values. classes are passed by reference
    //pass by value, it copies it. pass by reference, it lives in the heap
    
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

    
    
