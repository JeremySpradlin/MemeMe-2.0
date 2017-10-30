//
//  FontTableViewController.swift
//  MemeMe 2.0
//
//  Created by Jeremy Spradlin on 10/29/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import Foundation
import UIKit

class FontTableViewController: UITableViewController {
    
    //MARK: Variable Declarations
    let fonts = ["Test 1", "Test 2", "AmericanTypewriter"]
    
    //MARK: Tableview functions
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fonts.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fontCell")
        cell?.textLabel?.text = fonts[indexPath.row]
        return cell!
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newFont = fonts[indexPath.row]
        MemeEditorViewController.setFont(font: newFont)
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
