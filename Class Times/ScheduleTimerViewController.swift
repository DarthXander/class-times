//
//  ViewController.swift
//  Class Times
//
//  Created by Xander Clair on 10/18/16.
//  Copyright © 2016 Xander Clair. All rights reserved.
//

import UIKit

class ScheduleTimerViewController: UIViewController {

    @IBOutlet var textView: UITextView!

    struct Constants {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = TimeInfo.getCurrentTime().toString()
    }
    
    func setup() {
        
    }

}
