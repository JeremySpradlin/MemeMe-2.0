//
//  SentMemesCollectionViewCell.swift
//  MemeMe 2.0
//
//  Created by Jeremy Spradlin on 10/24/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import UIKit

class SentMemesCollectionViewCell: UICollectionViewCell {
    
    //MARK: Outlet Declarations
    @IBOutlet weak var memeCollectionCell: UIImageView!
    @IBOutlet weak var deleteButtonView: UIVisualEffectView!
    @IBOutlet weak var deleteButton: UIButton!
    
    
    //Failed attempt at beautifying the button / WIP
    //Not getting called, figure out how to call
    var imageName: String! {
        didSet{
            print("Inside didSet")
            deleteButtonView.layer.cornerRadius = deleteButtonView.bounds.width / 2
            deleteButtonView.layer.masksToBounds = true
        }
    }
    
    
    //Working on delete button action = May need to move?
    @IBAction func deleteButtonTapped(_ sender: Any) {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        print(deleteButton.tag)
        //appDelegate.memes.remove(at: deleteButton.tag)  //Uncomment to delete object, will currently cause crash
        //SentMemesCollectionViewController.collectionView.reloadData()
        //Need to figure out how to reload the collection view to remove the meme from teh collection view after removing it
        //from the data object
    }

    
}
