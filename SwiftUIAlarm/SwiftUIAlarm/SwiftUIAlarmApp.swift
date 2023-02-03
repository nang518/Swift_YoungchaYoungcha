//
//  SwiftUIAlarmApp.swift
//  SwiftUIAlarm
//
//  Created by 정나영 on 2023/02/01.
//
import SwiftUI

@main
struct SwiftUIAlarmApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                NotificationListView()
            }
            .accentColor(.primary)
        }
    }
}
