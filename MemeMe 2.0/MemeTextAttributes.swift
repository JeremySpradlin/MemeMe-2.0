//
//  MemeTextAttributes.swift
//  MemeMe 2.0
//
//  Created by Jeremy Spradlin on 10/19/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import Foundation
import UIKit

class MemeTextAtrributes: UIViewController {
    

    //MARK: Text Attribtes for meme text fields
    let memeTextAttributes:[String:Any] = [
        NSAttributedStringKey.strokeColor.rawValue: UIColor.black,
        NSAttributedStringKey.foregroundColor.rawValue: UIColor.white,
        NSAttributedStringKey.strokeWidth.rawValue: -3.0]
    
}
