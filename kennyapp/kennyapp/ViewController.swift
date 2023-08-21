//
//  ViewController.swift
//  kennyapp
//
//  Created by İsmail Tunç Kankılıç on 21.08.2023.
//

import UIKit

class ViewController: UIViewController {
    //Ints
    var score = 0
    var counter = 0
    var highScore = 0
    //Timers
    var timer = Timer()
    var hideTimer = Timer()
    //Typed Array
    var tuncArray = [UIImageView]()
    //Views
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var highscoreLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var tunc1: UIImageView!
    @IBOutlet weak var tunc2: UIImageView!
    @IBOutlet weak var tunc3: UIImageView!
    @IBOutlet weak var tunc4: UIImageView!
    @IBOutlet weak var tunc5: UIImageView!
    @IBOutlet weak var tunc6: UIImageView!
    @IBOutlet weak var tunc7: UIImageView!
    @IBOutlet weak var tunc8: UIImageView!
    @IBOutlet weak var tunc9: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //Highscore Check
        let storedHighscore = UserDefaults.standard.object(forKey: "highscore")
        if storedHighscore == nil{
            highScore = 0
            highscoreLabel.text = "HighScore: \(highScore)"
        }
        if let newScore = storedHighscore as? Int {
            highScore = newScore
            highscoreLabel.text = "HighScore: \(highScore)"
        }
        //Score Label Modification
        scoreLabel.text = "Score: \(score)"
        //Gesture Permissions
        tunc1.isUserInteractionEnabled=true
        tunc2.isUserInteractionEnabled=true
        tunc3.isUserInteractionEnabled=true
        tunc4.isUserInteractionEnabled=true
        tunc5.isUserInteractionEnabled=true
        tunc6.isUserInteractionEnabled=true
        tunc7.isUserInteractionEnabled=true
        tunc8.isUserInteractionEnabled=true
        tunc9.isUserInteractionEnabled=true
        //Gesture Creation
        let recognizer1=UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2=UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3=UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4=UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5=UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6=UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7=UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8=UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9=UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        //Gesture implementation
        tunc1.addGestureRecognizer(recognizer1)
        tunc2.addGestureRecognizer(recognizer2)
        tunc3.addGestureRecognizer(recognizer3)
        tunc4.addGestureRecognizer(recognizer4)
        tunc5.addGestureRecognizer(recognizer5)
        tunc6.addGestureRecognizer(recognizer6)
        tunc7.addGestureRecognizer(recognizer7)
        tunc8.addGestureRecognizer(recognizer8)
        tunc9.addGestureRecognizer(recognizer9)
        //Array Remastered
        tuncArray = [tunc1,tunc2,tunc3,tunc4,tunc5,tunc6,tunc7,tunc8,tunc9]
        //Timer
        counter = 10
        timeLabel.text = String(counter)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:  #selector(countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideTunc),userInfo: nil,repeats: true)
        //functions
        hideTunc()
    }
    
   @objc func hideTunc(){
        for tunc in tuncArray{
            tunc.isHidden = true
        }
        //Gives random number in target number count
        let random = Int(arc4random_uniform(UInt32(tuncArray.count-1)))
        tuncArray[random].isHidden = false
    }

    
    @objc func countDown(){
        counter -= 1
        timeLabel.text = String(counter)
        if counter == 0 {
                timer.invalidate()
                hideTimer.invalidate()
            for tunc in tuncArray{
                tunc.isHidden = true
            }
            
                //High Score
            if self.score > self.highScore {
                self.highScore = self.score
                highscoreLabel.text = "High Score: \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highscore")
            }
            
                //Alert
                let alert = UIAlertController(title: "Time is Up", message: "Do you want to play again", preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel,handler: nil)
                let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default,handler: {
                (UIAlertAction) in
                    self.score = 0
                    self.scoreLabel.text = "Score: \(self.score)"
                    self.counter = 10
                    self.timeLabel.text = String(self.counter)
                    self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:  #selector(self.countDown), userInfo: nil, repeats: true)
                    self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideTunc),userInfo: nil,repeats: true)
                    
                }
            )
            //Alert implementation
            alert.addAction(okButton)
            alert.addAction(replayButton)
            //Showing Alert
            self.present(alert,animated: true,completion: nil)
        }
    }
    
    @objc func increaseScore(){
        score += 1
        scoreLabel.text = "Score: \(score)"
    }


}

