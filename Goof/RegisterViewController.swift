//
//  RegisterViewController.swift
//  Goof
//
//  Created by Adish Padhani on 2/5/16.
//  Copyright © 2016 mobilemakers. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailUsernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var repeatPasswordTextfield: UITextField!
    
    let ref = Firebase(url: "https://goof-app.firebaseio.com")
    
    override func viewDidLoad() {
        super.viewDidLoad()

               tabBarController?.tabBar.hidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLoginButtonTapped(sender: UIButton) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onRegisterButtonTapped(sender: AnyObject) {
    
        let emailUsername = self.emailUsernameTextfield.text
        let password = self.passwordTextfield.text
        let repeatPassword = self.repeatPasswordTextfield.text
        
        if emailUsername!.isEmpty || password!.isEmpty || repeatPassword!.isEmpty{
        
            self.alert("Empty Field(s)")
            return
        }
        
        if repeatPassword != password{
            self.alert("Passwords Do Not Match")
            return
        }
        
        
        //let newProfile = Profile.init(inputUsername: emailUsername!, inputPassword: password!)
        
        //NSUserDefaults.standardUserDefaults().setObject(emailUsername, forKey: "userEmail")
        //NSUserDefaults.standardUserDefaults().setObject(password, forKey: "userPassword")
        //NSUserDefaults.standardUserDefaults().setObject(nil, forKey: "userProfileImage")
        
        //NSUserDefaults.standardUserDefaults().synchronize()
        
        
        // authenticates an email account in firebase
        ref.createUser(emailUsername, password: password) { (error: NSError!) -> Void in
            if error ==  nil{
                self.ref.authUser(emailUsername, password: password, withCompletionBlock: { (error: NSError!, auth: FAuthData!) -> Void in
                    
                    if error != nil {
                        self.alert("There has been an error")
                    }else{
                        //once authenticated, load username into data
                        let fullUsername = emailUsername
                        let fullUserameArr = fullUsername!.characters.split{$0 == "@"}.map(String.init)
                        let justUsername = fullUserameArr[0]
                        
                        let newProfile = Profile.init(inputUsername: justUsername)

                        let userRef = self.ref.childByAppendingPath(justUsername)
                        
                        userRef.setValue(newProfile.toAnyObject())
                    }
                    
                })
                
            }else{
                self.alert("There has been an error")
            }
        }
        
        
        
        
        
        
    
    }
    
    func alert(text: String){
        
        let myAlert = UIAlertController(title: "WAIT", message: text, preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.presentViewController(myAlert, animated: true, completion: nil)
    
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
