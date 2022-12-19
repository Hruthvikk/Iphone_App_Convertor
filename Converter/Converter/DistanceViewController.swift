//
//  DistanceViewController.swift
//  Converter
//
//  Created by student on 2022-10-11.
//

import UIKit

class DistanceViewController: UIViewController {
    @IBOutlet var answerLabel3: UILabel!
    @IBOutlet var inputTextField3: UITextField!
    let numbFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 2
        return nf
    }()
    var km1Value: Measurement<UnitLength>?{
        didSet{
            updateMValue()
        }
    }
    var mValue: Measurement<UnitLength>?{
        didSet{
            updateKmValue()
        }
    }
    var m1Value: Measurement<UnitLength>?{
        if let km1Value = km1Value{
            return km1Value.converted(to: .miles)
        }else{
            return nil
        }
    }
    var kmValue: Measurement<UnitLength>?{
        if let mValue = mValue {
            return mValue.converted(to: .kilometers)
        }else{
            return nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    /// Function to make keyboard disappear
    /// - Parameter sender: Tap Gesture
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer){
        inputTextField3.resignFirstResponder()
    }
    
    
    /// Function to convert kilometers to miles
    /// - Parameter sender: Kilometer to miles UI Button
    @IBAction func kmToM(_ sender: UIButton){
        if let text = inputTextField3.text, let value = Double(text){
            km1Value = Measurement(value: value, unit: .kilometers)
        }else{
        answerLabel3.text = "Please enter correct Value"
        }
    }
    
    
    /// Function to display output
    func updateMValue(){
        if let m1Value = m1Value {
            answerLabel3.text = numbFormatter.string(from: NSNumber(value: m1Value.value))
        }else{
            answerLabel3.text = "???"
        }
    }
    
    /// Function to display output
    func updateKmValue(){
        if let kmValue = kmValue {
            answerLabel3.text = numbFormatter.string(from: NSNumber(value: kmValue.value))
        }else{
            answerLabel3.text = "???"
        }
    }
    
    
    /// Function to convert miles to kilometers
    /// - Parameter sender: miles to kilometer UI Button
    @IBAction func mTokm(_ sender: UIButton){
        if let text = inputTextField3.text, let value = Double(text){
            mValue = Measurement(value: value, unit: .miles)
        }else{
        answerLabel3.text = "Please enter correct Value"
        }
    }
}


