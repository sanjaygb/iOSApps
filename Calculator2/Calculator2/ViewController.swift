//
//  ViewController.swift
//  Calculator2
//
//  Created by Sanjay Bhatia on 5/26/15.
//  Copyright (c) 2015 Sanjay Bhatia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    var userIsInTheMiddleOfTypingANumber: Bool = false
    var operandStack = Array<Double>()
    
    
   @IBAction func reInitializeViewController(sender: UIButton) {
        operandStack = Array<Double>()
        userIsInTheMiddleOfTypingANumber = false
        display.text = nil
    }
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        println("Digit = \(digit)")
        
        if ((digit == ".") && display.text!.rangeOfString(".") != nil)
        {
            return
        }
        
        if (userIsInTheMiddleOfTypingANumber) {
            display.text = display.text! + digit
            println("User is in the middle of typing")
        }
        else {
            userIsInTheMiddleOfTypingANumber = true
            display.text = digit;
            println("User is NOT in the middle of typing")
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        
        if (userIsInTheMiddleOfTypingANumber) {
            enter()
        }
        
        switch operation {
        case "×" : performOperation { $0 * $1 }
        case "÷" : performOperation { $1 / $0 }
        case "+" : performOperation { $0 + $1 }
        case "−" : performOperation { $1 - $0 }
        case "√" : performSingleOperation { sqrt($0) }
        case "sin" : performSingleOperation { sin($0) }
        case "cos" : performSingleOperation { cos($0) }
        case "π" : performSingleOperation { M_PI * $0 }

        default : break
        }
    }
    
    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
     func performSingleOperation(operation: (Double) -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false;
        operandStack.append(displayValue)
        println("\(operandStack)")
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        
        set {
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}