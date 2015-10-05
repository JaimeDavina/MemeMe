//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by Patrick Bellot on 10/2/15.
//  Copyright © 2015 Peauxit. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {

    var selectedMeme: Meme!
    var indexOfSelectedMeme: Int?
    
    @IBOutlet weak var detailsImageView: UIImageView!
    
    @IBAction func deleteMeme(sender: UIBarButtonItem) {
        if let foundIndex = indexOfSelectedMeme {
            //remove the item at the found index
            MemeRepository.sharedInstance.memes.removeAtIndex(foundIndex)
            navigationController?.popViewControllerAnimated(true)
        }
    }
    
    @IBAction func editMeme(sender: AnyObject) {
        
        let memeEditorViewController = storyboard?.instantiateViewControllerWithIdentifier("MemeEditorViewController") as! MemeEditorViewController
        
        memeEditorViewController.meme = selectedMeme 
        presentViewController(memeEditorViewController, animated: true, completion: nil)
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let memedImage = selectedMeme.memedImage {
            detailsImageView.image = memedImage
        }
    }
}
