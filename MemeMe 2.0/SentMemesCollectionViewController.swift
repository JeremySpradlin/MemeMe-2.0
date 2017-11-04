//
//  SentMemesCollectionViewController.swift
//  MemeMe 2.0
//
//  Created by Jeremy Spradlin on 10/18/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import UIKit

class SentMemesCollectionViewController: UICollectionViewController, SentMemesCollectionViewCellDelegate {
    
    //MARK: Variable Declarations
    var memes: [Meme] { return (UIApplication.shared.delegate as! AppDelegate).memes }
    var isEditable: Bool?

    //MARK:  Outlet Declarations
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var addMemeButton: UIBarButtonItem!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    //MARK: Override Functions
    override func viewWillAppear(_ animated: Bool) {
        collectionView?.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isEditable = false
        
        let space: CGFloat = 3.0
        let widthDimension = (view.frame.size.width - (2 * space)) / 4.0
        let heightDimension = (view.frame.size.height - (2 * space)) / 4.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: widthDimension, height: heightDimension)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "memeCell", for: indexPath) as? SentMemesCollectionViewCell
        cell?.deleteButton.tag = indexPath.row
        cell?.delegate = self
        let meme = self.memes[(indexPath as NSIndexPath).row]
        cell?.memeCollectionCell.image = meme.memedImage
        if isEditable == false {
            cell?.deleteButtonView.isHidden = true
        } else {
            cell?.deleteButtonView.isHidden = false
            cell?.makeWiggle()
        }
        return cell!
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MemeDetailView") as! MemeDetailViewController
        let meme = self.memes[(indexPath as NSIndexPath).row]
        vc.image = meme.memedImage
        self.navigationController!.pushViewController(vc, animated: true)
    }

    
    //MARK: Action Functions
    @IBAction func addMemeButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MemeEditorView") as! MemeEditorViewController
        present(vc, animated: true, completion: nil)
    }
    @IBAction func editButtonTapped(_ sender: Any) {
        if isEditable == false {
            editButton.title = "Done"
            isEditable = true
            print("isEditable is True")
        } else {
            editButton.title = "Edit"
            isEditable = false
            print("isEditable is False")
        }
        collectionView?.reloadData()
    }
    
    
    //Delegate function for the delete cell button
    func deleteCell(index: Int) {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        appDelegate.memes.remove(at: index)
        print("deleteCell() called")
        print(index)
        collectionView?.reloadData()
    }
    
//    //Wiggle Function
//    func makeWiggle() {
//        let shakeAnim = CABasicAnimation(keyPath: "transform.rotation")
//        shakeAnim.duration = 0.05
//        shakeAnim.repeatCount = 2
//        shakeAnim.autoreverses = true
//        let startAngle: Float = (-2) * 3.14159/180
//        var stopAngle = -startAngle
//        shakeAnim.fromValue = NSNumber(value: startAngle)
//        shakeAnim.toValue = NSNumber(value: 3 * stopAngle)
//        shakeAnim.autoreverses = true
//        shakeAnim.duration = 0.2
//        shakeAnim.repeatCount = 10000
//        shakeAnim.timeOffset = 290 * drand48()
//        
//        //Create layer, then add animation to the element's layer
//        let layer: CALayer = self.layer
//        layer.add(shakeAnim, forKey:"shaking")
//        shakeEnabled = true
//
//    }
    
}
