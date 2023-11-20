//
//  SubjectSheets.swift
//  Academ
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI

struct SubjectSheets: View {
    @EnvironmentObject var settings: SubjectManager
    @State private var placeholderText = ""
    var body: some View {
        NavigationStack {
            List{
                Section(header: Text("SUBJECT INFO")) {
                    TextField("Subject", text:$placeholderText)
                }
                Section(header: Text("ASSESSMENTS")) {
                    TextField("Subject", text:$placeholderText)
//                    List($settings.subjects,editActions: .all){$subject in
//
//                        NavigationLink{
//                            SubjectDetailView(sub:$subject)
//                        }label:{
//                            Text("subject.name")
//                        }
//                    }
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
