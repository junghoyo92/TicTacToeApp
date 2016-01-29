//
//  ViewController.swift
//  TicTacToe
//
//  Created by Hoyoung Jung on 1/24/16.
//  Copyright © 2016 Hoyoung Jung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button: UIButton!
    
    @IBOutlet var result: UILabel!
    @IBOutlet var msuScore: UILabel!
    @IBOutlet var uofmScore: UILabel!
    var msuScoreTotal = 0
    var uofmScoreTotal = 0
    
    @IBOutlet var rematchButton: UIBarButtonItem!
    
    @IBAction func rematchButtonAction(sender: AnyObject) {
        
        gameState = [0,0,0,0,0,0,0,0,0]
        gameActive = true
        activePlayer = 1
        result.hidden = true
        result.center = CGPointMake(result.center.x-500, result.center.y)
        
        var buttonToClear : UIButton
        
        for var i = 0; i < 9; i++ {
            buttonToClear = view.viewWithTag(i) as! UIButton
            buttonToClear.setImage(nil, forState: .Normal)
        }
        
    }
    
    var gameActive = true
    
    var activePlayer = 1  // 1 = MSU  &   2 = UofM
    
    var gameState = [0,0,0,0,0,0,0,0,0]
    
    let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    @IBAction func buttonPressed(sender: AnyObject) {
        if gameState[sender.tag] == 0 && gameActive == true {
            gameState[sender.tag] = activePlayer
            if activePlayer == 1 {
                sender.setImage!(UIImage(named: "msu1.png"), forState: .Normal)
                activePlayer = 2
            } else {
                sender.setImage!(UIImage(named: "umich1.png"), forState: .Normal)
                activePlayer = 1
            }
        }
        
        for combination in winningCombinations {
            
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                
                gameActive = false
                if gameState[combination[0]] == 1 {
                    result.backgroundColor = UIColor.greenColor()
                    result.textColor = UIColor.whiteColor()
                    result.text = "Go Green!"
                    msuScoreTotal++
                    msuScore.text = "MSU: \(msuScoreTotal)"
                } else {
                    result.backgroundColor = UIColor.blueColor()
                    result.textColor = UIColor.yellowColor()
                    result.text = "Go Blue!"
                    uofmScoreTotal++
                    uofmScore.text = "UofM: \(uofmScoreTotal)"
                }
                endGame()
            }
            
        }
        
        if gameActive == true {
            gameActive = false
            for buttonState in gameState {
                if buttonState == 0 {
                    gameActive = true
                }
            }
            if gameActive == false {
                result.backgroundColor = UIColor.redColor()
                result.textColor = UIColor.whiteColor()
                result.text = "It's a tie!"
                endGame()
            }
        }
        
    }
    
    func endGame() {
        result.hidden = false
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.result.center = CGPointMake(self.result.center.x+500, self.result.center.y)
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        result.hidden = true
        
        result.center = CGPointMake(result.center.x-500, result.center.y)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}