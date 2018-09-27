//
//  ViewController.swift
//  Calculator
//
//  Created by Raheem Bakare on 2018-09-27.
//  Copyright © 2018 centennial college. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numberOnScreen:Double = 0;
    var  previousnumber:Double = 0;
    var solvingmaths = false
    var operation = 0;
    @IBOutlet weak var label: UILabel!
    
   
    @IBAction func numbers(_ sender: UIButton)
    {
        if solvingmaths == true
        {
            label.text = String( sender.tag-1)
            numberOnScreen = Double(label.text!)!
            solvingmaths = false
        }
        else
        {
            label.text = label.text! + String( sender.tag-1)
            numberOnScreen = Double(label.text!)!
        }
      
    }

    
    @IBAction func buttons(_ sender: UIButton) {
    if label.text != "" && sender.tag != 11 && sender.tag != 18
    {
    previousnumber = Double(label.text!)!
        
    if sender.tag == 14 //Divide
        {
            label.text = "/"
            }
            else if sender.tag == 15 //Multiply
        {
            label.text = "x"
        }
        
        else if sender.tag == 16 //Minus
        {
         label.text = "-"
        }
        else if sender.tag == 17 //Plus
        {
            label.text = "+"
        }
        operation = sender.tag
        solvingmaths = true;
        
    }
    else if sender.tag == 18
        {
            if operation == 14 //Divide
            {
            label.text = String(previousnumber / numberOnScreen)
            }
       else if operation == 15 //Multiply
        {
           label.text =  String(previousnumber * numberOnScreen)
        }
    else if operation == 16
    {
       label.text =  String(previousnumber - numberOnScreen)
        }
    else if operation == 17
    {
        label.text = String(previousnumber + numberOnScreen)
        }
    }
    else if sender.tag == 11
    {
        label.text = ""
        previousnumber = 0;
        numberOnScreen = 0;
        operation = 0;
        
        
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

