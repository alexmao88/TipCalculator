//
//  ViewController.swift
//  TipCalculator
//
//  Created by Alex Mao on 12/29/17.
//  Copyright © 2017 Alex Mao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billLabel: UITextField!
    
    @IBOutlet weak var tipTitle: UILabel!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalTitle: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var percentControl: UISegmentedControl!
    
    @IBOutlet weak var separator: UIView!
    
    var percentage = 0.1;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.billLabel.becomeFirstResponder();
        
        self.tipTitle.isHidden = true;
        self.tipLabel.isHidden = true;
        self.totalTitle.isHidden = true;
        self.totalLabel.isHidden = true;
        self.percentControl.isHidden = true;
        self.separator.isHidden = true;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        
        view.endEditing(true);
    }
    
   
    @IBAction func billLabelChanged(_ sender: AnyObject) {
        
        self.tipTitle.isHidden = false;
        self.tipLabel.isHidden = false;
        self.totalTitle.isHidden = false;
        self.totalLabel.isHidden = false;
        self.percentControl.isHidden = false;
        self.separator.isHidden = false;
    }

    
    
    
    @IBAction func calculateTip(_ sender: UISegmentedControl) {
        
        let bill = Double(billLabel.text!) ?? 0
        
        switch percentControl.selectedSegmentIndex {
        case 0:
            percentage = 0.1;
        case 1:
            percentage = 0.15;
        case 2:
            percentage = 0.2;
        default:
            break;
        }
        
        let tip = bill * percentage;
        let total = bill + tip;
        
        let currencyFormatter = NumberFormatter();
        currencyFormatter.usesGroupingSeparator = true;
        
        currencyFormatter.numberStyle = NumberFormatter.Style.currency;
        
        currencyFormatter.locale = NSLocale.current;
        
        
        tipLabel.text = currencyFormatter.string(from:NSNumber(value:tip));
        
        totalLabel.text = currencyFormatter.string(from:NSNumber(value:total));
    }
    
    
}

