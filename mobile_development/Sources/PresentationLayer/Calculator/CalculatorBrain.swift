//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Владимир Нереуца on 08.03.2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//

import Foundation

// MARK: - CalculatorBrain
struct CalculatorBrain {
  
  // MARK: Properties
  private var accumulator: Double?
  private var pendingBinaryOperation: PendingBinaryOperation?
  
  var result: Double? {
      return accumulator
  }
  
  private var operations: [String: Operation] = [
    "AC"  : Operation.constant(0),
    "e"   : Operation.constant(M_E),
    "π"   : Operation.constant(Double.pi),
    "√"   : Operation.unaryOperation(sqrt),
    "±"   : Operation.unaryOperation { -$0 },
    "1/x" : Operation.unaryOperation { 1 / $0 },
    "%"   : Operation.unaryOperation { $0 / 100 },
    "÷"   : Operation.binaryOperation { $0 / $1 },
    "×"   : Operation.binaryOperation { $0 * $1 },
    "–"   : Operation.binaryOperation { $0 - $1 },
    "+"   : Operation.binaryOperation { $0 + $1 },
    "="   : Operation.equals
  ]
  
  // MARK: Nested types
  private enum Operation {
    case constant(Double)
    case unaryOperation((Double) -> Double)
    case binaryOperation((Double, Double) -> Double)
    case equals
  }
  
  private struct PendingBinaryOperation {
    
    // MARK: Properties
    let function: (Double, Double) -> Double
    let firstOperand: Double
    
    // MARK: Methods
    func perform(with secondOperand: Double) -> Double {
      return function(firstOperand, secondOperand)
    }
  }
  
  // MARK: Methods
  mutating func performOperation(_ symbol: String) {
    
    if let operation = operations[symbol] {
      switch operation {
      case .constant(let value):
        accumulator = value
      case .unaryOperation(let function):
        if accumulator != nil {
          accumulator = function(accumulator!)
        }
      case .binaryOperation(let function):
        performPendingBinaryOperation() // TODO: ???
        if accumulator != nil {
          pendingBinaryOperation = PendingBinaryOperation(function: function, firstOperand: accumulator!)
          accumulator = nil
        }
      case .equals:
        performPendingBinaryOperation()
      }
    }
  }
  
  mutating func setOperand(_ operand: Double) {
    accumulator = operand
  }
  
  private mutating func performPendingBinaryOperation() {
    
    if pendingBinaryOperation != nil && accumulator != nil {
      accumulator = pendingBinaryOperation!.perform(with: accumulator!)
      pendingBinaryOperation = nil
    }
  }
  
}
