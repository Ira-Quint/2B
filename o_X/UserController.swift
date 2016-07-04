//
//  UserController.swift
//  o_X
//
//  Created by Ira Quint on 6/30/16.
//  Copyright © 2016 iX. All rights reserved.
//

import Foundation

class UserController {
    
    static var sharedInstance: UserController = UserController()
    
    private init() {
        
    }
    
    private var users = [User]()
    
    var currentUser: User?
    
    func register(email email: String, password: String, onCompletion: (User?, String?) -> Void) {
        
        for user in users {
            if user.email == email {
                onCompletion(nil, "Error: email is already being used")
                return
            }
        }
        
        if password.characters.count >= 6 {
            let user = User()
            user.email = email
            user.password = password
            currentUser = user
            
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(email, forKey: "CurrentUserEmail")
            defaults.setObject(password, forKey: "CurrentUserPassword")
            defaults.synchronize()
            
            users.append(currentUser!)
            onCompletion(currentUser, nil)
        }
        else {
            onCompletion(nil, "Error: password needs to be more than 6 characters")
        }
    }
    func login(email email: String, password: String, onCompletion: (User?, String?) -> Void) {
        
        for user in users {
            if (user.email == email && user.password == password) {
                currentUser = user
                
                let defaults = NSUserDefaults.standardUserDefaults()
                defaults.setObject(email, forKey: "CurrentUserEmail")
                defaults.setObject(password, forKey: "CurrentUserPassword")
                defaults.synchronize()
                
                onCompletion(user, nil)
                return
            }
            
        }
        
        onCompletion(nil, "Error, your username or password is incorrect")

    }
    
    func logout(onCompletion onCompletion: (String?) -> Void) {
        currentUser = nil
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.removeObjectForKey("CurrentUserEmail")
        defaults.removeObjectForKey("CurrentUserPassword")
    }
}



// It’s time to modify the UserController. In the login and register methods, use NSUserDefaults to set two String values, representing the currently logged in user’s email and password. Use reasonable keys, such as “currentUserEmail” and “currentUserPassword”.