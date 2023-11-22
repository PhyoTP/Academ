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
    var body: some View {
        
        NavigationStack {
            Form{
                Section(header: Text("subject info")) {
                    TextField("Name",text:$sub.name)
                    if sub.assessmentArray(total: false).count>1{
                        NavigationLink{
                            SubjectOverallView(subje: $sub)
                        }label: {
                            Text("Overall")
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
                    Button {
                        print("sooon")
                        displaySheet = true
                    } label: {
                        Text("+  Add an assessment")
                    }
                }
            }
            .navigationTitle($sub.name)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
        .sheet(isPresented: $displaySheet) {
            NewAssessmentView(sub:$sub)
        }
        
        
        
        
    }
}
struct SubjectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectDetailView(sub: .constant(Subject(name: "Mathematics", assessments: [Assessment(name: "WA1", percentageValue: 10, totalMarks: 20, examDone: false, markAttained: 12, examDate: Date(), haveReminder: false, reminder: Date())],targetGrade:75,credits: 0, numOfAssessments: 4)))
    }
}
