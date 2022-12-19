//
//  CurrencyViewController.swift
//  Converter
//
//  Created by student on 2022-10-11.
//

import UIKit

class CurrencyViewController: UIViewController {
    @IBOutlet var answerLabel2: UILabel!
    @IBOutlet var inputTextField2: UITextField!
    let numbFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 2
        return nf
    }()
    var ansValue: Double!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    /// Function to disappear keyboard by clicking anywhere except textfield
    /// - Parameter sender: Tap gesture
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer){
        inputTextField2.resignFirstResponder()
    }
    
    
    /// Function to convert CAD To USD
    /// - Parameter sender: CAD to USD UI Button
    @IBAction func cadToUsd(_ sender: UIButton){
        if let text = inputTextField2.text , let value = Double(text){
            ansValue = (value * 0.7295)
            answerLabel2.text = numbFormatter.string(from: NSNumber(value: ansValue))
        }
        else{
            answerLabel2.text = "Please enter correct Value"
        }
    }
    
    /// Function to convert USD to CAD
    /// - Parameter sender: USD to CAD UI Button
    @IBAction func usdToCad(_ sender: UIButton){
        if let text = inputTextField2.text , let value = Double(text){
            ansValue = (value / 0.7295)
            answerLabel2.text = numbFormatter.string(from: NSNumber(value: ansValue))
        }else{
        answerLabel2.text = "Please enter correct Value"
        }
    }
}

