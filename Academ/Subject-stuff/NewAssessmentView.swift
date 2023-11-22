//
//  NewAssessmentView.swift
//  Academ
//
//  Created by yoeh iskandar on 20/11/23.
//

import SwiftUI

struct NewAssessmentView: View {
    @State private var newAssessment = Assessment(name: "", percentageValue: 0, totalMarks: 0, examDone: false, markAttained: 0, examDate: Date(), haveReminder: false, reminder: Date())
    @Environment(\.dismiss) var dismiss
    @Binding var sub: Subject
    @State private var markCheck:Float = 0.0
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
                    sub.assessments.append(newAssessment)
                    dismiss()
                }
                Button("Cancel", role: .destructive) {
                    // code to cancel
                    dismiss()
                }
            }
        }
        
    }
}
struct NewAssessmentView_Previews: PreviewProvider {
    static var previews: some View {
        NewAssessmentView(sub: .constant(Subject(name: "Mathematics", assessments: [], targetGrade: 75, credits: 0, numOfAssessments: 4)))
            
    }
}


