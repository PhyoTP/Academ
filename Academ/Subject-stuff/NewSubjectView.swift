//
//  SubjectSheets.swift
//  Academ
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI

struct NewSubjectView: View {
    @EnvironmentObject var subjectmanager: SubjectManager
    @State private var newSubject:Subject = Subject(name: "", assessments: [], targetGrade: 0, credits: 0, numOfAssessments: 4)
    @State private var showNewAssessmentSheet = false
    @Environment(\.dismiss) var dismiss
    @ObservedObject var userData: UserData
    var body: some View {
        NavigationStack {
            Form{
                Section(header: Text("SUBJECT INFO")) {
                    TextField("Subject", text:$newSubject.name)
                    HStack{
                        Text("Overall Goal")
                        TextField("Percentage", value: $newSubject.targetGrade, formatter: NumberFormatter())
                        Text("%")
                    }
                    HStack{
                        Text("No. of assessments")
                        TextField("Number", value: $newSubject.numOfAssessments, formatter: NumberFormatter())
                        
                    }
                    if userData.haveCredits{
                        HStack{
                            Text("Credit")
                            TextField("Hours",value: $newSubject.credits, formatter: NumberFormatter())
                        }
                    }
                    if userData.selection==3{
                        
//                        Toggle("Foundation Subject?", isOn: $newSubject.isFoundation)
                        
                        
//                        Toggle("Higher Mother Tongue?", isOn: $newSubject.isHMT)
                        
                    }
                    if userData.selection==7{
//                        Toggle("Mother Tongue Syllabus B?", isOn:$newSubject.isMTSB)
                        
                    }
                }
                .listRowBackground(userData.themelists[userData.colorSelect].secondColor)
                Section("ASSESSMENTS") {
                    List($newSubject.assessments){$assessm in
                        NavigationLink{
                            AssessmentDetailView(assess: $assessm,userData: userData)
                        }label: {
                            Text(assessm.name)
                        }
                    }
                    if newSubject.numOfAssessments>newSubject.assessments.count{
                        Button {
                            showNewAssessmentSheet = true
                        } label: {
                            HStack{
                                Image(systemName: "plus")
                                Text("Add an assessment")
                            }
                        }
                    }
                }
                .listRowBackground(userData.themelists[userData.colorSelect].secondColor)
                Section{
                    Button("Save"){
                        subjectmanager.subjects.append(newSubject)
                        dismiss()
                    }
                    Button("Cancel", role:.destructive){
                        dismiss()
                    }
                }
                .listRowBackground(userData.themelists[userData.colorSelect].secondColor)
            }
            .background(userData.themelists[userData.colorSelect].mainColor)
            .scrollContentBackground(userData.themelists[userData.colorSelect].hideBackground ? .hidden : .visible)
            .sheet(isPresented: $showNewAssessmentSheet){
                NewAssessmentView(sub: $newSubject,userData: userData)
            }
            
        }
        
    }
    
}


struct NewSubjectView_Previews: PreviewProvider {
    static var previews: some View {
        NewSubjectView(userData: UserData())
            .environmentObject(SubjectManager())
            .environmentObject(SystemManager())
    }
}
