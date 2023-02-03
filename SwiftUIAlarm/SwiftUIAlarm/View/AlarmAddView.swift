//
//  AlarmAddView.swift
//  SwiftUIAlarm
//
//  Created by 정나영 on 2023/02/02.
//

import SwiftUI

struct AlarmAddView: View {
    @EnvironmentObject var alarmData: AlarmData
    @Environment (\.isPresented) var isPresented
    
    @State var date: Date = Date()
    @State var repeatDay: [RepeatDay] = []
    @State var label: String = "Alarm"
    @State var isSnoozed: Bool = true
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                
            }
        }
    }
}

struct AlarmAddView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmAddView()
    }
}
