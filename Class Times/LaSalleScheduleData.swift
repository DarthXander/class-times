//
//  LaSalleScheduleData.swift
//  
//
//  Created by Xander Clair on 10/28/16.
//
//

import Foundation

class ScheduleData {
    
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
    case mass(MassCase)
    case lunch(Lunch)
    static func ==(lhs: Special, rhs: Special) -> Bool {
        return lhs == rhs
    }
}

enum MassCase: Int {
    case mass = 1
    case notMass = 2
}

class DayScheduleData {
    let data = [Period: TimeRange]()
    init(withData: [Period: [Special: TimeRange]], isMassDay: Bool, isLunch: Lunch) {
        for (key, value) in withData {
            for special in value.keys {
                switch special {
                case .none: data[key] = value[special]
                case .mass(let massCase):
                    if massCase == .mass && isMassDay {
                        data[key] = value[special]
                    }
                    else if massCase == .mass && !isMassDay {
                        data[key] = value[special]
                    }
                case .lunch(let lunchCase):
                    if lunchCase == isLunch {
                        data[key] = value[special]
                    }
                }
            }
        }
    }
}
