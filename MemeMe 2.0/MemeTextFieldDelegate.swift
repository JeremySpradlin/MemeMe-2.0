//
//  MemeTextFieldDelegate.swift
//  MemeMe 2.0
//
//  Created by Jeremy Spradlin on 10/19/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import Foundation
import UIKit

class MemeTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    //MARK: Variable Declarations
    let top = "TOP"
    let bottom = "BOTTOM"
    var originalText = ""
    
    //MARK: Text Field Delegate functions
    func textFieldDidBeginEditing(_ textField: UITextField) {
        originalText = textField.text!
        if originalText == top || originalText == bottom {
            textField.text = ""
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == "" {
            textField.text = originalText
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
