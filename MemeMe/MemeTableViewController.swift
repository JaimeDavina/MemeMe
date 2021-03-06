//
//  MemeTableViewController.swift
//  MemeMe
//
//  Created by Patrick Bellot on 10/2/15.
//  Copyright © 2015 Peauxit. All rights reserved.
//

import UIKit

class MemeTableViewController: UITableViewController {

    
    var memes: [Meme]!
    let cellIdentifier = "MemeTableViewCell"
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memes = appDelegate.memes
    }
    
    override func viewDidAppear(animated: Bool) {
        memes = appDelegate.memes

        if self.memes.count == 0{
            let storyboard = self.storyboard
            let vc = storyboard!.instantiateViewControllerWithIdentifier("MemeEditorViewController") as! MemeEditorViewController
            self.presentViewController(vc, animated: true, completion: nil)
        } else {
            super.viewDidAppear(true)
            tableView.reloadData()
        }
    }
    
    //Mark: UITextFieldDelegate Methods
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let meme = memes[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! MemeTableViewCell
        cell.memeImage?.image = meme.memedImage
        cell.title?.text = "\(meme.topText!) ... \(meme.bottomText!)"
        
        return cell
    }
    
    //Mark: UITableViewDelegate Methods
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let detailVC = storyboard!.instantiateViewControllerWithIdentifier("DetailViewController") as! DetailViewController
        detailVC.chosenMeme = memes[indexPath.row]
        detailVC.indexOfChosenMeme = indexPath.row
        navigationController!.pushViewController(detailVC, animated: true)
    }    
    
}
    

