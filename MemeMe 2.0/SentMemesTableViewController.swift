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
    
    //MARK: Variable Declarations
    var memes: [Meme] { return (UIApplication.shared.delegate as! AppDelegate).memes }

    
    //MARK: Outlet Declarations
    @IBOutlet weak var addMemeButton: UIBarButtonItem!
    
    //MARK: Override Functions
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    //Creates a cell for each object in the data and adds it to the tableview
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memeCell")!
        let meme = self.memes[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = meme.topTextField
        cell.imageView?.image = meme.memedImage
        return cell
    }
    //Allows the user to swipe to delete a row from the data view as well as the data source
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let object = UIApplication.shared.delegate
            let appDelegate = object as! AppDelegate
            appDelegate.memes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
}
