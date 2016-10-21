//
//  ViewController.swift
//  Class Times
//
//  Created by Xander Clair on 10/18/16.
//  Copyright © 2016 Xander Clair. All rights reserved.
//

import UIKit

class ScheduleTimerViewController: UIViewController {
    
    struct Constants {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let noon = Time(fromString: "12:00 PM")
        print(noon.toString())
    }
    
    func setup() {
        
    }

}
