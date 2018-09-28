//
//  ViewController.swift
//  Calculator
//
//  Created by Raheem Bakare on 2018-09-27.
//  Copyright © 2018 centennial college. All rights reserved.
//



import UIKit

class ViewController: UIViewController {
   
     override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // adding label text_area
    
    @IBOutlet weak var ResultLabel: UILabel!
    
    // variable for changing 0
    var stillTyping = false
    
    //7  created variables so as to save one operand and for decimal
    
    var firstOperation: Double = 0
    var secondOperation: Double = 0
    var operationSign: String = ""
    var decimalpoint = false
    
    
    //  created varible which  changes text_string on double
    var currentInput : Double{
        get {
            return Double(ResultLabel.text!)!
        }
        
        set{
            ResultLabel.text = "\(newValue)"
            stillTyping = false}
    }
    
    
    // fucnton for numbers - 0-9
    @IBAction func numberPressed(_ sender: UIButton) {
        
        let number = sender.currentTitle!
        //  reduce zero
        
        if stillTyping {
            // limiting the amounts of symbols
            
            if (ResultLabel.text?.count)! < 9{
                ResultLabel.text = ResultLabel.text! + number }
        } else  {
            // deletes 0 which is located by default ;
            ResultLabel.text = number
            stillTyping = true
        }
    }
    //  add +, - , x, /, .
    @IBAction func twoOperandsSignPressed(_ sender: UIButton) {
        // this operation sign gets sign + or -
        operationSign = sender.currentTitle!
        firstOperation = currentInput
        stillTyping = false
        decimalpoint = false
    }
    
    //  writes the function for this case
    func operateWithTwoOperands ( operation: (Double, Double) -> Double) {
        currentInput = operation(firstOperation,secondOperation)
        stillTyping = false}
    
    
    // creates action which when pressed  saves operand .
    @IBAction func equalitySignPressed(_ sender: UIButton) {
        if stillTyping  {
            secondOperation = currentInput}
        
        decimalpoint = false
        // 11 making different cases
        switch operationSign {
        case "+":
            //this  function  get two argument and does the action
            operateWithTwoOperands{$0+$1}
        case "-":
            operateWithTwoOperands{$0-$1}
        case "x":
            operateWithTwoOperands{$0*$1}
        case "÷":
            operateWithTwoOperands{$0/$1}
            if secondOperation == 0 {
                ResultLabel.text = "Error"
            } else  {
                ResultLabel.text = "Error"
            }
            //  result.truncatingRemainder(dividingBy:Double)
            
        default: break
            
        }
    }
    
    
    
    // add top buttons  in turn AC, +/-, %, .
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        firstOperation = 0
        secondOperation = 0
        currentInput = 0
        ResultLabel.text = "0"
        stillTyping = false
        operationSign = ""
        decimalpoint = false
    }
    
    @IBAction func plusMinusButtonPressed(_ sender: UIButton) {
        currentInput = -currentInput
    }
    
    @IBAction func percentageButtonPressed(_ sender: UIButton) {
        if firstOperation == 0 {
            currentInput = currentInput/100
        } else {
            secondOperation = firstOperation * currentInput/100
            stillTyping = false
        }
    }
    @IBAction func decimalButtonPressed(_ sender: UIButton) {
        if stillTyping && !decimalpoint{
            ResultLabel.text = ResultLabel.text! + "."
            decimalpoint = true
        } else if !stillTyping && !decimalpoint {
            ResultLabel.text = "0."
        }
        
        
        
        
        // expection
        
        // if sender.currentTitle! == "="{
        // ResultLabel.text = "\(ResultLabel.text!)"
        // }
        
    }
}



