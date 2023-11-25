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
    @State private var newAssessment = Assessment(name: "", percentageValue: 0, totalMarks: 0, examDone: false, markAttained: 0, examDate: Date(), haveReminder: false, reminder: Date())
    @State var alert = false
    @Environment(\.dismiss) var dismiss
    @Binding var sub: Subject
    @State private var markCheck:Float = 0.0
    @State var NotificationSet =  true
    func scheduleNotification(at date: Date, body: String, title: String) {
       // Remove all pending notifications
       
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
       UNUserNotificationCenter.current().removeAllPendingNotificationRequests()

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
           }
       }
    }

    var body: some View {
        Form{
            Section("Assessment Info"){
                TextField("Name",text: $newAssessment.name)
                //TextField()
                HStack{
                    Text("Percentage value:")
                    TextField("Percentage", value: $newAssessment.percentageValue, formatter: NumberFormatter())
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
                        
                        DatePicker("Reminder Date",selection: $newAssessment.reminder, displayedComponents: [.date])
                    }
                }
            }
            Section {
                Button("Save", role: .none) {
                    if sub.checkIfSubjectGradeExceeds100() + newAssessment.percentageValue > 100 {
                        alert = true
                        
                    } else {
                        sub.assessments.append(newAssessment)
                        dismiss()
                        if newAssessment.haveReminder && NotificationSet{
                            requestNotificationAuthorization()
                            scheduleNotification(at: $newAssessment.reminder.wrappedValue, body: "Your exam is on \($newAssessment.examDate)h", title: $newAssessment.name.wrappedValue)
                            NotificationSet = false
                        }
                    }
                }
                Button("Cancel", role: .destructive) {
                    // code to cancel
                    dismiss()
                }
            }
        }
        .alert("The weightage of all assessments in a subject can only be 100%",isPresented: $alert){
            
        }
    }
}
struct NewAssessmentView_Previews: PreviewProvider {
    static var previews: some View {
        NewAssessmentView(sub: .constant(Subject(name: "Mathematics", assessments: [], targetGrade: 75, credits: 0, numOfAssessments: 4)))
            
    }
}


