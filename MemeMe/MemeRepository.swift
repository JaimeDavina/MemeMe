//
//  MemeRepository.swift
//  MemeMe
//
//  Created by Patrick Bellot on 9/29/15.
//  Copyright © 2015 Peauxit. All rights reserved.
//

import Foundation

class MemeRepository {
    
    var memes: [Meme] = [Meme]()
    
    static let sharedInstance = MemeRepository()
    
    func getMemes() {
        let filemgr = NSFileManager.defaultManager()
        let dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let docsDir = dirPaths[0]
        let dataFilePath = (docsDir as NSString).stringByAppendingPathComponent("memes")
        if filemgr.fileExistsAtPath(dataFilePath) {
            memes = NSKeyedUnarchiver.unarchiveObjectWithFile(dataFilePath) as! [Meme]
        }
        
    }
    
    func persistMemes() {
        let dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let docsDir = dirPaths[0]
        let dataFilePath = (docsDir as NSString).stringByAppendingPathComponent("memes")
        NSKeyedArchiver.archiveRootObject("memes", toFile: dataFilePath)
    }
    
}