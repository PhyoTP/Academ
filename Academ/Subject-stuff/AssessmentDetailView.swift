//
//  AssessmentDetailView.swift
//  Academ
//
//  Created by yoeh iskandar on 20/11/23.
//

import SwiftUI

struct AssessmentDetailView: View {
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
                if assess.examDone {
                    HStack{
                        Text("Marks attained:")
                        TextField("Marks", value: $assess.markAttained, formatter: NumberFormatter())
                        //Text($totaledMarks)
                    }
                } else{
                    //                    HStack{
                    //                        Text("Target marks:")
                    //                        TextField("Marks", value: $assess.targetMarks, formatter: NumberFormatter())
                    //                    }
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
                    if assess.haveReminder{
                        DatePicker("Reminder:",selection: $assess.reminder,displayedComponents: [.date])
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

