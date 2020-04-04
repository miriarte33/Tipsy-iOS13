//
//  TipCalculator.swift
//  Tipsy
//
//  Created by Manrique Iriarte on 4/4/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct SplitCalculator {
    var splitAmount: Float?
    
    func getSplit() -> String {
        return String(format: "%.2f", splitAmount ?? 0.0);
    }
    
    mutating func calculateSplit(_ totalBill: Float, _ tip: Float, _ split: Int) -> Void {
        self.splitAmount = (totalBill * (1.0 + tip)) / Float(split);
    }
}
