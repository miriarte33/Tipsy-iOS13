//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Manrique Iriarte on 4/4/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var tip: Float = 10.0;
    var people: Int = 2;
    var split: String = "0.00";
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var inputsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        splitLabel.text = split;
        inputsLabel.text = "Split between \(people) people, with \(tip*100)% tip."
    }

    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
