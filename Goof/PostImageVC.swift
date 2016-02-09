//
//  PostImageVC.swift
//  Goof
//
//  Created by Adish Padhani on 2/8/16.
//  Copyright © 2016 mobilemakers. All rights reserved.
//

import UIKit

class PostImageVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var imageToPost = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = imageToPost
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPostButtonTapped(sender: UIButton) {
        

 
    }
    
    
    @IBAction func onCancelButtonTapped(sender: UIButton) {
        
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let date = NSDate()
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        formatter.stringFromDate(date)
        let newPost = Posts.init(addImage: imageToPost, timeStamp: formatter)
        let vc = segue.destinationViewController as! FeedVC
        vc.incomingNewPostImage = imageToPost
        
    }
    

}
