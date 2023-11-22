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
    //MarkGoal = subje.targetGrade - subje.average() + subje.targetGrade
//    @State var highestMark = 0
//    @State var lowestMark = 0
//    @State var averageMark = 0
    var body: some View {
        NavigationStack{
            Form{
                HStack{
                    Text("Current Overall")
                    Text("\(Int(subje.currentOverall()))")
                    Text("%")
                }
                HStack{
                    Text("Highest:")
                    Text("\(Int(subje.highest()))")
                Text("%")
                }
                HStack{
                    Text("Overall Goal:")
                    Text("\(Int(subje.targetGrade))%")
                }
                HStack{
                    Text("Goal achieved?")
                    if subje.average() >= subje.targetGrade {
                        Text("✅")
                    } else {
                        Text("❌")
                    }
                }
                if subje.average() >= subje.targetGrade {
                    Text("Goal already achieved. Well done! 😁")
                    
                } else {
                    HStack{
                        Text("Percentage for goal marks:")
                        var MarkGoal = Int(subje.targetGrade - subje.average() + subje.targetGrade)
                        Text("\(MarkGoal) %")

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
