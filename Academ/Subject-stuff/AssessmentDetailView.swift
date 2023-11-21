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
    @Binding var assess: Assessment
    var body: some View {
        NavigationStack{
            List{
                TextField("Name",text: $assess.name)
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
                        //Text($totaledMarks)
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
            .navigationTitle($assess.name)
        }
    }
    struct AssessmentDetailView_Previews: PreviewProvider {
        static var previews: some View {
            AssessmentDetailView(assess: .constant(Assessment(name: "WA1", percentageValue: 10, totalMarks: 20, examDone: true, markAttained: 13, examDate: Date(), targetMarks: 0, haveReminder: false, reminder: Date())))
                .environmentObject(SubjectManager())
        }
    }
}
