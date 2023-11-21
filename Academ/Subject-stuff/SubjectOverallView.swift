//
//  SubjectOverallView.swift
//  Academ
//
//  Created by yoeh iskandar on 18/11/23.
//

import SwiftUI


struct SubjectOverallView: View {
    @Binding var subje: Subject
//    @State var highestMark = 0
//    @State var lowestMark = 0
//    @State var averageMark = 0
    
    var body: some View {
        NavigationStack{
            Form{
                HStack{
                    Text("Average:")
                    Text("\(Int(average(floatArray:arrayPercentage(amountArray: assessmentArray(arrayAssessment: subje.assessments, total: false), totaledArray: assessmentArray(arrayAssessment: subje.assessments, total: true)))))")
                    Text("%")
                }
                HStack{
                    Text("Highest:")
                    Text("\(Int(highest(floatArray: arrayPercentage(amountArray: assessmentArray(arrayAssessment: subje.assessments, total: false), totaledArray: assessmentArray(arrayAssessment: subje.assessments, total: true)))))")
                Text("%")
                }
            }
            .navigationTitle(subje.name)


        }
    }
}

struct SubjectOverallView_Previews: PreviewProvider {
    static var previews: some View {

        SubjectOverallView(subje: .constant(Subject(name: "Mathematics", assessments: [Assessment(name: "WA1", percentageValue: 10, totalMarks: 20, examDone: true, markAttained: 12, examDate: Date(), targetMarks: 60, haveReminder: false, reminder: Date()),Assessment(name: "WA2", percentageValue: 15, totalMarks: 30, examDone: true, markAttained: 23, examDate: Date(), targetMarks: 60, haveReminder: false, reminder: Date())],targetGrade: 75, credits: 0)))

    }
}
