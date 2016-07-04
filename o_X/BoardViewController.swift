//
//  BoardViewController.swift
//  o_X
//

import UIKit



class BoardViewController: UIViewController {

    @IBOutlet weak var boardView: UIView!
    
    @IBOutlet weak var newGameOutlet: UIButton!
    
    override func viewDidAppear(animated: Bool) {
        restartGame()
        newGameOutlet.hidden = true
        updateUI()
    }
    
    @IBAction func LogoutPushed(sender: AnyObject) {
        
        UserController.sharedInstance.logout(onCompletion: { message in
            let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
            let viewController = storyboard.instantiateInitialViewController()
            let application = UIApplication.sharedApplication()
            let window = application.keyWindow
            window?.rootViewController = viewController
        })
    
    }
    
    @IBAction func buttonPush(sender: UIButton) {
        
        let cellVal = OXGameController.sharedInstance.playMove(sender.tag).rawValue
        sender.setTitle(cellVal, forState: .Normal)
        sender.userInteractionEnabled = false
        
        let stateOfGame = OXGameController.sharedInstance.getCurrentGame().state()
        
        if stateOfGame == .InProgress {
            return // quits function
        }
    
        // Game is over, disallows button use
        for view in boardView.subviews {
            if let button = view as? UIButton {
                button.userInteractionEnabled = false
            }
        }
        
        let message = (stateOfGame == .Won) ? "\(cellVal) has won!" : "It's a tie!"
        
        let alert = UIAlertController (title: "Game Over", message: message, preferredStyle: .Alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .Default, handler: { (action) in
            
            self.newGameOutlet.hidden = false
            
        })
        
        alert.addAction(dismissAction)
        presentViewController(alert, animated: true, completion: nil)
    }

    func restartGame() {
        OXGameController.sharedInstance.getCurrentGame().reset()
        for view in boardView.subviews {
            if let button = view as? UIButton {
                button.setTitle("", forState: .Normal)
                button.userInteractionEnabled = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func newGameButtonPressed(sender: UIButton) {
        restartGame()
        self.newGameOutlet.hidden = true
    }
    
    
    // Assumes that other player has played move--updates boardView with all moves from both sides
    func updateUI() {
        let game = OXGameController.sharedInstance.getCurrentGame()
        let board = game.board
        
        for subview in boardView.subviews {
            if let button = subview as? UIButton {
                button.setTitle(board[button.tag].rawValue, forState: .Normal)
            }
        }
        
    }

}

