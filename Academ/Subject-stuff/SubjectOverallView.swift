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
    @State private var showAlert = false
    var body: some View {
        NavigationStack{
            Form{
                Section("Statistics"){
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
                }
                Section("Goals"){
                    if subje.assessmentArray(type: 1).count == subje.numOfAssessments{
                        HStack{
                            Text("Goal achieved?")
                            if subje.currentOverall() >= subje.targetGrade {
                                Text("✅")
                            } else {
                                Text("❌")
                            }
                        }//goal achieved
                        if subje.currentOverall() == subje.targetGrade {
                            Text("Goal already achieved. Well done! 😁")
                        }//goal message
                    }else {
                        HStack{
                            Text("Percentage needed:")
                            Spacer()
                            Text("\(Int(subje.weightedGoal())) %")
                        }
                        List(subje.getUnfinishedAssessments()){assessme in
                            HStack{
                                Text("\(assessme.name) target marks:")
                                Spacer()
                                Text(String(format:"%.1f",assessme.totalMarks*subje.weightedGoal()/100))
                                Text("/\(Int(assessme.totalMarks))")
                            }
                        }
                    }
                }
            }
            .navigationTitle(subje.name)
            .onAppear{
                if (subje.assessments.count == subje.numOfAssessments)&&(subje.checkIfSubjectGradeExceeds100()>Float(100)){
                    showAlert=true
                }
            }
            .alert("Your inputted percentage value is higher than 100%.",isPresented: $showAlert){
                
            }message: {
                Text("Please change your assessment's percentage value")
            }
        }
    }
}



struct SubjectOverallView_Previews: PreviewProvider {
    static var previews: some View {
        
        SubjectOverallView(subje: .constant(Subject(name: "Mathematics", assessments: [Assessment(name: "WA1", percentageValue: 10, totalMarks: 20, examDone: true, markAttained: 12, examDate: Date(),  haveReminder: false, reminder: Date()),Assessment(name: "WA2", percentageValue: 15, totalMarks: 30, examDone: true, markAttained: 23, examDate: Date(),  haveReminder: false, reminder: Date()),Assessment(name: "WA3", percentageValue: 15, totalMarks: 45, examDone: false, markAttained: 0, examDate: Date(), haveReminder: false, reminder: Date()),Assessment(name: "EYE", percentageValue: 60, totalMarks: 120, examDone: false, markAttained: 0, examDate: Date(), haveReminder: false, reminder: Date())],targetGrade: 75, credits: 0, numOfAssessments: 4)))
        
    }
}
