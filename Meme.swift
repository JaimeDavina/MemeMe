//
//  Meme.swift
//  MemeMe
//
//  Created by Patrick Bellot on 9/29/15.
//  Copyright © 2015 Peauxit. All rights reserved.
//

import UIKit
import Foundation


struct Meme {
       
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
    
}