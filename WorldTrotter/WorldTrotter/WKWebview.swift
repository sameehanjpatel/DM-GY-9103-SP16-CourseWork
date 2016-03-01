//
//  WKWebview.swift
//  WorldTrotter
//
//  Created by Sameehan Patel on 2/16/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
@IBOutlet var WebviewL UIWebView

    var URLPath = "https://www.bignerdranch.com"


override func viewDidLoad(){
    super.viewDidLoad()
    
    loadAddressURL()
}

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
}
}

