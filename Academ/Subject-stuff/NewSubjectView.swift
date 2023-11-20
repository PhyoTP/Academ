//
//  SubjectSheets.swift
//  Academ
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI

struct NewSubjectView: View {
    @State private var placeholderText = ""
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
                        
                    } label: {
                        Text("+ Add an assessment")
                    }
                }
            }
        }
    }
}

struct NewSubjectView_Previews: PreviewProvider {
    static var previews: some View {
        NewSubjectView()
    }
}
