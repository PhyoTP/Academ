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
            //            .navigationTitle("Subjects")
            //            .toolbar {
            //                ToolbarItem{
            //                    Button{
            //
            //                    } label: {
            //                        Image(systemName: "plus")
            //                    }
            //                }
            //                ToolbarItem(placement: .navigationBarLeading) {
            //                    EditButton()
            //                }
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
        }
    }
}





struct SubjectsView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectsView()
            .environmentObject(SubjectManager())
    }
}
