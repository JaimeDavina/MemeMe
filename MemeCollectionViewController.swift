//
//  MemeCollectionViewController.swift
//  MemeMe
//
//  Created by Patrick Bellot on 10/2/15.
//  Copyright © 2015 Peauxit. All rights reserved.
//

import UIKit

class MemeCollectionViewController: UICollectionViewController {

    @IBOutlet weak var flowLayout:UICollectionViewFlowLayout!
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var memes: [Meme]!
    let cellIdentifier = "MemeCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let space: CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSizeMake(dimension, dimension)
        memes = appDelegate.memes
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
         memes = appDelegate.memes
         collectionView?.reloadData()
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath)
        let meme = memes[indexPath.item]
        cell.backgroundView = UIImageView(image: meme.memedImage)
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
       collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        let detailVC = storyboard!.instantiateViewControllerWithIdentifier("DetailViewController") as! DetailViewController
        detailVC.chosenMeme = memes[indexPath.row]
        detailVC.indexOfChosenMeme = indexPath.row
        navigationController!.pushViewController(detailVC, animated: true)
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
}


