//
//  SubjectsView.swift
//  Academ
//
//  Created by T Krobot on 18/11/23.
//

import SwiftUI

struct SubjectsView: View {
    @EnvironmentObject var settings: SubjectManager
    
    var body: some View {
        NavigationStack {
            
            Form{
                Section{
                    List($settings.subjects,editActions: .all){$subject in
                        NavigationLink{
                            SubjectDetailView(sub:$subject)
                        }label:{
                            Text(subject.name)
                        }
                    }
                }
            }
            .navigationTitle("Subjects")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}




struct SubjectsView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectsView()
            .environmentObject(SubjectManager())
    }
}
