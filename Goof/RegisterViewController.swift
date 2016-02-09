//
//  RegisterViewController.swift
//  Goof
//
//  Created by Adish Padhani on 2/5/16.
//  Copyright © 2016 mobilemakers. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailUsernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var repeatPasswordTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onRegisterButtonTapped(sender: AnyObject) {
    
        let emailUsername = self.emailUsernameTextfield.text
        let password = self.passwordTextfield.text
        let repeatPassword = self.repeatPasswordTextfield.text
        
        if emailUsername!.isEmpty || password!.isEmpty || repeatPassword!.isEmpty{
        
            self.alert("Empty Fields")
            return
        }
        
        if repeatPassword != password{
            self.alert("Passwords Do Not Match")
            return
        }
        
        NSUserDefaults.standardUserDefaults().setObject(emailUsername, forKey: "userEmail")
        NSUserDefaults.standardUserDefaults().setObject(password, forKey: "userPassword")
        NSUserDefaults.standardUserDefaults().synchronize()
    
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
