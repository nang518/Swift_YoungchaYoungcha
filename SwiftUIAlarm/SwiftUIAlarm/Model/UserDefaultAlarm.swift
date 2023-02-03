//
//  UserDefaultAlarm.swift
//  SwiftUIAlarm
//
//  Created by 정나영 on 2023/02/02.
//

import SwiftUI
import UserNotifications
import CoreLocation

//class NotificationManager: ObservableObject {
//    let notiCenter = UNUserNotificationCenter.current()
//    
//    @Published var isToggleOn: Bool = UserDefaults.standard.bool(forKey: "hasUserAgreeNoti") {
//        didSet {
//            if isToggleOn {
//                UserDefaults.standard.set(true, forKey: "hasUserAgreeNoti")
//                requestNotiAuthorization()
//            }
//            else {
//                UserDefaults.standard.set(false, forKey: "hasUserAgreeNoti")
//                removeAllNotifications()
//            }
//        }
//    }
//    
//    @Published var notiTime: Date = Date() {
//        didSet {
//            // Set Notification with the Time
//        }
//    }
//    
//    @Published var isAlertOccured: Bool = false
//    
//    func requestNotiAuthorization() {
//        notiCenter.getNotificationSettings { settings in
//            if settings.authorizationStatus != .authorized {
//                notiCenter.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
//                    if let error = error {
//                        print("Error: \(error.localizedDescription)")
//                    }
//                    
//                    if granted {
//                        self.addNotification(with: self.notiTime)
//                    }
//                    
//                    else {
//                        DispatchQueue.main.async {
//                            self.isNotiOn = false
//                        }
//                    }
//                }
//            }
//            
//            if settings.authorizationStatus == .denied {
//                DispatchQueue.main.async {
//                    self.isAlertOccured = true
//                }
//            }
//        }
//    }
//    
//    func removeAllNotifications() {
//        notiCenter.removeAllDeliveredNotifications()
//        notiCenter.removeAllPendingNotificationRequests()
//    }
//    
//    func addNotification(with time: Date) {
//        let content = UNMutableNotificationContent()
//        
//        content.title = "타이틀"
//        content.subtitle = "서브 타이틀"
//        content.sound = UNNotificationSound.default
//        
//        let dateComponent = Calendar.current.dateComponents([.hour, .minute], from: time)
//        let trigger = UNNotificationTrigger(dateMatching: dateComponent, repeats: true)
//        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//        
//        UNUserNotificationCenter.add(request)
//    }
//}

struct NotiView: View {
    @State private var isToggleOn: Bool = false
    @State private var notiTime: Date = Date()
    
    var body: some View {
        HStack {
            Toggle("", isOn: $isToggleOn)
            if isToggleOn {
                DatePicker("", selection: $notiTime, displayedComponents: .hourAndMinute)
            }
        }
    }
}
