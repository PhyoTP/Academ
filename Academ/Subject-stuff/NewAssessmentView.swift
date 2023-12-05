//
//  NewAssessmentView.swift
//  Academ
//
//  Created by yoeh iskandar on 20/11/23.
//

import SwiftUI
import UserNotifications

func requestNotificationAuthorization() {
  print("glory to soon")
  let center = UNUserNotificationCenter.current()
  center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
      if granted {
          print("Notification authorization granted")
          DispatchQueue.main.async {
              UIApplication.shared.registerForRemoteNotifications()
          }
      } else {
          print("Notification authorization denied")
      }
  }
}


struct NewAssessmentView: View {
    @State private var newAssessment = Assessment(name: "", weightage: 0, totalMarks: 0, examDone: false, markAttained: 0, examDate: Date(), haveReminder: false, reminder: Date())
    @State var alert1 = false
    @State var alert2 = false
    @Environment(\.dismiss) var dismiss
    @Binding var sub: Subject
    @State private var markCheck:Double = 0.0
    @State var NotificationSet =  true
    @ObservedObject var userData: UserData
    func scheduleNotification(at date: Date, body: String, title: String) {
        
        requestNotificationAuthorization()
        
       // Remove all pending notifications
       
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
       UNUserNotificationCenter.current().removeAllPendingNotificationRequests()

       let content = UNMutableNotificationContent()
       content.title = title
       content.body = body

       let calendar = Calendar.current
       let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date)

       let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)

       let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

       UNUserNotificationCenter.current().add(request) { error in
           if let error = error {
               print("Error scheduling notification: \(error.localizedDescription)")
           } else {
               print("Notification scheduled successfully at \(components)")
           }
       }
    }

    var body: some View {
        Form{
            Section("Assessment Info"){
                TextField("Name",text: $newAssessment.name)
                //TextField()
                HStack{
                    Text("Weightage:")
                    TextField("Percentage", value: $newAssessment.weightage, formatter: NumberFormatter())
                    Text("%")
                    
                    
                }
                HStack{
                    Text("Total marks:")
                    TextField("Marks", value: $newAssessment.totalMarks, formatter: NumberFormatter())
                    
                }
                
                HStack{
                    Text("Exam done?")
                    Toggle(isOn: $newAssessment.examDone){
                        Text("")
                    }
                    
                }
                if newAssessment.examDone {
                    HStack{
                        Text("Marks attained:")
                        TextField("Marks", value: $newAssessment.markAttained, formatter: NumberFormatter())
                    }
                } else{
                    DatePicker(
                        "Exam Date",
                        selection: $newAssessment.examDate,
                        displayedComponents: [.date]
                    )
                    HStack{
                        Text("Have reminder?")
                        Toggle(isOn: $newAssessment.haveReminder){
                            Text("")
                        }
                        
                    }
                    if newAssessment.haveReminder{
                        
                        DatePicker("Reminder Date",selection: $newAssessment.reminder, displayedComponents: [.date, .hourAndMinute])
                    }
                }
            }
            .listRowBackground(userData.themelists[userData.colorSelect].secondColor)
            Section {
                Button("Save", role: .none) {
                    if sub.checkIfSubjectGradeExceeds100() + newAssessment.weightage > 100 {
                        alert1 = true
                        
                    }
                    else if newAssessment.totalMarks == 0 {
                        alert2 = true
                    }
                    else {
                        sub.assessments.append(newAssessment)
                        dismiss()
                        if newAssessment.haveReminder && NotificationSet{
//                            requestNotificationAuthorization()
                            print("ASKING FOR NOTIFICATION")
                            scheduleNotification(at: newAssessment.reminder, body: "Your exam is on \(newAssessment.examDate)h", title: newAssessment.name)
                            NotificationSet = false
                        }
                    }
                }
                Button("Cancel", role: .destructive) {
                    // code to cancel
                    dismiss()
                }
            }
            .listRowBackground(userData.themelists[userData.colorSelect].secondColor)
        }
        .background(userData.themelists[userData.colorSelect].mainColor)
        .scrollContentBackground(userData.themelists[userData.colorSelect].hideBackground ? .hidden : .visible)
        .alert("The weightage of all assessments in a subject can only be 100%",isPresented: $alert1){
            
        }
        .alert("The total marks cannot be 0.",isPresented: $alert2){
            
        }
    }
}
struct NewAssessmentView_Previews: PreviewProvider {
    static var previews: some View {
        NewAssessmentView(sub: .constant(Subject(name: "Mathematics", assessments: [], targetMark: 75, credits: 0, numOfAssessments: 4)), userData: UserData())
            
    }
}


