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
    
    //MARK: Variable declarations
    //
    //MARK: Text Attribtes for meme text fields
    let memeTextAttributes:[String:Any] = [
        NSAttributedStringKey.strokeColor.rawValue: UIColor.black,
        NSAttributedStringKey.foregroundColor.rawValue: UIColor.white,
        NSAttributedStringKey.font.rawValue: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSAttributedStringKey.strokeWidth.rawValue: -3.0]
    
}
