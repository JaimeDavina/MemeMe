//
//  MemeTableViewController.swift
//  MemeMe
//
//  Created by Patrick Bellot on 10/2/15.
//  Copyright © 2015 Irish Poet. All rights reserved.
//

import UIKit

class MemeTableViewController: UITableViewController {

    
    var memes: [Meme]!
    let cellIdentifier = "MemeTableViewCell"
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        MemeRepository.sharedInstance.getMemes()
        memes = MemeRepository.sharedInstance.memes
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let memeDetailVC = storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        memeDetailVC.selectedMeme = memes[indexPath.row]
        navigationController!.pushViewController(memeDetailVC, animated: true)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let meme = memes[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! MemeTableViewCell
        cell.memeImage?.image = meme.memedImage
        cell.title?.text = "\(meme.topText!) ... \(meme.bottomText!)"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
}
