//
//  SubjectSheets.swift
//  Academ
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI

struct SubjectSheets: View {
    @State private var placeholderText = ""
    var body: some View {
        NavigationStack {
            List{
                Section(header: Text("SUBJECT INFO")) {
                    TextField("Subject", text:$placeholderText)
                }
                Section(header: Text("ASSESSMENTS")) {
                    List()
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

struct SubjectSheets_Previews: PreviewProvider {
    static var previews: some View {
        SubjectSheets()
    }
}
