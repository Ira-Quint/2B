//
//  BoardViewController.swift
//  o_X
//

import UIKit



class BoardViewController: UIViewController {

    @IBOutlet weak var boardView: UIView!
    
    override func viewDidAppear(animated: Bool) {
        restartGame()
    }
    
    @IBAction func buttonPush(sender: UIButton) {
        let numTag: Int = sender.tag
        sender.setTitle(OXGameController.sharedInstance.playMove(numTag).rawValue, forState: .Normal)
        sender.enabled = false
        
        
        var stateOfGame: OXGameState = OXGameController.sharedInstance.getCurrentGame().state()
        
        if OXGameController.sharedInstance.getCurrentGame().gameWon() {
            if (OXGameController.sharedInstance.getCurrentGame().turnCount() % 2 == 1) {
                print ("X has won")
            }
            else {
                print("O has won")
            }
        }
        






            /*let x: CellType = OXGameController.sharedInstance.getCurrentGame().playMove(sender.tag-1)
            sender.setTitle(x.rawValue, forState: .Normal)
            if (OXGameController.sharedInstance.getCurrentGame().state() == OXGameState.Won) {
                print("\(x) Won")
            }
            if (OXGameController.sharedInstance.getCurrentGame().state() == OXGameState.Tie) {
                print("The game is tied")
            }
 */
            
    //}
    
        //If someone won the game, log a victorious message with the winner's name.
        //If the game is tied, log a message saying the game was tied.
        //After the game is ended restart the game (clear the board).
        


    }
    

    func restartGame() {
        OXGameController.sharedInstance.getCurrentGame().reset()
        for view in boardView.subviews {
            if let button = view as? UIButton {
                button.setTitle("", forState: .Normal)
                button.enabled = true
            }
        }
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

