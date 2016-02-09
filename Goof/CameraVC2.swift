//
//  CameraVC2.swift
//  Goof
//
//  Created by Adish Padhani on 2/8/16.
//  Copyright © 2016 mobilemakers. All rights reserved.
//

import UIKit
import ImagePicker
//import Firebase

class CameraVC2: UIViewController, ImagePickerDelegate {

    //let ref = Firebase(url: "https://goof-app.firebaseio.com")
    
    let imagePickerController = ImagePickerController()
    var cameraDisplayed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBarController?.tabBar.hidden = true

    }
    
    override func viewDidAppear(animated: Bool) {
        if (!self.cameraDisplayed){
            imagePickerController.delegate = self
            imagePickerController.imageLimit = 1
            presentViewController(imagePickerController, animated: true, completion: nil)
            
            self.cameraDisplayed = true
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func wrapperDidPress(images: [UIImage]){
        
    }
    
    
    func doneButtonDidPress(images: [UIImage]){
        
        self.dismissViewControllerAnimated(true) { () -> Void in
            self.performSegueWithIdentifier("razaSegue", sender: images[0])
        }

    }
    
    
    func cancelButtonDidPress(){
        
        //not implemented on storyboard
        self.dismissViewControllerAnimated(true) { () -> Void in
            self.performSegueWithIdentifier("cameraToFeedSegue", sender: nil)
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "razaSegue" {
            let vc = segue.destinationViewController as! PostImageVC
            vc.imageToPost = sender as! UIImage
        }
    }
    
//    func imagePickerController(picker: UIImagePickerController,
//        didFinishPickingMediaWithInfo info: [String : AnyObject]){
//    
//    
//    
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
