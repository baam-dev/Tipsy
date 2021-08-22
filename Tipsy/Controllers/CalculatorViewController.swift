//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipFee = 0.10
    var numberOfPeople = 0
    var billTotal = 0.0
    var perPerson = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let btnValue = sender.currentTitle!
        let btnFinalValue = Double(btnValue.dropLast())! / 100
        tipFee = btnFinalValue
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {

        let bill = billTextField.text!
        // if the field is not empty
        if bill != "" {
        billTotal = Double(bill)!
        perPerson = String(format: "%.2f", (billTotal * (1 + tipFee)) / Double(numberOfPeople))
        }
        
        self.performSegue(withIdentifier: "showResult", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultVC = segue.destination as! ResultsViewController
        resultVC.result = perPerson
        resultVC.numOfPip = numberOfPeople
        resultVC.tip = Int(tipFee * 100)
    }

}

