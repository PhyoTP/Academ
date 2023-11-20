//
//  NewAssessmentView.swift
//  Academ
//
//  Created by yoeh iskandar on 20/11/23.
//

import SwiftUI

struct NewAssessmentView: View {
    @State private var name = ""
    @State private var assessmentPercentage = 0
    @State private var totalMarks = 0
    @State private var targetMarks = 0
    @State private var examDone = false
    @State private var marksAttained = 0
    @State private var date = Date()
    @State private var reminder = false
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var subject: SubjectManager
    var body: some View {
        Form{
            Section("Assessment Info"){
                TextField("Name",text: $name)
                //TextField()
                HStack{
                    Text("Percentage value:")
                    TextField("Percentage", value: $assessmentPercentage, formatter: NumberFormatter())
                    Text("%")
                    
                    
                }
                HStack{
                    Text("Total marks:")
                    TextField("Marks", value: $totalMarks, formatter: NumberFormatter())
                    
                }

                HStack{
                    Text("Exam done?")
                    Toggle(isOn: $examDone){
                        Text("")
                    }
                    
                }
                if examDone {
                    HStack{
                        Text("Marks attaineed:")
                        TextField("Marks", value: $marksAttained, formatter: NumberFormatter())
                    }
                } else{
                    HStack{
                        Text("Target marks:")
                        TextField("Marks", value: $targetMarks, formatter: NumberFormatter())
                    }
                    DatePicker(
                        "Start Date",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                    HStack{
                        Text("Reminder:")
                        Toggle(isOn: $reminder){
                            Text("")
                        }
                        
                    }
                }
//                Section {
//                    Button("Save", role: .none) {
//                        // code to save the assessment
//                        let newAssessment = Subject(name: name, percentageValue: assessmentPercentage, totalMarks: totalMarks, )
//                        $subject.assessments.append(newAssessment)
//                        dismiss()
//                    }
//                    Button("Cancel", role: .destructive) {
//                        // code to cancel
//                        dismiss()
//                    }
//                }
            }
        }
    }
}
struct NewAssessmentView_Previews: PreviewProvider {
    static var previews: some View {
        NewAssessmentView()
    }
}


