//
//  AlarmData.swift
//  SwiftUIAlarm
//
//  Created by 정나영 on 2023/02/02.
//

import SwiftUI
import Combine

class AlarmData: ObservableObject {
    let didChange = PassthroughSubject<AlarmData, Never>()
    
    @UserDefaultAlarm(key: "Alarms", defaultValue: Alarm.defaultAlarm)
    var alarms: [Alarm] {
        didSet {
            didChange.send(self)
        }
    }
}
