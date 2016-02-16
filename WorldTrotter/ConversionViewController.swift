//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Sameehan Patel on 2/14/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    
    let numberFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    override func viewDidLoad(){ //Always call the super implementation of viewDidLoad
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        print("MapViewController loaded its view")}
    

    var fahrenheitValue: Double? {
        didSet {
            updateCelsiusLabel()
        }
    }
    

    var celsiusValue: Double?{
        if let value = fahrenheitValue {
        return (value - 32) * (5/9)
    }
    else {
    return nil
        }}
    
    func updateCelsiusLabel() {
        if let value = celsiusValue {
            celsiusLabel.text = numberFormatter.stringFromNumber(value)
        }
        else {
            celsiusLabel.text = "???"
        }
    }
    
    @IBAction func fahrenheitFielsEditingChanged(textField: UITextField) {
        if let text = textField.text, value = Double(text) {
            fahrenheitValue = value}
        else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(sender:AnyObject){
        textField.resignFirstResponder()
    
    }
    
    func textField(textField: UITextField,
        shouldChangeCharactersInRange range: NSRange,
        replacementString string: String) -> Bool {
            let existingTextHasDecimalSeparator = textField.text?.rangeOfString(".")
            let replacementTextHasDecimalSeparator = string.rangeOfString(".")
            
            if existingTextHasDecimalSeparator != nil &&
                replacementTextHasDecimalSeparator != nil {
                    return false
            }
            else
            {return true}
    }
    
   

    
  
    }
    