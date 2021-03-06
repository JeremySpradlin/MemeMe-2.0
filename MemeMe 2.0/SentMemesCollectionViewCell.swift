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
    @IBOutlet weak var memeCollectionCell: UIImageView! {
        didSet{  //didSet function for rounding the delete button view
            deleteButtonView.layer.cornerRadius = deleteButtonView.bounds.width / 2
            deleteButtonView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var deleteButtonView: UIVisualEffectView!
    @IBOutlet weak var deleteButton: UIButton!
    
    //MARK: Variable Declarations
    weak var delegate: SentMemesCollectionViewCellDelegate?
    
    
    //MARK: Action Functions
    @IBAction func deleteButton(_ sender: Any) {
        delegate?.deleteCell(index: deleteButton.tag)
    }
    
    //MARK: Wiggle Function
    func makeWiggle() {
        let shakeAnim = CABasicAnimation(keyPath: "transform.rotation")
        shakeAnim.duration = 0.05
        shakeAnim.repeatCount = 2
        shakeAnim.autoreverses = true
        let startAngle: Float = (-2) * 3.14159/180
        let stopAngle = -startAngle
        shakeAnim.fromValue = NSNumber(value: startAngle)
        shakeAnim.toValue = NSNumber(value: 3 * stopAngle)
        shakeAnim.autoreverses = true
        shakeAnim.duration = 0.2
        shakeAnim.repeatCount = 10000
        shakeAnim.timeOffset = 290 * drand48()
        
        let layer: CALayer = self.layer
        layer.add(shakeAnim, forKey:"shaking")
    }

}





