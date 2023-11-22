//
//  SubjectSheets.swift
//  Academ
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI

struct NewSubjectView: View {
    @EnvironmentObject var subjectmanager: SubjectManager
    @State private var newSubject:Subject = Subject(name: "", assessments: [], targetGrade: 0, credits: 0)
    @State private var showNewAssessmentSheet = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            Form{
                Section(header: Text("SUBJECT INFO")) {
                    TextField("Subject", text:$newSubject.name)
                    HStack{
                        Text("Target Grade")
                        TextField("Number", value: $newSubject.targetGrade, formatter: NumberFormatter())
                        Text("")
                    }
                }
                
                Section("ASSESSMENTS") {
                    List($newSubject.assessments){$assessm in
                        NavigationLink{
                            AssessmentDetailView(assess: $assessm)
                        }label: {
                            Text(assessm.name)
                        }
                    }
                    
                    Button {
                        showNewAssessmentSheet = true
                    } label: {
                        HStack{
                            Image(systemName: "plus")
                            Text("Add an assessment")
                        }
                    }
                    
                }
                Section{
                    Button("Save"){
                        subjectmanager.subjects.append(newSubject)
                        dismiss()
                    }
                }
            }
            .sheet(isPresented: $showNewAssessmentSheet){
                NewAssessmentView(sub: $newSubject)
            }
            
        }
        
    }
    
}


struct NewSubjectView_Previews: PreviewProvider {
    static var previews: some View {
        NewSubjectView()
            .environmentObject(SubjectManager())
    }
}
