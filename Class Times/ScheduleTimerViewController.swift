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

class ScheduleTimerViewController: UIViewController, TimeLeftDataSource {

    @IBOutlet weak var timeLeftView: TimeLeftView! {
        didSet {
            timeLeftView.dataSource = self
        }
    }
    
    var timer: Timer?
    var today = Schedule(forDay: TimeInfo.currentWeekday!, withCourses: Test.testCourses)
    
    
    struct Constants {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let interval = 0.01
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    
    func update() {
        timeLeftView.setNeedsDisplay()
    }
    
    func getFilledAngle() -> CGFloat? {
        if let courseAndTime = today.getCurrentClass(time: TimeInfo.currentTime) {
            let timeRange = courseAndTime.0
            let current = TimeInfo.currentTime
            //let nanos = (current.seconds/5.0 - Double(Int(current.seconds/5.0)))*2.0*M_PI
            let portion = timeRange.getPortionDone(time: current)!*2.0*M_PI
            return CGFloat(portion)
        }
        else {
            return nil
        }
     }

}
