//
//  ViewController.swift
//  Calculator
//
//  Created by Sanjay Bhatia on 1/25/15.
//  Copyright (c) 2015 Sanjay Bhatia. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var display: UILabel!
    var userIsInTheMiddleOfTypingANumber = false
    
    
    @IBAction func appendDigit(sender: UIButton) {
        
        let digit = sender.currentTitle!
        //println("Digit = \(digit)")
        
        if (userIsInTheMiddleOfTypingANumber) {
        display.text = display.text!  + digit
        }
        else {
            userIsInTheMiddleOfTypingANumber = true
            display.text = digit;
        }
        
    }

    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
    
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

