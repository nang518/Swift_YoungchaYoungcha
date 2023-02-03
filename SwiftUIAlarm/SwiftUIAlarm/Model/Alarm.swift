//
//  Alarm.swift
//  SwiftUIAlarm
//
//  Created by 정나영 on 2023/02/02.
//

import SwiftUI

enum RepeatDay: Int {
    case sunday = 0
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    
    var fullName: String {
        switch self {
        case .sunday: return "Sunday"
        case .monday: return "Monday"
        case .tuesday: return "Tuesday"
        case .wednesday: return "Wednesday"
        case .thursday: return "Thursday"
        case .friday: return "Friday"
        case .saturday: return "Saturday"
        }
    }
    
    var shortName: String {
        switch self {
        case .sunday: return "Sun"
        case .monday: return "Mon"
        case .tuesday: return "Tue"
        case .wednesday: return "Wed"
        case .thursday: return "Thu"
        case .friday: return "Fri"
        case .saturday: return "Sat"
        }
    }
}

struct Alarm: Hashable, Codable, Identifiable {
    let id: UUID
    var date: Date
//    var label: String
//    var repeatDay: [Int]
//    var isActive: Bool
//    var isSnooze: Bool
    
    //Repeat Day String
//    var repeats: String {
//        guard repeatDay.count > 0 else { return "" }
//        return repeatDay.repeats
//    }
    
    init(date: Date, label: String, repeatDay: [RepeatDay], isActive: Bool, isSnooze: Bool) {
        self.id = UUID()
        self.date = date
//        self.label = label
//        self.repeatDay = repeatDay.map { $0.rawValue }
//        self.isActive = isActive
//        self.isSnooze = isSnooze
    }
    
    //Default Alarms
    static var defaultAlarm: [Alarm] {
        get {
            [
                Alarm(data: Date().addingTimeInterval(-1000))
                
            ]
        }
    }
}
