//
//  ViewController.swift
//  Class Times
//
//  Created by Xander Clair on 10/18/16.
//  Copyright © 2016 Xander Clair. All rights reserved.
//

import UIKit

class Test {
    static let testCourses: [Period: Course] = [
    .one: Course(name: "AP English 3", forLunch: .lunchA),
    .two: Course(name: "Morality", forLunch: .lunchB),
    .three: Course(name: "Spanish IV", forLunch: .lunchA),
    .four: Course(name: "AP US History", forLunch: .lunchB),
    .five: Course(name: "Advanced Topics", forLunch: .lunchB),
    .six: Course(name: "Multivariable Calculus", forLunch: .lunchB),
    .seven: Course(name: "Honors Chemistry", forLunch: .lunchB)]
}

class ScheduleTimerViewController: UIViewController {

    @IBOutlet var textView: UITextView!

    var today = Schedule(forDay: TimeInfo.currentWeekday!, withCourses: Test.testCourses)
    
    struct Constants {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = today.getCurrentClass(time: TimeInfo.currentTime)?.1.name {
            textView.text = name
        }
        else {
            textView.text = "Not in Class"
        }
    }
    
    func getFilledAngle() -> CGFloat {
        return CGFloat(0.0)
    }

}
