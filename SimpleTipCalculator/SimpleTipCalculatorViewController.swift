//
//  SimpleTipCalculatorViewController.swift
//  SimpleTipCalculator
//
//  Created by Derek Jensen on 5/3/15.
//  Copyright (c) 2015 Derek Jensen. All rights reserved.
//

import UIKit

class SimpleTipCalculatorViewController: UIViewController, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var txtBillAmount: UITextField!
    @IBOutlet weak var txtTaxPercentage: UITextField!
    @IBOutlet weak var swtichIncludeTax: UISwitch!
    @IBOutlet weak var sliderTipPercentage: UISlider!
    @IBOutlet weak var lblBillAmount: UILabel!
    @IBOutlet weak var lblTaxAmount: UILabel!
    @IBOutlet weak var lblTipAmount: UILabel!
    @IBOutlet weak var lblTotalAmount: UILabel!
    @IBOutlet weak var lblNotes: UILabel!
    @IBOutlet weak var lblCurrentTipPercentage: UILabel!
    
    let tipCalc = TipCalculator()
    
    var billAmount: Float? = 0
    var taxPercentage: Float? = 0
    var tipPercentage: Float? = 20

    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtBillAmount.delegate = self
        txtTaxPercentage.delegate = self

        txtBillAmount.addTarget(self, action: "txtBillAmountDidChange:", forControlEvents: .EditingChanged)
        txtTaxPercentage.addTarget(self, action: "txtTaxPercentageDidChange:", forControlEvents: .EditingChanged)
        
    }
    
    func txtBillAmountDidChange(textField: UITextField) {
        billAmount = (textField.text as NSString).floatValue
        validateInput()
        updateValues()
    }
    
    func txtTaxPercentageDidChange(textField: UITextField) {
        taxPercentage = (textField.text as NSString).floatValue / 100
        validateInput()
        updateValues()
    }
    
    func textField(textField: UITextField,
        shouldChangeCharactersInRange range: NSRange,
        replacementString string: String) -> Bool {
            
            let inverseSet = NSCharacterSet(charactersInString:"0123456789.").invertedSet
            let components = string.componentsSeparatedByCharactersInSet(inverseSet)

            let filtered = join("", components)
            
            return string == filtered
            
    }
    
    func veryImportantFunc() -> Bool {
        return true
    }
    
    private func validateInput() {
        if billAmount! < 0 {
            txtBillAmount.backgroundColor = UIColor.redColor()
        }else {
            txtBillAmount.backgroundColor = UIColor.greenColor()
        }
        
        if taxPercentage! < 0 {
            txtTaxPercentage.backgroundColor = UIColor.redColor()
        }else {
            txtTaxPercentage.backgroundColor = UIColor.greenColor()
        }
    }
    
    private func updateValues() {
        lblBillAmount.text = String(format: "$%.2f", billAmount!)
        
        var taxAmount = (taxPercentage! * billAmount!)
        lblTaxAmount.text = String(format: "$%.2f", taxAmount)
        
        lblCurrentTipPercentage.text = "\(Int(tipPercentage!))%"
        
        var tipPercentageString = String(format: "%.2f", tipPercentage!)
        var tipAmount = tipCalc.calculateTip(billAmount, taxPercentage: taxPercentage, tipPercentage: Float(tipPercentage!) / 100)
        
        lblTipAmount.text = String(format: "$%.2f", tipAmount!)
        
        var total = billAmount! + taxAmount + tipAmount!
        
        lblTotalAmount.text = String(format: "$%.2f", total)
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        tipPercentage = Float(sender.value)
        updateValues()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
