//
//  SentMemesCollectionViewCell.swift
//  MemeMe 2.0
//
//  Created by Jeremy Spradlin on 10/24/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import UIKit

//protocol SentMemesCollectionViewCellDelegate: class {
//    func deleteCell(index: Int)
//}

class SentMemesCollectionViewCell: UICollectionViewCell {
    
    //MARK: Outlet Declarations
    @IBOutlet weak var memeCollectionCell: UIImageView!
    @IBOutlet weak var deleteButtonView: UIVisualEffectView!
    @IBOutlet weak var deleteButton: UIButton!
    
    //weak var delegate: SentMemesCollectionViewCellDelegate?
    
    
    
    //Failed attempt at beautifying the button / WIP
    //Not getting called, figure out how to call
//    var imageName: String! {
//        didSet{
//            print("Inside didSet")
//            deleteButtonView.layer.cornerRadius = deleteButtonView.bounds.width / 2
//            deleteButtonView.layer.masksToBounds = true
//        }
//    }
    
    @IBAction func deleteButton(_ sender: Any) {
        //print("Delete Button Pressed")
        //print(deleteButton.tag)
        //delegate?.deleteCell(index: deleteButton.tag)
    }

}





