//
//  LoginViewController.swift
//  Goof
//
//  Created by Adish Padhani on 2/4/16.
//  Copyright © 2016 mobilemakers. All rights reserved.
//

import UIKit
import LocalAuthentication

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailUsernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        authenticateUser()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    @IBAction func onLoginButtonTapped(sender: UIButton) {
    
        
        let emailUsername = self.emailUsernameTextField.text
        let password = self.passwordTextField.text
        
        let storedEmailUsername = NSUserDefaults.standardUserDefaults().objectForKey("userEmail")
        let storedPassword = NSUserDefaults.standardUserDefaults().objectForKey("userPassword")
        
        if (emailUsername == storedEmailUsername?.stringValue && password == storedPassword?.stringValue){
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "loggedIn")
            NSUserDefaults.standardUserDefaults().synchronize()
            self.dismissViewControllerAnimated(true, completion: nil)
        }else{
            self.alert("Email or Password do not match")
        }
    }
    
    
    func onRegisterButtonTapped(){
        
    }
    
    func alert(text: String){
        
        let myAlert = UIAlertController(title: "WAIT", message: text, preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let retryAction = UIAlertAction(title: "Retry", style: UIAlertActionStyle.Default, handler: nil)
        
        myAlert.addAction(retryAction)
        
        self.presentViewController(myAlert, animated: true, completion: nil)
        
    }
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//        if sender?.identifier == "passedLogin"{
//            let appVC = segue.destinationViewController as! ProfileVC
//        }
//    }
    
    override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        
    }
    
    @IBAction func backToLogin(segue:UIStoryboardSegue){
    
    }
    
    
    
    func authenticateUser(){
        let context : LAContext = LAContext()
        var error: NSError?
        let myLocationReasonString: NSString = "Authentication is required"
        
        if context.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &error){
            
            context.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: myLocationReasonString as String, reply: { (success:Bool, evaluateError: NSError?) -> Void in
                
                if success{
                    NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                        self.loadData()
                    })
                    
                }else{
                    
                    print(evaluateError?.localizedDescription)
                    switch evaluateError!.code{
                    case LAError.SystemCancel.rawValue:
                        print("Authenticantion cancelled by system")
                        
                    case LAError.UserCancel.rawValue:
                        print("Authenticantion cancelled by user")
                        
                    case LAError.UserFallback.rawValue:
                        print("Authenticantion cancelled by system")
                        
                        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                            self.showPasswordAlert()
                        })
                        
                    default:
                        print("Authentification Failed")
                        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                            self.showPasswordAlert()
                        })
                        
                    }
                    
                    
                    
                    
                }
                
            })
        }else{
            switch error!.code{
            case LAError.TouchIDNotEnrolled.rawValue:
                print("TouchID not enrolled")
            case LAError.PasscodeNotSet.rawValue:
                print("Password not set")
            default:
                print("TouchID not available")
                
                
            }
            
            self.showPasswordAlert()
            
        }
        
    }
    
    func loadData(){
        
        print("Load Data")
        
    }
    
    func showPasswordAlert() {
        // New way to present an alert view using UIAlertController
        let alertController : UIAlertController = UIAlertController(title:"TouchID Demo" , message: "Please enter password", preferredStyle: .Alert)
        
        // We define the actions to add to the alert controller
        let cancelAction : UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
            print(action)
        }
        let doneAction : UIAlertAction = UIAlertAction(title: "Done", style: .Default) { (action) -> Void in
            let passwordTextField = alertController.textFields![0] as UITextField
            self.login(passwordTextField.text!)
            
        }
        
        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Password"
            textField.secureTextEntry = true
            
            NSNotificationCenter.defaultCenter().addObserverForName(UITextFieldTextDidChangeNotification, object: textField, queue: NSOperationQueue.mainQueue(), usingBlock: { (notification) -> Void in
                doneAction.enabled = textField.text != ""
            })
            
        }
        
        doneAction.enabled = false
        

        
        alertController.addAction(cancelAction)
        alertController.addAction(doneAction)
        self.presentViewController(alertController, animated: true) {
            // Nothing to do here
        }
        
    }
    
    func login(password: String) {
        if password == "weloveprolific" {
            self.loadData()
        } else {
            self.showPasswordAlert()
        }
    }

}
