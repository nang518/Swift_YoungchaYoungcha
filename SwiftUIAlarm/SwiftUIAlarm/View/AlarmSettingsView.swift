//
//  AlarmSettingsView.swift
//  SwiftUIAlarm
//
//  Created by 정나영 on 2023/02/01.
//

import SwiftUI

struct AlarmSettingsView: View {
    @Environment (\.presentationMode) var presentationMode: Binding <PresentationMode>
    @State private var selectedDate = Date()
    @State private var showSheet = false
    
    var btnBack: some View{
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image("go-back")
        }

//        Button(action:{self.presentationMode.wrappedValue.dismiss()}){
//            HStack{
//                Image("go-back")
//            }
//        }
    }
    
    var body: some View {
        NavigationStack {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
        
        .navigationBarItems(trailing: editButton())
        .navigationBarItems(trailing: plusButton())
        
        
        }
        .sheet(isPresented: self.$showSheet) {
            plusAlarm().preferredColorScheme(.dark)
        }
    
    }
    
    func plusButton() -> some View {
        Button {
            self.showSheet = true
        } label: {
            Image(systemName: "plus")
                .foregroundColor(.white)
        }
    }
    
    func editButton() -> some View {
        Button {
            
        } label: {
            Text("Edit")
                .foregroundColor(.gray)
        }
    }
    
    func plusAlarm() -> some View {
        NavigationStack {
            VStack {
                DatePicker("",selection: $selectedDate, displayedComponents: .hourAndMinute)
                    .datePickerStyle(.wheel)
            }
            .navigationBarTitle("새로운 알람", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                self.showSheet = false}) {Text("취소")},
                                trailing: Button{ } label: {Text("저장")})
        }
    }
}

struct AlarmSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmSettingsView()
    }
}
