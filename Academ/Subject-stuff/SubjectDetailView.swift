//
//  SubjectDetailView.swift
//  Academ
//
//  Created by yoeh iskandar on 18/11/23.
//

import SwiftUI
import Charts
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
                            SubjectOverallView(subje: $sub,userData: userData)
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
                .listRowBackground(userData.themelists[userData.colorSelect].secondColor)
                Section(header: Text("Assessments")) {
                    List($sub.assessments,editActions:.all){$assessment in
                        NavigationLink(destination: AssessmentDetailView(assess: $assessment,userData: userData)){
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
                .listRowBackground(userData.themelists[userData.colorSelect].secondColor)
                Section(header: Text("Subject trends (%)")){
                    if (sub.assessments.count <= 1) {
                        Text("Track two or more scores to see your grades over time!")
                    } else {
                        Chart(sub.assessments, id: \.self) { assessment in
                            LineMark(x: .value("Assessment", assessment.name), y: .value("Mark", percentage(amount: assessment.markAttained, total: assessment.totalMarks)))
                                .foregroundStyle(.red)
                            LineMark(x: .value("Assessment", assessment.name), y: .value("Mark", sub.targetMark),series: .value("blank", "smth"))
                                .foregroundStyle(.green)

                        }
                        .chartYScale(domain:0...100)
                    }
                    if sub.assessments.count > 1{
                        HStack{
                            Image(systemName: "circle.fill")
                                .foregroundColor(.red)
                            Text("Marks per WA")
                            Text("        ")
                            Image(systemName: "circle.fill")
                                .foregroundColor(.green)
                            Text("Goal marks")
                        }
                    }
                    
                }
                
            }
            .background(userData.themelists[userData.colorSelect].mainColor)
            .scrollContentBackground(userData.themelists[userData.colorSelect].hideBackground ? .hidden : .visible)
            .navigationTitle($sub.name)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .onAppear{
                if (sub.assessments.count == sub.numOfAssessments || sub.numOfAssessments == 0)&&(sub.checkIfSubjectGradeExceeds100()>Double(100)){
                    showAlert=true
                }
            }
            .alert("Your inputted weightage is higher than 100%.",isPresented: $showAlert){
                
            }message: {
                Text("Please change your assessment's weightage")
            }
        }
        .sheet(isPresented: $displaySheet) {
            NewAssessmentView(sub:$sub,userData: userData)
        }
        
        
        
        
    }
}
struct SubjectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectDetailView(sub: .constant(Subject(name: "Mathematics", assessments: [Assessment(name: "WA1", weightage: 10, totalMarks: 20, examDone: false, markAttained: 12, examDate: Date(), haveReminder: false, reminder: Date())],targetMark:75,credits: 0, numOfAssessments: 4)),userData: UserData())
    }
}
