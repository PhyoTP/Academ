//
//  SubjectDetailView.swift
//  Academ
//
//  Created by yoeh iskandar on 18/11/23.
//

import SwiftUI

struct SubjectDetailView: View {
    @Binding var sub: Subject
    @State private var displaySheet = false
    @State private var showAlert = false
    @ObservedObject var userData: UserData
    var body: some View {
        
        NavigationStack {
            Form{
                Section(header: Text("subject info")) {
                    TextField("Name",text:$sub.name)
                    HStack{
                        Text("No. of Assessments")
                        TextField("Num",value:$sub.numOfAssessments, formatter: NumberFormatter())
                    }
                    if sub.assessmentArray(type: 1).count>1{
                        NavigationLink{
                            SubjectOverallView(subje: $sub)
                        }label: {
                            Text("Overall")
                        }
                    }
                    if userData.haveCredits{
                        HStack{
                            Text("Credit")
                            TextField("Hours",value: $sub.credits, formatter: NumberFormatter())
                        }
                    }
                }
                Section(header: Text("Assessments")) {
                    List($sub.assessments,editActions:.all){$assessment in
                        NavigationLink(destination: AssessmentDetailView(assess: $assessment)){
                            Text(assessment.name)
                            Text("")
                                .font(.caption)
                        }
                    }
                    if !(sub.assessments.count >= sub.numOfAssessments){
                        Button {
                            print("sooon")
                            displaySheet = true
                        } label: {
                            Text("+  Add an assessment")
                        }
                    }
                }
            }
            .navigationTitle($sub.name)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .onAppear{
                if (sub.assessments.count == sub.numOfAssessments)&&(sub.checkIfSubjectGradeExceeds100()>Float(100)){
                    showAlert=true
                }
            }
            .alert("Your inputted percentage value is higher than 100%.",isPresented: $showAlert){
                
            }message: {
                Text("Please change your assessment's percentage value")
            }
        }
        .sheet(isPresented: $displaySheet) {
            NewAssessmentView(sub:$sub)
        }
        
        
        
        
    }
}
struct SubjectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectDetailView(sub: .constant(Subject(name: "Mathematics", assessments: [Assessment(name: "WA1", percentageValue: 10, totalMarks: 20, examDone: false, markAttained: 12, examDate: Date(), haveReminder: false, reminder: Date())],targetGrade:75,credits: 0, numOfAssessments: 4)),userData: UserData())
    }
}
