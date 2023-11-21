//
//  SubjectSheets.swift
//  Academ
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI

struct NewSubjectView: View {
    @State private var placeholderText = ""
    @EnvironmentObject var subjectmanager: SubjectManager
    @State private var subjected:Subject = Subject(name: "", assessments: [], targetGrade: 70, credits: 0)
//    @State pri
    var body: some View {
        NavigationStack {
            List{
                Section(header: Text("SUBJECT INFO")) {
                    TextField("Subject", text:$placeholderText)
                }
                Section(header: Text("ASSESSMENTS")) {
                    //help idk what to do here also i left cuz cannot do pm session ok bye
                }
                Section() {
                    Button {
//                        NavigationLink{
//                            NewAssessmentView(sub: $subjected)
//                        }label:{
//                            Text("Test")
//                        }
                    } label: {
                        Text("+   Add an assessment")
                    }
                        
                    }
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
