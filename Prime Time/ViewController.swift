//
//  ViewController.swift
//  Prime Time
//
//  Created by Yido Jang on 10/17/15.
//  Copyright © 2015 Yido Jang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(animated: Bool) {
        //presentEndControllerInController(self, withTime: "13.5")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
}

