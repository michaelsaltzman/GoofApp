//
//  FeedVC.swift
//  Goof
//
//  Created by Michael Saltzman on 2/8/16.
//  Copyright © 2016 mobilemakers. All rights reserved.
//

import UIKit
import Firebase

class FeedVC: UIViewController {

    let ref = Firebase(url: "https://goof-app.firebaseio.com")
    
    @IBOutlet weak var tempImageView: UIImageView!
    
    var incomingNewPostImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       tempImageView.image = incomingNewPostImage
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToFeed(segue: UIStoryboardSegue, post: Posts) {}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
