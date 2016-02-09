//
//  Posts.swift
//  Goof
//
//  Created by Julian Lee on 2/4/16.
//  Copyright © 2016 mobilemakers. All rights reserved.
//

import Foundation
import UIKit

class Posts: NSObject {
    
    var postedImage = UIImage()
    var commentsArray = [String]()
    var likesCount:Int?
    var postUpdated: NSDateFormatter?
//    var postingProfile = Profile()          add once Profile object model has been added
    
    func createPost(addImage:UIImage, timeStamp : NSDateFormatter) {
        self.postedImage = addImage
        self.postUpdated = timeStamp
    }
    
    func addPostToFeed(addImage:UIImage, timeStamp : NSDateFormatter) {
        self.postedImage = addImage
        self.postUpdated = timeStamp
    }
    
    
}
