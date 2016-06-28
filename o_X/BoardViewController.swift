//
//  BoardViewController.swift
//  o_X
//

import UIKit



class BoardViewController: UIViewController {

    
    @IBAction func buttonPush(sender: AnyObject) {
        let numTag: Int = sender.tag
        print("You pushed button number \(numTag)")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func newGameButtonPressed(sender: UIButton) {
        print("New game button pressed.")
    }
    
    // Create additional IBActions here.
    
    
    @IBAction func logOutButton(sender: AnyObject) {
        print("Log Out")
    }

}

