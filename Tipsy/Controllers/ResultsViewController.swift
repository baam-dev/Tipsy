//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Amir Bakhshi on 2021-08-21.
//  Copyright © 2021 Baam.dev. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    var result = "0.0"
    var numOfPip = 0
    var tip = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = result
        settingsLabel.text = "Split between \(numOfPip) people, with \(tip)% tip!"
    }
    
    @IBAction func recalcPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
