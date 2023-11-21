//
//  NewAssessmentView.swift
//  Academ
//
//  Created by yoeh iskandar on 20/11/23.
//

import SwiftUI

struct NewAssessmentView: View {
    @State private var assessmentName = ""
    @State private var assessmentPercentage = 0
    @State private var totaledMarks = 0
//    @State private var targetedMarks = 0
    @State private var examDoneness = false
    @State private var marksAttain = 0
    @State private var examsDate = Date()
    @State private var hasReminder = false
    @State private var reminderDate = Date()
    @Environment(\.dismiss) var dismiss
    @Binding var sub: Subject
    var body: some View {
        Form{
            Section("Assessment Info"){
                TextField("Name",text: $assessmentName)
                //TextField()
                HStack{
                    Text("Percentage value:")
                    TextField("Percentage", value: $assessmentPercentage, formatter: NumberFormatter())
                    Text("%")
                    
                    
                }
                HStack{
                    Text("Total marks:")
                    TextField("Marks", value: $totaledMarks, formatter: NumberFormatter())
                    
                }
                
                HStack{
                    Text("Exam done?")
                    Toggle(isOn: $examDoneness){
                        Text("")
                    }
                    
                }
                if examDoneness {
                    HStack{
                        Text("Marks attaineed:")
                        TextField("Marks", value: $marksAttain, formatter: NumberFormatter())
                    }
                } else{
//                    HStack{
//                        Text("Target marks:")
//                        TextField("Marks", value: $targetedMarks, formatter: NumberFormatter())
//                    }
                    DatePicker(
                        "Start Date",
                        selection: $examsDate,
                        displayedComponents: [.date]
                    )
                    HStack{
                        Text("Reminder:")
                        Toggle(isOn: $hasReminder){
                            Text("")
                        }
                        
                    }
                }
            }
            Section {
                Button("Save", role: .none) {
                    let newAssessment = Assessment(name: assessmentName, percentageValue: Float(assessmentPercentage), totalMarks: Float(totaledMarks), examDone: examDoneness, markAttained: examDoneness ? Float(marksAttain) : 0, examDate: examDoneness ? Date() : examsDate, haveReminder: hasReminder, reminder: hasReminder ? reminderDate : Date())
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
        NewAssessmentView(sub: .constant(Subject(name: "Mathematics", assessments: [], targetGrade: 75, credits: 0)))
            
    }
}


