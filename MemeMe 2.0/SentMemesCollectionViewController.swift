//
//  SentMemesCollectionViewController.swift
//  MemeMe 2.0
//
//  Created by Jeremy Spradlin on 10/18/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import UIKit

class SentMemesCollectionViewController: UICollectionViewController {
    
    var memes: [Meme] { return (UIApplication.shared.delegate as! AppDelegate).memes }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var addMemeButton: UIBarButtonItem!
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "memeCollectionCell")!
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "memeCell", for: indexPath)
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        
        
//        cell.imageView?.image = meme.memedImage
//        cell.textLabel?.text = meme.topTextField
        return cell

    }
    
    @IBAction func addMemeButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MemeEditorView") as! MemeEditorViewController
        present(vc, animated: true, completion: nil)
    }
    
}
