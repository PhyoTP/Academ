//
//  SubjectOverallView.swift
//  Academ
//
//  Created by yoeh iskandar on 18/11/23.
//

import SwiftUI


struct SubjectOverallView: View {
    @Binding var subje: Subject
    @State private var MarkGoal = 0
    var body: some View {
        NavigationStack{
            Form{
                HStack{
                    Text("Current Overall:")
                    Text("\(String(format: "%.0f",subje.currentOverall()))")
                    Text("%")
                }//current overall
                HStack{
                    Text("Highest:")
                    Text("\(Int(subje.highest()))")
                    Text("%")
                }//highest
                HStack{
                    Text("Overall Goal:")
                    Text("\(Int(subje.targetGrade))%")
                }//overall goal
                if subje.assessments.count == subje.numOfAssessments{
                    HStack{
                        Text("Goal achieved?")
                        if subje.currentOverall() >= subje.targetGrade {
                            Text("✅")
                        } else {
                            Text("❌")
                        }
                    }//goal achieved
                    if subje.currentOverall() >= subje.targetGrade {
                        Text("Goal already achieved. Well done! 😁")
                    }//goal message
                }else if subje.assessments.count >= subje.numOfAssessments{
                    HStack{
                        Text("You have more assessments than you input in 'No. of assessments. Please reduce the input or remove some assessments.")
                    }
                }else {
                    HStack{
                        Text("Percentage needed to get goal marks:")
                        Text("\(Int(subje.weightedGoal())) %")
                    }
                }
            }
            .navigationTitle(subje.name)
        }
    }
}



struct SubjectOverallView_Previews: PreviewProvider {
    static var previews: some View {
        
        SubjectOverallView(subje: .constant(Subject(name: "Mathematics", assessments: [Assessment(name: "WA1", percentageValue: 10, totalMarks: 20, examDone: true, markAttained: 12, examDate: Date(),  haveReminder: false, reminder: Date()),Assessment(name: "WA2", percentageValue: 15, totalMarks: 30, examDone: true, markAttained: 23, examDate: Date(),  haveReminder: false, reminder: Date())],targetGrade: 75, credits: 0, numOfAssessments: 4)))
        
    }
}
