//
//  DetailViewController.swift
//  MemeMe
//
//  Created by Patrick Bellot on 10/9/15.
//  Copyright © 2015 Peauxit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var chosenMeme: Meme!
    var indexOfChosenMeme: Int?

    @IBOutlet weak var detailImageView: UIImageView!
    
    @IBAction func editButton(sender: AnyObject) {
        let memeEditorViewController = storyboard?.instantiateViewControllerWithIdentifier("MemeEditorViewController") as! MemeEditorViewController
        memeEditorViewController.meme = chosenMeme
        presentViewController(memeEditorViewController, animated: true, completion: nil)
    }

    @IBAction func deleteButton(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            if let _ = indexOfChosenMeme{
                appDelegate.memes.removeAtIndex(indexOfChosenMeme!)
                navigationController?.popViewControllerAnimated(true)
            }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let memedImage = chosenMeme.memedImage{
            detailImageView.image = memedImage
        }
    }
}
