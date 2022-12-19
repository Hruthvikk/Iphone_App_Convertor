//I, Hruthvik Chokshi, student number 000813765, certify that this material is my original work.
//No other person's work has been used without due acknowledgement and I have not
// made my work available to anyone else.

//  ViewController.swift
//  Converter
//
//  Created by student on 2022-10-11.
//

import UIKit

class TemperatureViewController: UIViewController {
    
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var inputTextField: UITextField!
    let numbFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 2
        return nf
    }()
    var fahrenheitValue: Measurement<UnitTemperature>?
    {
        didSet{
            updateCelLab()
        }
    }
    var celsiusValue: Measurement<UnitTemperature>?{
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        }else{
            return nil
        }
    }
    var farToCelValue: Measurement<UnitTemperature>?{
        didSet{
            updatefarLab()
        }
    }
    var farToCel: Measurement<UnitTemperature>?{
        if let farToCelValue = farToCelValue {
            return farToCelValue.converted(to: .fahrenheit)
        }else{
            return nil
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    /// Function to disappear keyboard on clicking anywhere except textfield
    /// - Parameter sender: Tap gesture
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer){
        inputTextField.resignFirstResponder()
    }
    
    
    /// Function to convert celsius to fehranheit
    /// - Parameter sender: celsius to fehranheit UI Button
    @IBAction func conversionToF(_ sender: UIButton){
        if let text = inputTextField.text , let value = Double(text){
            farToCelValue = Measurement(value: value, unit: .celsius)
        }else{
            answerLabel.text = "Please enter correct Value"
        }
        
    }
    
    
    /// Function to display output
    func updatefarLab(){
        if let fahrenheitValue = fahrenheitValue {
            answerLabel.text = numbFormatter.string(from: NSNumber(value: fahrenheitValue.value))
        }
    }
    
    
    /// Function to convert fehranheit to celsius
    /// - Parameter sender: fehranheit to celsius UI Button
    @IBAction func conversionToC(_ sender: UIButton){
        if let text = inputTextField.text, let value = Double(text){
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        }else{
            answerLabel.text = "Please enter correct Value"
        }
    }
    
    
    /// Function to display output
    func updateCelLab(){
        if let celsiusValue = celsiusValue {
            answerLabel.text = numbFormatter.string(from: NSNumber(value: celsiusValue.value))
        }
    }

}

