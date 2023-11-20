//
//  SubjectDetailView.swift
//  Academ
//
//  Created by yoeh iskandar on 18/11/23.
//

import SwiftUI

struct SubjectDetailView: View {
    @Binding var sub: Subject
    var body: some View {
        
        NavigationStack {
            List{
                Section(header: Text("subject info")) {
                    Text(sub.name)
                    Text("")
                }
                Section(header: Text("Assessments")) {
                    Button {
                        print("swifso")
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
        
    }
}
struct SubjectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectDetailView(sub: .constant(Subject(name: "Mathematics", assessments: [])))
    }
}
