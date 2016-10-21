//
//  Schedule.swift
//  Class Times
//
//  Created by Xander Clair on 10/21/16.
//  Copyright © 2016 Xander Clair. All rights reserved.
//

import Foundation

enum Weekday {
    case Monday, Tuesday, Wednesday, Thurday, Friday, Saturday, Sunday
}

enum Lunch {
    case LunchA, LunchB
}

class Schedule {
    var times = [Int: Course]()
    init(forDay day: Weekday, withCourses courses: [Int: Course]) {
        
    }
}

class Course {
    var name : String
    var lunch : Lunch
    init(name: String, forLunch lunch: Lunch) {
        self.name = name
        self.lunch = lunch
    }
}

struct TimeRange {
    let start: Time
    let end: Time
    init(start: Time, end: Time) {
        self.start = start
        self.end = end
    }
}

struct Time: Comparable {
    let seconds: Double
    init(withSecondsValue seconds: Double) {
        self.seconds = seconds
    }
    init(withTimeString string: String) {
        var components = ["", "", ""]
        var selector = 0
        for char in string.characters {
            if char != ":" && char != " " {
                components[0] += String(char)
            }
            else {
                if char == " " {
                    selector += 1

                }

            }
        }
        let hours = Int(components[0])
        let minutes = Int(components[1])
        if components[2] == "" {
            let seconds = 0
        }
        else {
            let seconds = Int(components[2])
        }
        
    }
    init() {
        let cal = NSCalendar(identifier: NSCalendar.Identifier.gregorian)
        let time = cal?.startOfDay(for: Date())
        self.seconds = (time?.timeIntervalSinceNow)! as Double
    }
    static func <(lhs: Time, rhs: Time) -> Bool {
        return lhs.seconds < rhs.seconds
    }
    static func >(lhs: Time, rhs: Time) -> Bool {
        return lhs.seconds > rhs.seconds
    }
    static func <=(lhs: Time, rhs: Time) -> Bool {
        return lhs.seconds <= rhs.seconds
    }
    static func >=(lhs: Time, rhs: Time) -> Bool {
        return lhs.seconds >= rhs.seconds
    }
    static func ==(lhs: Time, rhs: Time) -> Bool {
        return lhs.seconds == rhs.seconds
    }
}
