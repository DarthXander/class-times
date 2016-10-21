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
    self.times
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
    let seconds: Int
    init(withSecondsValue seconds: Int) {
        self.seconds = seconds
    }
    init() {
        let cal = NSCalendar(identifier: NSCalendar.Identifier.gregorian)
        let time = cal?.startOfDay(for: Date())
        self.seconds = 
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
