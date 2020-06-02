//
//  ViewController.swift
//  calculator
//
//  Created by El$ on 12/3/19.
//  Copyright © 2019 Lennart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Declaring and intializing a variable in order to convert the string into a number
    var viewNumber:Double = 0;
    
    //Declaring and intializing a variable containing previous number input
    var viewNumber2:Double = 0;
    
    //Declaring and intializing a variable which executes calculations
    var calculations = false;
    
    //Declaring and intializing a variable which stores operation being performed
    var mathOperation = 0;
    //Label displaying number input and out
    @IBOutlet weak var label: UILabel!
    
    //Function containing button for numbers
    @IBAction func buttonNumbers(_ sender: UIButton)
    {
        //Condition to check
        if calculations == true
        {
            label.text = String(sender.tag-1)
            viewNumber = Double(label.text!)!
            calculations = false
        }
        else
        {
           //Displaying each number in association with a tag number 1-10
            label.text = label.text! + String(sender.tag-1)
            
            //Converts string into a double
            viewNumber = Double(label.text!)!
        }
        
    }
    
    //Function containing button operations
    @IBAction func buttonOperations(_ sender: UIButton)
    {
        
        //Condition checking if number is present within label associated by tags 11-16
        if label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            //Storing previous number input
            viewNumber2 = Double(label.text!)!
            
            //Inner condition which executes based on associated operation
            if sender.tag == 12 //Division
            {
                label.text = "/";
            }
            else if sender.tag == 13 //Multiplication
            {
                label.text = "x";
            }
            else if sender.tag == 14 //Subtraction
            {
                label.text = "-";
            }
            else if sender.tag == 15 //Addition
            {
                label.text = "+";
            }
            
            mathOperation = sender.tag //stores operation being performed
            calculations = true; //stores numbers
        }
        
        //Associates with tag 16 and displays output after each calculations
        else if sender.tag == 16
        {
            if mathOperation == 12 //Division
            {
                 label.text = String (viewNumber2 / viewNumber)
            }
            else if mathOperation == 13 //Multiplicatoin
            {
                 label.text = String (viewNumber2 * viewNumber)
            }
            else if mathOperation == 14//Subtraction
            {
                 label.text = String (viewNumber2 - viewNumber)
            }
           else  if mathOperation == 15 //Addition
            {
                label.text = String (viewNumber2 + viewNumber)
            }
            
          }
        else if sender.tag == 11 //associates with tag 11 for reset button
        {
            //reset label to 0
            label.text = ""
            viewNumber = 0;
            viewNumber2 = 0;
            mathOperation = 0;
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

