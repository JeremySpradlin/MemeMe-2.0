//
//  SentMemesTableViewController.swift
//  MemeMe 2.0
//
//  Created by Jeremy Spradlin on 10/18/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import Foundation
import UIKit

class SentMemesTableViewController: UITableViewController {
    
    @IBOutlet weak var addMemeButton: UIBarButtonItem!
    
    
    var memes: [Meme]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
    }
    
    override func viewWillAppear(_ animated: Bool) {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            print(self.memes.count)
            return self.memes.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "memeCell")!
            let meme = self.memes[(indexPath as NSIndexPath).row]
            
            cell.textLabel?.text = meme.topTextField
            cell.imageView?.image = meme.memedImage
            
            return cell
        }
        print("Inside View Will Appear")
        print(self.memes.count)
    }
    
    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(self.memes.count)
//        return self.memes.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "memeCell")!
//        let meme = self.memes[(indexPath as NSIndexPath).row]
//
//        cell.textLabel?.text = meme.topTextField
//        cell.imageView?.image = meme.memedImage
//
//        return cell
//    }
    
    @IBAction func addMemeButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MemeEditorView") as! MemeEditorViewController
        present(vc, animated: true, completion: nil)
    }
    
    
}
