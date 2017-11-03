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
    //MARK:  Outlet Declarations
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var addMemeButton: UIBarButtonItem!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var isEditable: Bool?
    
    //MARK: Override Functions
    override func viewWillAppear(_ animated: Bool) {
        collectionView?.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
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
    @IBAction func editButton(_ sender: Any) {
        // TODO: Add code to make memes selectable, change edit button to delete button, and then delete selected memes when pressed
        
    }
    
    func deleteCell(index: Int) {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        //appDelegate.memes.remove(at: indexPath.row)
        appDelegate.memes.remove(at: index)
        //tableView.deleteRows(at: [indexPath], with: .fade)
        print("deleteCell() called")
        print(index)
        collectionView?.reloadData()
    }
    
}
