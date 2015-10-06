//
//  Meme.swift
//  MemeMe
//
//  Created by Patrick Bellot on 9/29/15.
//  Copyright © 2015 Peauxit. All rights reserved.
//

import UIKit
import Foundation


class Meme: NSObject, NSCoding {

    
    var topText : String!
    var bottomText: String!
    var image: UIImage!
    var memedImage: UIImage!
    
    init(topText: String, bottomText: String, image: UIImage, memedImage: UIImage) {
        self.topText = topText
        self.bottomText = bottomText
        self.image = image
        self.memedImage = memedImage
    }
    
    //MARK: NSCoding
    
    @objc required init?(coder aDecoder: NSCoder) {
        topText = aDecoder.decodeObjectForKey("topText") as! String
        bottomText = aDecoder.decodeObjectForKey("bottomText") as! String
        image = aDecoder.decodeObjectForKey("image") as! UIImage
        memedImage = aDecoder.decodeObjectForKey("memedImage") as! UIImage
    }
    
    @objc func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(topText, forKey: "topText")
        aCoder.encodeObject(bottomText, forKey: "bottomText")
        aCoder.encodeObject(image, forKey: "image")
        aCoder.encodeObject(memedImage, forKey: "memedImage")
    }
    
}