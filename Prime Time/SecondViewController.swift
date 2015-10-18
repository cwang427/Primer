//
//  SecondViewController.swift
//  Prime Time
//
//  Created by Yido Jang on 10/18/15.
//  Copyright © 2015 Yido Jang. All rights reserved.
//

import Foundation
import UIKit
import GameKit

var wordBank:[String] = ["I", "eat", "the", "pizza", "confident"]
var holder:[String] = ["", "", "", "", ""]
var answer:[String] = ["I", "eat", "the", "pizza"]

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var display1: UIButton!
    @IBOutlet weak var display2: UIButton!
    @IBOutlet weak var display3: UIButton!
    @IBOutlet weak var display4: UIButton!
    @IBOutlet weak var display5: UIButton!
    
    override func viewDidLoad() {
        
        
        display1.setTitle(wordBank[0], forState: UIControlState.Normal)
        display2.setTitle(wordBank[3], forState: UIControlState.Normal)
        display3.setTitle(wordBank[2], forState: UIControlState.Normal)
        display4.setTitle(wordBank[1], forState: UIControlState.Normal)
        display5.setTitle(wordBank[4], forState: UIControlState.Normal)

        print(wordBank)
        wordBank.shuffleInPlace()
        print(wordBank)
    //        print(wordBank.shuffleInPlace())
        
    }
}