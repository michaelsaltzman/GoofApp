//
//  Profile.swift
//  Goof
//
//  Created by Adish Padhani on 2/4/16.
//  Copyright © 2016 mobilemakers. All rights reserved.
//

import Foundation
import UIKit


class Profile: NSObject {
    var username: String?
    var password: String?
    var arrayOfPosts = [] // type Posts
    var friendsArray = [] // type Profile
    var profileImage: UIImage?
    var profileLastUpdated: NSDate?
    
    
    init(inputUsername : String, inputPassword : String, profilePicture : UIImage) {
        self.username = inputUsername
        self.password = inputPassword
        self.profileImage = profilePicture
    }
    
    func updateProfileData(updatedUsername : String, updatedPassword : String) {
        self.username = updatedUsername
        self.password = updatedPassword
    }
    
    func updateProfilePicture(updatedPicture : UIImage) {
        self.profileImage = updatedPicture
    }
    
    func addPost(newPost : Posts, timeStamp : NSDate) {
        
        self.arrayOfPosts.arrayByAddingObject(newPost)
        self.profileLastUpdated = timeStamp
    }
    
    func deletePost(postToDelete : Posts) {
        self.arrayOfPosts.delete(postToDelete)
    }
    
    func addFriend(newFriend : Profile) {
        self.friendsArray.arrayByAddingObject(newFriend)
    }
    
    func deleteFriend(friendToDelete : Profile) {
        self.friendsArray.delete(friendToDelete)
    }
    
}


