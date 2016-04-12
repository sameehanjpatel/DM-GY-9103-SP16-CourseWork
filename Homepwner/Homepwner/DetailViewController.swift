//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Sameehan Patel on 3/27/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController{
    @IBOutlet var nameField: UITextField!
    @IBOutlet var valueField: UITextField!
    @IBOutlet var serialField: UITextField!
    @IBOutlet var dateField: UILabel!

    var item: Item!
    
    let numberFormatter: NSNumberFormatter = {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .DecimalStyle
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    } ()
    
    let dateFormatter: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        formatter.timeStyle = .NoStyle
        return formatter
    } ()
    
    override func viewWillAppear (animated: Bool){
        super.viewWillAppear(animated)
        nameField.text = item.name
        serialField.text = item.serialNumber
        valueField.text = numberFormatter.stringFromNumber(item.valueInDollars)
        dateField.text = dateFormatter.stringFromDate(item.dateCreated)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        
        //saving changes to item 
        item.name = nameField.text ?? ""
        item.serialNumber = serialField.text
        
        if let valueText = valueField.text,
            value = numberFormatter.numberFromString(valueText)
        { item.valueInDollars = value.integerValue
        }
        else {
            item.valueInDollars = 0
        }
    
    }
}



