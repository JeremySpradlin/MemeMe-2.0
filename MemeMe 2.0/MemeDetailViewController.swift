//
//  MemeDetailViewController.swift
//  MemeMe 2.0
//
//  Created by Jeremy Spradlin on 10/24/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {
    
    //MARK:  Variable Declarations
    var image: UIImage!
    
    //MARK: Outlet Declarations
    @IBOutlet weak var memeDetailImageView: UIImageView!
    
    //MARK: Override Functions
    override func viewWillAppear(_ animated: Bool) {
        memeDetailImageView.image = image
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK: Action Functions
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func activityButton(_ sender: Any) {
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityController.completionWithItemsHandler = { activity, success, items, error in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
        }
        present(activityController, animated: true, completion: nil)
    }
    
}
