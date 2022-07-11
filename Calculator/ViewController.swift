//
//  ViewController.swift
//  Calculator
//
//  Created by Sunny Jha on 10/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    var workings:String = ""
    
    @IBOutlet weak var Computation: UILabel!
    
    @IBOutlet weak var ComputationValue: UILabel!
    
    func AddToComputations(_ value:String){

        workings = workings + value

        Computation.text = workings

    }
    
    /// MATHEMATICAL CALCULATIONS USING NS
    func Calculate(){
        let expression = NSExpression(format: workings)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        let resultstring = resultformat(result)
        ComputationValue!.text = resultstring
    }
    
    /// FUNCTION TO FORMAT THE OUTPUT
    func resultformat(_ value:Double) -> String{
        if value.truncatingRemainder(dividingBy: 1) == 0
        {
            return String(format: "%.0f", value)
        }
        else{
            return String(format: "%0.2f", value)
        }
    }
    
    /// FUNCTION TO CLEAR ALL
    func ClearAll()
    {
        workings = ""
        Computation.text = ""
        ComputationValue.text = ""
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ClearAll()
    }
   
    
    //BACKSPACE BUTTON
    @IBAction func Backspace(_ sender: Any) {
        if (!workings.isEmpty) {
        workings.removeLast()
        Computation.text = workings
        }
    }
/// OPERATORS , ALLCLEAR, EQUALS BUTTONS
    @IBAction func Operators(_ sender: UIButton)
    {
        switch sender.tag{
            /// OPERATORS
            case -1: AddToComputations("+")
            case -2: AddToComputations("-")
            case -3: AddToComputations("/")
            case -4: AddToComputations("*")
            case 10: AddToComputations(".")
            case 11: Calculate()
            case 12:ClearAll()
            default: ClearAll()
        }
    }
    
    @IBAction func AllInputs(_ sender: UIButton){
        
        switch sender.tag{
            ///  NUMBERS
        case sender.tag: AddToComputations("\(String(describing: sender.tag))")
            default: ClearAll()
            
        }
        
    }
    
}
    
    
    
    
    
    


