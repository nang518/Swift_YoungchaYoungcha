//
//  NotificationListView.swift
//  SwiftUIAlarm
//
//  Created by 정나영 on 2023/02/03.
//

import SwiftUI

struct NotificationListView: View {
    @StateObject private var notificationManager = NotificationManager()
    @State private var isCreatePresented = false
    
    @ViewBuilder
    var infoOverlayView: some View {
        switch notificationManager.authorizationStatus {
        case .authorized:
            if notificationManager.notifications.isEmpty {
                InfoOverlayView(
                    infoMessage: "알림이 없습니다",
                    buttonTitle: "Create",
                    systemImageName: "plus.circle",
                    action: {
                        isCreatePresented = true
                    }
                )
            }
        case .denied:
            InfoOverlayView(
                infoMessage: "알림 허용 권한을 변경하세요",
                buttonTitle: "Settings",
                systemImageName: "gear",
                action: {
                    if let url = URL(string: UIApplication.openSettingsURLString),
                       UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
            )
        default:
            EmptyView()
        }
    }
    
    var body: some View {
        List(notificationManager.notifications, id: \.identifier) { notification in
            Text(notification.content.title)
                .fontWeight(.semibold)
        }
        .listStyle(InsetGroupedListStyle())
        .overlay(infoOverlayView)
        .navigationTitle("Notifications")
        .onAppear(perform: notificationManager.reloadAuthorizationStatus)
        .onChange(of: notificationManager.authorizationStatus) { authorizationStatus in
            switch authorizationStatus {
            case .notDetermined:
                notificationManager.requestAuthorization()
            case .authorized:
                notificationManager.reloadLocalNotifications()
            break
            default:
                break 
            }
        }
        .navigationBarItems(trailing: Button {
            isCreatePresented = true
        } label: {
            Image(systemName: "plus.circle")
                .imageScale(.large)
        })
        .sheet(isPresented: $isCreatePresented) {
            NavigationView {
                CreateNotificationView(
                    notificationManager: notificationManager, 
                    isPresented: $isCreatePresented)
            }
            .accentColor(.primary)
        }
        
    }
}

struct NotificationListView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationListView()
    }
}
