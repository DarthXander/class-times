//
//  LaSalleScheduleData.swift
//  
//
//  Created by Xander Clair on 10/28/16.
//
//

import Foundation

// done
struct LaSalleSchedule {
    static let monday: [Period: [Special: TimeRange?]] = [
        .zero: [.none: TimeRange(fromString: "7:00 AM to 7:45 AM")],
        .one: [.none: TimeRange(fromString: "8:00 AM to 8:50 AM")],
        .two: [.none: TimeRange(fromString: "8:55 AM to 9:45 AM")],
        .foodBreak: [.none: TimeRange(fromString: "9:45 AM to 9:55 AM")],
        .three: [.none: TimeRange(fromString: "10:00 AM to 10:50 AM")],
        .four: [.none: TimeRange(fromString: "10:55 AM to 11:45 AM")],
        .five: [.lunch(.lunchA): TimeRange(fromString: "12:20 PM to 1:10 PM"),
                .lunch(.lunchB): TimeRange(fromString: "11:50 AM to 12:40 PM")],
        .lunch: [.lunch(.lunchA): TimeRange(fromString: "11:45 AM to 12:15 PM"),
                 .lunch(.lunchB): TimeRange(fromString: "12:40 PM to 1:10 PM")],
        .six: [.none: TimeRange(fromString: "1:15 PM to 2:05 PM")],
        .seven: [.none: TimeRange(fromString: "2:10 PM to 3:00 PM")]
    ]
    static let tuesday: [Period: [Special: TimeRange?]] = [
        .zero: [.none: TimeRange(fromString: "7:00 AM to 7:45 AM")],
        .two: [.none: TimeRange(fromString: "8:00 AM to 9:30 AM")],
        .foodBreak: [.none: TimeRange(fromString: "9:30 AM to 9:40 AM")],
        .three: [.none: TimeRange(fromString: "9:45 AM to 11:15 AM")],
        .four: [.lunch(.lunchA): TimeRange(fromString: "11:50 AM to 1:20 PM"),
                .lunch(.lunchB): TimeRange(fromString: "11:20 AM to 12:50 PM")],
        .lunch: [.lunch(.lunchA): TimeRange(fromString: "11:15 AM to 11:45 AM"),
                 .lunch(.lunchB): TimeRange(fromString: "12:50 PM to 1:20 PM")],
        .one: [.none: TimeRange(fromString: "1:25 PM to 2:55 PM")],
    ]
    static let wednesday: [Period: [Special: TimeRange?]] = [
        .six: [.mass(.mass): TimeRange(fromString: "8:00 AM to 9:30 AM"),
               .mass(.notMass): TimeRange(fromString: "9:15 AM to 10:45 AM")],
        .foodBreak: [.mass(.mass): TimeRange(fromString: "9:30 to 9:40"),
                     .mass(.notMass): nil],
        .falconFormation: [.mass(.notMass): TimeRange(fromString: "10:50 AM to 11:15 AM"),
                           .mass(.mass): nil],
        .seven: [.lunch(.lunchA): TimeRange(fromString: "11:50 AM to 1:20 PM"),
                .lunch(.lunchB): TimeRange(fromString: "11:20 AM to 12:50 PM")],
        .lunch: [.lunch(.lunchA): TimeRange(fromString: "11:45 AM to 12:15 PM"),
                .lunch(.lunchB): TimeRange(fromString: "12:40 PM to 1:10 PM")],
        .five: [.mass(.notMass): TimeRange(fromString: "1:25 PM to 2:55 PM"),
                .mass(.mass): TimeRange(fromString: "9:45 AM to 11:15 AM")],
        .liturgy: [.mass(.mass): TimeRange(fromString: "1:25 PM to 2:55 PM"),
                   .mass(.notMass): nil]
    ]
    static let thursday: [Period: [Special: TimeRange?]] = [
        .zero: [.none: TimeRange(fromString: "7:00 AM to 7:45 AM")],
        .three: [.none: TimeRange(fromString: "8:00 AM to 9:30 AM")],
        .foodBreak: [.none: TimeRange(fromString: "9:30 AM to 9:40 AM")],
        .four: [.none: TimeRange(fromString: "9:45 AM to 11:15 AM")],
        .one: [.lunch(.lunchA): TimeRange(fromString: "11:50 AM to 1:20 PM"),
                .lunch(.lunchB): TimeRange(fromString: "11:20 AM to 12:50 PM")],
        .lunch: [.lunch(.lunchA): TimeRange(fromString: "11:15 AM to 11:45 AM"),
                 .lunch(.lunchB): TimeRange(fromString: "12:50 PM to 1:20 PM")],
        .two: [.none: TimeRange(fromString: "1:25 PM to 2:55 PM")]
    ]
    static let friday: [Period: [Special: TimeRange?]] = [
        .zero: [.none: TimeRange(fromString: "8:00 AM to 8:45 AM")],
        .five: [.none: TimeRange(fromString: "9:15 AM to 10:45 AM")],
        .falconTime: [.none: TimeRange(fromString: "10:50 AM to 11:15 AM")],
        .seven: [.lunch(.lunchA): TimeRange(fromString: "11:50 AM to 1:20 PM"),
                 .lunch(.lunchB): TimeRange(fromString: "11:20 AM to 12:50 PM")],
        .lunch: [.lunch(.lunchA): TimeRange(fromString: "11:45 AM to 12:15 PM"),
                 .lunch(.lunchB): TimeRange(fromString: "12:40 PM to 1:10 PM")],
        .six: [.none: TimeRange(fromString: "1:25 PM to 2:55 PM")]
    ]
    static let schedule: [Weekday: [Period: [Special: TimeRange?]]] = [.monday: monday, .tuesday: tuesday, .wednesday: wednesday, .thursday: thursday, .friday: friday]
    static func lunchBase(forDay: Weekday) -> Period? {
        switch forDay {
        case .monday: return Period.five
        case .tuesday: return Period.four
        case .wednesday: return Period.four
        case .thursday: return Period.one
        case .friday: return Period.seven
        default: return nil
        }
    }
    static func isMassDay() -> MassCase {
        return MassCase.notMass
    }
}
