//
//  EndViewController.swift
//  Prime Time
//
//  Created by Yido Jang on 10/18/15.
//  Copyright © 2015 Yido Jang. All rights reserved.
//

import Foundation
import UIKit

class EndViewController : UIViewController {
    
    var time: String!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        self.timeLabel.text = time
    }
    
}

func presentEndControllerInController(presenter: UIViewController, withTime time: String) {
    
    
    let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("end") as! EndViewController
    
    controller.time = time
    
    presenter.presentViewController(controller, animated: true, completion: nil)
    
}