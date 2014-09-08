//
//  ViewController.swift
//  tip1
//
//  Created by Vidya Sridharan on 9/3/14.
//  Copyright (c) 2014 Vidya Sridharan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var NavigationController: UINavigationItem!
    @IBOutlet weak var quarterTotal: UILabel!
    @IBOutlet weak var halfTotal: UILabel!
    
    @IBOutlet weak var slider: UIView!
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
     var tipPercentages = [0.10, 0.20, 0.22]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        amount.becomeFirstResponder()
        var defaults = NSUserDefaults.standardUserDefaults()
        var intValue = defaults.integerForKey("default_value")
        var tipPercentage = tipPercentages[intValue]
        tipControl.selectedSegmentIndex = intValue
        self.slider.alpha = 0
        
    }
    

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    

    @IBAction func onEditingChanged(sender: AnyObject) {
        self.slider.alpha = 0
        slider.hidden = false
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmountValue = NSString(string: amount.text).doubleValue
        var tip = billAmountValue * tipPercentage
        var total = tip + billAmountValue
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        halfTotal.text = String(format: "$%.2f", total/2)
        quarterTotal.text = String(format: "$%.2f", total/4)
        if(amount.text != ""){
            UIView.animateWithDuration(0.4, animations: {
                
                self.slider.alpha = 1
                
            })}
    }
    
    override func viewWillAppear(animated: Bool) {
        var defaults = NSUserDefaults.standardUserDefaults()
        var intValue = defaults.integerForKey("default_value")
        var tipPercentage = tipPercentages[intValue]
        tipControl.selectedSegmentIndex = intValue
        onEditingChanged(intValue)
        
    }
    
 
  
    
}

