//
//  Schedule.swift
//  Class Times
//
//  Created by Xander Clair on 10/21/16.
//  Copyright © 2016 Xander Clair. All rights reserved.
//

import Foundation

enum Weekday {
    var stringValue: String {
        switch self {
        case .monday: return "Monday"
        case .tuesday: return "Tuesday"
        case .wednesday: return "Wednesday"
        case .thursday: return "Thursday"
        case .friday: return "Friday"
        case .saturday: return "Saturday"
        case .sunday: return "Sunday"
        }
    }
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
}

enum Lunch: Int {
    case lunchA = 2
    case lunchB = 3
}

// todo
class Schedule {
    let times: [TimeRange:Course]
    let day: Weekday
    init(forDay day: Weekday, withCourses courses: [Period: Course]) {
        self.day = day
        let lunchBase = LaSalleSchedule.lunchBase(forDay: day)!
        let lunch = courses[lunchBase]!.lunch
        let data = DayScheduleData(withData: LaSalleSchedule.schedule[day]!, isMassDay: LaSalleSchedule.isMassDay(), isLunch: lunch)
        var timesData = [TimeRange:Course]()
        for (period, range) in data.data {
            if let course = courses[period] {
                timesData[range] = course
            }
        }
        self.times = timesData
    }
    func getCurrentClass(time: Time) -> (TimeRange, Course)? {
        for (range, course) in times {
            if time.isIn(range: range) {
                return (range, course)
            }
        }
        return nil
    }
}

// done
class Course {
    var name : String
    var lunch : Lunch
    init(name: String, forLunch lunch: Lunch) {
        self.name = name
        self.lunch = lunch
    }
}

// done
enum Period: Int, Hashable {
    var hashValue: Int {
        return self.rawValue
    }
    var stringValue: String {
        get {
            switch self {
            case .zero: return "Zero"
            case .one: return "One"
            case .two: return "Two"
            case .three: return "Three"
            case .four: return "Four"
            case .five: return "Five"
            case .six: return "Six"
            case .seven: return "Seven"
            case .lunch: return "Lunch"
            case .falconFormation: return "Falcon Formation"
            case .falconTime: return "Falcon Time"
            case .liturgy: return "Liturgy"
            case .foodBreak: return "Break"
            }
        }
    }
    var canHaveCourse: Bool {
        switch self {
        case .falconFormation: return false
        case .falconTime: return false
        case .liturgy: return false
        case .foodBreak: return false
        case .lunch: return false
        default: return true
        }
    }
    case zero = 0
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case lunch = 8
    case falconFormation = 9
    case falconTime = 10
    case liturgy = 11
    case foodBreak = 12
}

// done
enum Special: Hashable {
    var hashValue: Int {
        switch self {
        case .none: return -1
        case .mass(let massCase): return massCase.rawValue
        case .lunch(let lunchCase): return lunchCase.rawValue
        }
    }
    case none
    case mass(MassCase)
    case lunch(Lunch)
    static func ==(lhs: Special, rhs: Special) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}

// done
enum MassCase: Int {
    case mass = 0
    case notMass = 1
}

// done
struct DayScheduleData {
    var data = [Period: TimeRange]()
    init(withData: [Period: [Special: TimeRange?]], isMassDay: MassCase, isLunch: Lunch) {
        for (key, value) in withData {
            for special in value.keys {
                switch special {
                case .none: data[key] = value[special]!
                case .mass(let massCase):
                    if massCase == isMassDay {
                        if let v = value[special] {
                            data[key] = v
                        }
                    }
                case .lunch(let lunchCase):
                    if lunchCase == isLunch {
                        if let v = value[special] {
                            data[key] = v
                        }
                    }
                }
            }
        }
    }
}

// done
struct TimeRange: Hashable {
    let start: Time
    let end: Time
    var hashValue: Int {
        return start.hashValue ^ end.hashValue
    }
    init(start: Time, end: Time) {
        self.start = start
        self.end = end
    }
    init(fromString: String) {
        var before2 = ""
        var two = ""
        var after2 = ""
        var i = fromString.startIndex
        var startString: String = ""
        var endString: String = ""
        for _ in fromString.characters {
            before2 = fromString.substring(to: i)
            two = String(fromString[i]) + String(fromString[fromString.index(after: i)])
            after2 = fromString.substring(from: fromString.index(i, offsetBy: 3))
            print("before: \(before2)\ntwo: \(two)\nafter: \(after2)")
            if two == "to" {
                startString = before2
                endString = after2
                break
            }
            i = fromString.index(after: i)
        }
        self.start = Time(fromString: startString)
        self.end = Time(fromString: endString)
    }
    func contains(time: Time) -> Bool {
        return time.isIn(range: self)
    }
    func toString() -> String {
        return self.start.toString() + " to " + self.end.toString()
    }
    static func ==(lhs: TimeRange, rhs: TimeRange) -> Bool {
        return lhs.start == rhs.start && lhs.end == rhs.end
    }
}

// done
struct Time: Comparable, Hashable {
    let seconds: Double
    var hashValue: Int {
        return seconds.hashValue
    }
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
                    if selector == 1 {
                        selector = 3
                    }
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
        let hours = (Int(self.seconds)/60)/60
        var amPm: String
        var finalHours: Int
        switch hours {
        case 0:
            finalHours = 12
            amPm = "AM"
        case 1..<12:
            finalHours = hours
            amPm = "AM"
        case 12:
            finalHours = hours
            amPm = "PM"
        case 13...24:
            finalHours = hours - 12
            amPm = "PM"
        default:
            amPm = "N/A"
            finalHours = hours
        }
        var toReturn = String(finalHours) + ":"
        if String(minutes).characters.count == 1 {
            toReturn += "0" + String(minutes)
        }
        else {
            toReturn += String(minutes)
        }
        if secs != 0 {
            if String(secs).characters.count == 1 {
                toReturn += ":0" + String(secs)
            }
            else {
                toReturn += ":" + String(secs)
            }
        }
        toReturn += " " + amPm
        return toReturn
    }
    func isIn(range: TimeRange) -> Bool {
        return range.start <= self && range.end >= self
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
