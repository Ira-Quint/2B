//
//  LoginViewController.swift
//  o_X
//
//  Created by Ira Quint on 7/1/16.
//  Copyright © 2016 iX. All rights reserved.
//

import UIKit
import Foundation

class LoginViewController: UIViewController{

    @IBOutlet weak var email_Field: UITextField!
    
    @IBOutlet weak var password_Field: UITextField!

    @IBAction func LogonPushed(sender: AnyObject) {
        UserController.sharedInstance.login(email:email_Field.text!, password: password_Field.text!) { (user: User?, test: String?) -> Void in
            
            if user == nil {
                
                let alert = UIAlertController (title: "Error: that user/password combination does not exist", message: "", preferredStyle: .Alert)
                let dismissAction = UIAlertAction(title: "Dismiss", style: .Default, handler: { (action) in
                    
                })
                
                alert.addAction(dismissAction)
                self.presentViewController(alert, animated: true, completion: nil)
                
            }
                
            else {
                
                let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
                let b = mainStoryBoard.instantiateInitialViewController()
                let application = UIApplication.sharedApplication()
                let window = application.keyWindow
                window?.rootViewController = b
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}