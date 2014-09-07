//
//  SViewController.swift
//  tip1
//
//  Created by Vidya Sridharan on 9/6/14.
//  Copyright (c) 2014 Vidya Sridharan. All rights reserved.
//

import UIKit

class SViewController: UIViewController {
  var selectedValue = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func storevalue(sender: UIButton) {
         selectedValue = 0;
    }
    
   
    @IBAction func storeValue20(sender: AnyObject) {
        selectedValue = 1;
    }
   
    @IBAction func storeValue22(sender: UIButton) {
        selectedValue = 2;
    }
    @IBAction func saveDefaults(sender: UIButton) {
        var defaults = NSUserDefaults.standardUserDefaults()
        
        NSLog("@test");
        defaults.setInteger(selectedValue,forKey: "default_value")
        NSLog("%d", selectedValue)
        defaults.synchronize()
        dismissViewControllerAnimated(true, completion: nil)
    }
}
