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
            List{
                Section(header: Text("subject info")) {
                    Text(sub.name)
                    Text("")
                }
                Section(header: Text("Assessments")) {
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
            List{
                Section(header: Text("Assessment info")) {
                    
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
