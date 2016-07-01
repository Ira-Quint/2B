//
//  RegisterViewController.swift
//  o_X
//
//  Created by Ira Quint on 7/1/16.
//  Copyright © 2016 iX. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBAction func registerPushed(sender: AnyObject) {
        
        UserController.sharedInstance.register(email:emailField.text!, password: passwordField.text!) { (user: User?, test: String?) -> Void in
                
            if user == nil {
                
                let alert = UIAlertController (title: "Error: Please try again", message: "", preferredStyle: .Alert)
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

