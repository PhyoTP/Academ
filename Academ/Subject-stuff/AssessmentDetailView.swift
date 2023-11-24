//
//  AssessmentDetailView.swift
//  Academ
//
//  Created by yoeh iskandar on 20/11/23.
//

import SwiftUI

struct AssessmentDetailView: View {
    @Binding var assess: Assessment
    @State private var isDisplayed = false
    // all data has to be binding or else it would refresh
    func requestNotificationAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Notification authorization granted")
            } else {
                print("Notification authorization denied")
            }
        }
    }

    func scheduleNotification(at date: Date, body: String, title: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                print("Notification scheduled successfully")
                scheduleNotification(at: Date().addingTimeInterval(60), body: "Your exam is on \(assess.examDate)", title: assess.name)
            }
        }
    }
    var body: some View {
        NavigationStack{
            List{
                TextField("Name",text: $assess.name)
                //TextField()
                HStack{
                    Text("Percentage value:")
                    TextField("Percentage", value: $assess.percentageValue, formatter: NumberFormatter())
                    Text("%")
                    
                    
                }
                HStack{
                    Text("Total marks:")
                    TextField("Marks", value: $assess.totalMarks, formatter: NumberFormatter())
                    
                }
                
                HStack{
                    Text("Exam done?")
                    Toggle(isOn: $assess.examDone){
                        Text("")
                    }
                    
                }
                if assess.examDone {
                    HStack{
                        Text("Marks attained:")
                        TextField("Marks", value: $assess.markAttained, formatter: NumberFormatter())
                        //Text($totaledMarks)
                    }
                } else{

                    DatePicker(
                        "Exam Date:",
                        selection: $assess.examDate,
                        displayedComponents: [.date]
                    )
                    HStack{
                        Text("Have reminder?")
                        Toggle(isOn: $assess.haveReminder){
                            Text("")
                        }
                    }
                    .onChange(of: assess.haveReminder) {newValue in
                        requestNotificationAuthorization()
                        scheduleNotification(at: assess.reminder, body: "Your exam is on \(assess.examDate)", title: assess.name)
                    }
                    if assess.haveReminder{
                        DatePicker("Reminder:",selection: $assess.reminder,displayedComponents: [.date])
                    //    requestNotificationAuthorization()
                    }
                } // else bracket
                
            }
            .navigationTitle($assess.name)
        }
    }
}
struct AssessmentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        AssessmentDetailView(assess: .constant(Assessment(name: "WA1", percentageValue: 10, totalMarks: 20, examDone: false, markAttained: 13, examDate: Date(),   haveReminder: true, reminder: Date())))
            .environmentObject(SubjectManager())
        
    }
}

