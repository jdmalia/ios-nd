//
//  CashTextFieldDelegate.swift
//  TextFieldDelegate
//
//  Created by Jason Malia on 8/27/16.
//  Copyright © 2016 Jason Malia. All rights reserved.
//

import Foundation
import UIKit

class CashTextFieldDelegate : NSObject, UITextFieldDelegate {
    
    var value: Float = 0
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        
        let  char = string.cStringUsingEncoding(NSUTF8StringEncoding)!
        let isBackSpace = strcmp(char, "\\b")
        
        if (isBackSpace == -92) {
            value *= 100
            value -= value % 10
            value /= 1000
            textField.text = formatter.stringFromNumber(value)
            return false
        } else if let number = Float(string) {
            value *= 10
            value += number / 100.0
            textField.text = formatter.stringFromNumber(value)
            return false
        }
        return false
    }
}
