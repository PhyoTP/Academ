//
//  AssessmentDetailView.swift
//  Academ
//
//  Created by yoeh iskandar on 20/11/23.
//

import SwiftUI

struct AssessmentDetailView: View {
//    @EnvironmentObject var subjectmanager: SubjectManager
    @State private var assessmentName = ""
    @State private var assessmentPercentage = 0
    @State private var totaledMarks = 0
    @State private var targetedMarks = 0
    @State private var examDoneness = false
    @State private var marksAttain = 0
    @State private var examsDate = Date()
    @State private var hasReminder = false
    @State private var reminderDate = Date()
    @Binding var subber: Subject
    var body: some View {
        NavigationStack{
            List{
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
                        Text("Marks attained:")
                        TextField("Marks", value: $marksAttain, formatter: NumberFormatter())
                    }
                } else{
                    HStack{
                        Text("Target marks:")
                        TextField("Marks", value: $targetedMarks, formatter: NumberFormatter())
                    }
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
                } // else bracket
                    
            }
            .navigationTitle("")
        }
    }
    struct AssessmentDetailView_Previews: PreviewProvider {
        static var previews: some View {
            AssessmentDetailView(subber: .constant(Subject(name: "Math", assessments: [], credits: 0)))
                .environmentObject(SubjectManager())
        }
    }
}
