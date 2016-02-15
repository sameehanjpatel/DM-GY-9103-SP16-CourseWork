//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Sameehan Patel on 2/14/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var celsiusLabel: UILabel!
    @IBAction func fahrenheitFieldEditingChanged(textFeild: UITextField) {
        celsiusLabel.text = textFeild.text

    }
    
    

    
}

