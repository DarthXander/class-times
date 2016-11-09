//
//  TimeModel.swift
//  Class Times
//
//  Created by Xander Clair on 11/4/16.
//  Copyright © 2016 Xander Clair. All rights reserved.
//

import Foundation

class TimeInfo {
    static let calendar = Calendar.current
    static var currentTime: Time {
        let date = Date()
        let hours = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        let nanoseconds = calendar.component(.nanosecond, from: date)
        let totalSeconds = Double(nanoseconds)/1e9 + Double(seconds) + Double(minutes)*60.0 + Double(hours)*60.0*60.0
        return Time(fromDouble: totalSeconds)
    }
    static var currentWeekday: Weekday? {
        let date = Date()
        let offset = 1
        switch calendar.component(.weekday, from: date) {
            case offset: return .sunday
            case offset + 1: return .monday
            case offset + 2: return .tuesday
            case offset + 3: return .wednesday
            case offset + 4: return .thursday
            case offset + 5: return .friday
            case offset + 6: return .saturday
            default: return nil
        }
    }
}
