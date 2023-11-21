//
//  AssessmentDetailView.swift
//  Academ
//
//  Created by yoeh iskandar on 20/11/23.
//

import SwiftUI

struct AssessmentDetailView: View {
    //    @EnvironmentObject var subjectmanager: SubjectManager
    //@State private var assessmentName = ""
    @State private var assessmentPercentage = 0
    @State private var totaledMarks = 0
    @State private var targetedMarks = 0
    @State private var examDoneness = false
    @State private var marksAttain = 0
    @State private var examsDate = Date()
    @State private var hasReminder = false
    @State private var reminderDate = Date()
    @Binding var assess: Assessment
    // all data has to be binding or else it would refresh
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
                if examDoneness {
                    HStack{
                        Text("Marks attained:")
                        TextField("Marks", value: $assess.markAttained, formatter: NumberFormatter())
                        //Text($totaledMarks)
                    }
                } else{
                    HStack{
                        Text("Target marks:")
                        TextField("Marks", value: $assess.targetMarks, formatter: NumberFormatter())
                    }
                    DatePicker(
                        "Start Date",
                        selection: $assess.examDate,
                        displayedComponents: [.date]
                    )
                    HStack{
                        Text("Reminder:")
                        Toggle(isOn: $assess.haveReminder){
                            Text("")
                        }
                    }
                } // else bracket
                
            }
            .navigationTitle($assess.name)
        }
    }
}
struct AssessmentDetailView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationStack{
                AssessmentDetailView(assess: .constant(Assessment(name: "WA1", percentageValue: 10, totalMarks: 20, examDone: true, markAttained: 13, examDate: Date(),  targetMarks: 80, haveReminder: false, reminder: Date())))
                    .environmentObject(SubjectManager())
            }
        }
    }

