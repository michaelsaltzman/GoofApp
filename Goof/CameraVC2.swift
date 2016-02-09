//
//  CameraVC2.swift
//  Goof
//
//  Created by Adish Padhani on 2/8/16.
//  Copyright © 2016 mobilemakers. All rights reserved.
//

import UIKit
import ImagePicker

class CameraVC2: UIViewController, ImagePickerDelegate {

    let imagePickerController = ImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBarController?.tabBar.hidden = true
    }
    
    override func viewDidAppear(animated: Bool) {
        imagePickerController.delegate = self
        imagePickerController.imageLimit = 1
        presentViewController(imagePickerController, animated: true, completion: nil)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func wrapperDidPress(images: [UIImage]){
        
    }
    
    
    func doneButtonDidPress(images: [UIImage]){
        
//        self.dismissViewControllerAnimated(true) { () -> Void in
//            //self.performSegueWithIdentifier("razaAssSegue", sender: images[0])
//        let vc = PostImageVC()
//        self.presentViewController(vc, animated: true, completion: nil)
//            vc.imageToPost = images[0]
//        }
        
        self.dismissViewControllerAnimated(true) { () -> Void in
            self.performSegueWithIdentifier("razaSegue", sender: images[0])
        }

    }
    
    
    func cancelButtonDidPress(){
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "razaSegue" {
            let vc = segue.destinationViewController as! PostImageVC
            vc.imageToPost = sender as! UIImage
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
