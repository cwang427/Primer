//
//  ViewController.swift
//  PrimePrep
//
//  Created by Cassidy Wang on 10/17/15.
//  Copyright © 2015 Cassidy Wang. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    var sentences = [[[String]]]()
    var level = 1
    var sentenceCounter = 0
    
    var timer: NSTimer?
    var timerStartDate: NSDate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateSentences()
        shuffleSentences()
        setup()
        scoreCounter.adjustsFontSizeToFitWidth = true
        scoreCounter.text = "Level \(level)/7"
        input1.titleLabel?.adjustsFontSizeToFitWidth = true
        input2.titleLabel?.adjustsFontSizeToFitWidth = true
        input3.titleLabel?.adjustsFontSizeToFitWidth = true
        input4.titleLabel?.adjustsFontSizeToFitWidth = true
        input5.titleLabel?.adjustsFontSizeToFitWidth = true
        input6.titleLabel?.adjustsFontSizeToFitWidth = true
        display1.titleLabel?.adjustsFontSizeToFitWidth = true
        display2.titleLabel?.adjustsFontSizeToFitWidth = true
        display3.titleLabel?.adjustsFontSizeToFitWidth = true
        display4.titleLabel?.adjustsFontSizeToFitWidth = true
        stopwatch.adjustsFontSizeToFitWidth = true
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "timerTick", userInfo: nil, repeats: true)
        self.timerStartDate = NSDate()
        
    }
    
    func stopTimer() {
        timer?.invalidate()
    }
    
    func timerTick() {
        let now = NSDate()
        stopwatch.text = "\(Double(round(10 * now.timeIntervalSinceDate(timerStartDate))/10))"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var display1: UIButton!
    @IBOutlet weak var display2: UIButton!
    @IBOutlet weak var display3: UIButton!
    @IBOutlet weak var display4: UIButton!
    @IBOutlet weak var input1: UIButton!
    @IBOutlet weak var input2: UIButton!
    @IBOutlet weak var input3: UIButton!
    @IBOutlet weak var input4: UIButton!
    @IBOutlet weak var input5: UIButton!
    @IBOutlet weak var input6: UIButton!
    @IBOutlet weak var scoreCounter: UILabel!
    @IBOutlet weak var stopwatch: UILabel!
    
    func generateSentences() {
        sentences.append([["What", "A", "Wonderful", "Morning", "Hello", "George"], ["What A Wonderful Morning"]])
        sentences.append([["Fearless", "Skydivers", "Jump", "First", "Chip", "Boots"], ["Fearless Skydivers Jump First"]])
        sentences.append([["Claire", "Confidently", "Sings", "Songs", "Tea", "Sparkle"], ["Claire Confidently Sings Songs"]])
        sentences.append([["Strong", "Leaders", "Act", "Decisively", "Oil", "Pride"], ["Strong Leaders Act Decisively"]])
        sentences.append([["Intelligent", "Robots", "Play", "Soccer", "Chocolate", "Mud"], ["Intelligent Robots Play Soccer"]])
        sentences.append([["Fastest", "Runner", "Wins", "Trophy", "Above", "Eyebrows"], ["Fastest Runner Wins Trophy"]])
        sentences.append([["Courageous", "Firefighters", "Save", "People", "Below", "Banana"], ["Courageous Firefighters Save People"]])
    }
    
    func shuffleSentences() {
        sentences.shuffleInPlace()
    }
    
    //Set up view
    func setup() {
        sentences[sentenceCounter][0].shuffleInPlace()
        input1.setTitle(sentences[sentenceCounter][0][0], forState: UIControlState.Normal)
        input2.setTitle(sentences[sentenceCounter][0][1], forState: UIControlState.Normal)
        input3.setTitle(sentences[sentenceCounter][0][2], forState: UIControlState.Normal)
        input4.setTitle(sentences[sentenceCounter][0][3], forState: UIControlState.Normal)
        input5.setTitle(sentences[sentenceCounter][0][4], forState: UIControlState.Normal)
        input6.setTitle(sentences[sentenceCounter][0][5], forState: UIControlState.Normal)
    }
    
    //Reset view
    func reset() {
        clearDisplay(display1)
        clearDisplay(display2)
        clearDisplay(display3)
        clearDisplay(display4)
    }
    
    //New sentence builder
    func newScramble() {
        
    }
 
    //Update display upon pressing button. Check result once 4 fields are filled
    var hiddenButtons = Array<UIButton>()
    @IBAction func addWord(sender: UIButton) {
        if (display1.currentTitle! == " ") {
            display1.setTitle(sender.currentTitle!, forState: UIControlState.Normal)
            hiddenButtons.append(sender)
            sender.hidden = true
        } else if display2.currentTitle! == " " {
            display2.setTitle(sender.currentTitle!, forState: UIControlState.Normal)
            hiddenButtons.append(sender)
            sender.hidden = true
        } else if display3.currentTitle! == " " {
            display3.setTitle(sender.currentTitle!, forState: UIControlState.Normal)
            hiddenButtons.append(sender)
            sender.hidden = true
        } else if display4.currentTitle! == " " {
            display4.setTitle(sender.currentTitle!, forState: UIControlState.Normal)
            hiddenButtons.append(sender)
            sender.hidden = true
            evaluateResult()
        }
    }

    //Clear display when display is touched
    @IBAction func clearDisplay(sender: UIButton) {
        for button in hiddenButtons {
            if (button.currentTitle! == sender.currentTitle!) {
                button.hidden = false
            }
        }
        sender.setTitle(" ", forState: UIControlState.Normal)
    }

    //Check if user input is the same as correct string
    func evaluateResult() {
        let userAnswer = display1.currentTitle! + " " + display2.currentTitle! + " "
            + display3.currentTitle! + " " + display4.currentTitle!
        if userAnswer == sentences[sentenceCounter][1][0] {
            level += 1
            scoreCounter.text = "Level \(level)/7"
            sentenceCounter += 1
            if sentenceCounter != sentences.count {
                reset()
                setup()
                let alert = UIAlertController(title: "BRUH", message: "NICE JOB! YOU GOT IT!", preferredStyle: .Alert)
                
                alert.addAction(UIAlertAction(title: "Next scramble", style: .Default, handler: {_ in}))
                
                self.presentViewController(alert, animated: true, completion: nil)
            } else {
                stopTimer()
                presentEndControllerInController(self, withTime: stopwatch.text!)
            }
        } else {
            reset()
            let alert = UIAlertController(title: "OOPS!", message: "Pls try again :D", preferredStyle: .Alert)
            
            alert.addAction(UIAlertAction(title: "Try Again", style: .Default, handler: {_ in}))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
}