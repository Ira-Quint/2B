//
//  BoardViewController.swift
//  o_X
//

import UIKit



class BoardViewController: UIViewController {

    
    @IBAction func buttonPush(sender: AnyObject) {
        let numTag: Int = sender.tag
        let title = OXGameController.sharedInstance.getCurrentGame().whoseTurn().rawValue
        sender.setTitle(title, forState: .Normal)
        OXGameController.sharedInstance.playMove(numTag)
        
        var stateOfGame: OXGameState = OXGameController.sharedInstance.getCurrentGame().state()
        
        if OXGameController.sharedInstance.getCurrentGame().gameWon() {
            let x: CellType = OXGameController.sharedInstance.getCurrentGame().playMove(sender.tag-1)
            sender.setTitle(x.rawValue, forState: .Normal)
            if (OXGameController.sharedInstance.getCurrentGame().state() == OXGameState.Won) {
                print("\(x) Won")
            }
            if (OXGameController.sharedInstance.getCurrentGame().state() == OXGameState.Tie) {
                print("The game is tied")
            }
        //sender.enabled = false
            
        }
        
        //If someone won the game, log a victorious message with the winner's name.
        //If the game is tied, log a message saying the game was tied.
        //After the game is ended restart the game (clear the board).
        


    }
    

    func restartGame() {
        OXGameController.sharedInstance.getCurrentGame().reset()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func newGameButtonPressed(sender: UIButton) {
        restartGame()
    }
    
    // Create additional IBActions here.
    
    
    @IBAction func logOutButton(sender: AnyObject) {
        print("Log Out")
    }

}

