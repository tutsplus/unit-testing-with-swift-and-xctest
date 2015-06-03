//
//  TipService.swift
//  SimpleTipCalculator
//
//  Created by Derek Jensen on 5/27/15.
//  Copyright (c) 2015 Derek Jensen. All rights reserved.
//

import Foundation

class TipService: NSObject {
    
    let tipCalc: TipCalculator
    
    override init() {
        tipCalc = TipCalculator()
    }
    
    init(calc: TipCalculator) {
        tipCalc = calc
    }
    
    func getTipValue(billAmount: Float?, taxPercentage: Float?, tipPercentage: Float?) -> Float? {
        let tip = tipCalc.calculateTip(billAmount, taxPercentage: taxPercentage, tipPercentage: tipPercentage)
        
        return tip == 0 ? nil : tip
    }
}