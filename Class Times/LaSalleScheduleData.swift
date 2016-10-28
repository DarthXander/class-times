//
//  LaSalleScheduleData.swift
//  
//
//  Created by Xander Clair on 10/28/16.
//
//

import Foundation

class ScheduleData {
    let data:
}

enum Special: Hashable {
    var hashValue: Int {
        get {
            switch self {
            case .none: return 0
            case .mass(let massCase): return massCase.rawValue
            case .lunch(let lunchCase): return lunchCase.rawValue
            }
        }
    }
    case none
    case mass(massCase)
    case lunch(lunchCase)
    static func ==(lhs: Special, rhs: Special) -> Bool {
        return lhs == rhs
    }
}

enum massCase: Int {
    case mass = 1
    case notMass = 2
}

enum lunchCase: Int {
    case lunchA = 3
    case lunchB = 4
}

class DayScheduleData {
    let data = [Period: TimeRange]()
    init(withData: [Period: [Special: TimeRange]], ) {
        for (key, value) in withData {
            for special in value.keys {
                switch special {
                case .none: data[key] = value[special]
                case .mass(let massCase):
                }
            }
        }
    }
}
