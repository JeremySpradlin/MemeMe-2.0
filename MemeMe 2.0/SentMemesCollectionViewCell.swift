//
//  SentMemesCollectionViewCell.swift
//  MemeMe 2.0
//
//  Created by Jeremy Spradlin on 10/24/17.
//  Copyright © 2017 Udacity. All rights reserved.
//
import Foundation
import UIKit

protocol SentMemesCollectionViewCellDelegate: class {
    func deleteCell(index: Int)
}

class SentMemesCollectionViewCell: UICollectionViewCell {
    
    //MARK: Outlet Declarations
    @IBOutlet weak var memeCollectionCell: UIImageView!
    @IBOutlet weak var deleteButtonView: UIVisualEffectView!
    @IBOutlet weak var deleteButton: UIButton!
    
    weak var delegate: SentMemesCollectionViewCellDelegate?
    
    
    
    @IBAction func deleteButton(_ sender: Any) {
        print("Delete Button Pressed")
        delegate?.deleteCell(index: deleteButton.tag)
    }

}





