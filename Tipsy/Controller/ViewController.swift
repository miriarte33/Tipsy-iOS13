//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var totalBillTextField: UITextField!
    @IBOutlet weak var peopleAmountLabel: UILabel!
    
    var splitCalculator = SplitCalculator()
    
    var buttons: Array<UIButton>? = nil
    
    var tip: Float = 0.1
    var people: Int = 2
    var billTotal: Float? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttons = [zeroPercentButton, tenPercentButton, twentyPercentButton]
    }

    @IBAction func tipButtonPressed(_ sender: UIButton) {
        for button in buttons! {
            if button.currentTitle! == sender.currentTitle! {
                button.isSelected = true;
                
                tip = Float(button.currentTitle!.dropLast())! / 100.0;
            } else {
                button.isSelected = false;
            }
        }
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        people = Int(sender.value)
        peopleAmountLabel.text = String(people)
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        billTotal = Float(totalBillTextField.text!) ?? 0.0
        
        splitCalculator.calculateSplit(billTotal ?? 0.0, tip, people)
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "goToResults" {
            let destination = segue.destination as! ResultsViewController
            destination.people = people
            destination.split = splitCalculator.getSplit()
            destination.tip = tip
        }
    }
}

