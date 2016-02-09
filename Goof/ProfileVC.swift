//
//  ProfileVC.swift
//  Goof
//
//  Created by Michael Saltzman on 2/5/16.
//  Copyright © 2016 mobilemakers. All rights reserved.
//

import UIKit
import ImagePicker
import Firebase

class ProfileVC: UIViewController, ImagePickerDelegate {
    
    let ref = Firebase(url: "https://goof-app.firebaseio.com")
    
    @IBOutlet weak var profilePictureButtonLabel: UIButton!

    @IBAction func onProfileImageButtonTapped(sender: AnyObject) {
        
        let imagePickerController = ImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.imageLimit = 1
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func wrapperDidPress(images: [UIImage]){
        
    }
    
    func cancelButtonDidPress(){
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func doneButtonDidPress(images: [UIImage]){
        
        self.dismissViewControllerAnimated(true) { () -> Void in
            
            NSUserDefaults.standardUserDefaults().setObject(images[0], forKey: "userProfileImage")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            self.profilePictureButtonLabel.setImage(images[0], forState: .Normal)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
