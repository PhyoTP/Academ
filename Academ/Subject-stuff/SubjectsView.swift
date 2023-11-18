//
//  SubjectsView.swift
//  Academ
//
//  Created by T Krobot on 18/11/23.
//

import SwiftUI

struct SubjectsView: View {
    @ObservedObject var subjectmanager: SubjectManager
    
    var body: some View {
        NavigationStack {
            //List($SubjectManager.todos, editActions: [.all]) { $subject in
            //    TodoRowView(todo: $todo)
           
            }
            .navigationTitle("Subjects")
            .toolbar {
                ToolbarItem{
                    Button{
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
        }
    }


struct SubjectsView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectsView(subjectmanager: SubjectManager())
    }
}
