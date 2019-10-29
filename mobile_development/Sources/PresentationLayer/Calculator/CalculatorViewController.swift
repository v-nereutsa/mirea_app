//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Владимир Нереуца on 08.03.2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//

import UIKit

// MARK: - CalculatorViewController
 final class CalculatorViewController: UIViewController {
  
  // MARK: IBOutlet
  @IBOutlet var display: UILabel! {
    didSet {
      let swipeRightRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(deleteLastNumber))
      swipeRightRecognizer.direction = .right
      display.addGestureRecognizer(swipeRightRecognizer)
      
      let swipeLeftRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(deleteLastNumber))
      swipeLeftRecognizer.direction = .left
      display.addGestureRecognizer(swipeLeftRecognizer)
    }
  }
  
  // MARK: IBAction
  @IBAction func touchDigit(_ sender: UIButton) {
    guard let displayText = display.text, let digit = sender.currentTitle else { return }
    
    if displayText.contains(".") && digit == "." { return }
    
    if displayText.first == "0" && displayText.last == "0" {
      userIsInTheMiddleOfTyping = false
    }
    
    if userIsInTheMiddleOfTyping {
      display.text = displayText + digit
    } else {
      display.text = digit == "." ? (displayText + digit) : digit
      userIsInTheMiddleOfTyping = true
    }
  }
  
  @IBAction func performOperation(_ sender: UIButton) {
    guard let displayText = display.text else { return }
    
    if displayText.last == "." {
      display.text?.append("0")
    }
    if userIsInTheMiddleOfTyping {
      brain.setOperand(displayValue)
      userIsInTheMiddleOfTyping = false
    }
    if let mathematicalSymbol = sender.currentTitle {
      brain.performOperation(mathematicalSymbol)
    }
    if let result = brain.result {
      displayValue = result
    }
  }
  
  // MARK: Properties
  private var brain = CalculatorBrain()
  private var userIsInTheMiddleOfTyping = false
  
  private var displayValue: Double {
    get {
      return Double(display.text!)!
    }
    set {
      display.text = formatedDisplayValue(newValue)
    }
  }
  
  // MARK: Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    title = translateFor(key: .CalculatorTitle)
  }
  
  private func formatedDisplayValue(_ value: Double) -> String {
    return String(format: "%g", value)
  }
  
  // MARK: Obj-C methods
  @objc private func deleteLastNumber() {
    if let displayText = display.text, displayText.count <= 1 {
      displayValue = 0
      userIsInTheMiddleOfTyping = false
    } else {
      display.text?.removeLast()
    }
  }
  
}
