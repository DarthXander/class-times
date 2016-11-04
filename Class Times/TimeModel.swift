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
    static func getCurrentTime() -> Time {
        let date = Date()
        let hours = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        let nanoseconds = calendar.component(.nanosecond, from: date)
        let totalSeconds = Double(nanoseconds)/1e9 + Double(seconds) + Double(minutes)*60.0 + Double(hours)*60.0*60.0
        return Time(fromDouble: totalSeconds)
    }
}
