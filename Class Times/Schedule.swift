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
    init(fromDouble seconds: Double) {
        self.seconds = seconds
    }
    init(fromString string: String) {
        var components = ["", "", "", ""]
        var selector = 0
        for char in string.characters {
            if char != ":" && char != " " {
                components[selector] += String(char)
            }
            else {
                if char == ":" {
                    selector += 1
                }
                else if char == " " {
                    selector = 3
                }
            }
        }
        let hours: Int = Int(components[0])!
        let minutes: Int = Int(components[1])!
        let secs = components[2] == "" ? 0 : Int(components[2])!
        let amPm = components[3].lowercased()
        let pmHours = amPm == "pm" ? 12 : 0
        self.seconds = Double(secs + 60*(minutes + (pmHours + hours)*60))
    }
    init() {
        let cal = NSCalendar(identifier: NSCalendar.Identifier.gregorian)
        let time = cal?.startOfDay(for: Date())
        self.seconds = (time?.timeIntervalSinceNow)! as Double
    }
    func toString() -> String {
        let secs = Int(self.seconds) % 60
        let minutes = Int((self.seconds - Double(secs))/60.0) % 60
        var hours = (Int(self.seconds)/60)/60
        var amPm: String
        if hours > 12 {
            hours -= 12
            amPm = "PM"
        }
        else {
            amPm = "AM"
        }
        var toReturn = String(hours) + ":"
        if String(minutes).characters.count == 1 {
            toReturn += "0" + String(minutes)
        }
        if secs != 0 {
            toReturn += ":" + String(secs) + " " + amPm
        }
        else {
            toReturn += " " + amPm
        }
        return toReturn
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
