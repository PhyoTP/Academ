//
//  SubjectsView.swift
//  Academ
//
//  Created by T Krobot on 18/11/23.
//

import SwiftUI

struct SubjectsView: View {
    @EnvironmentObject var settings: SubjectManager
    @State private var displaySheet = false
    var body: some View {
        NavigationStack{
            
            Form{
                Section{
                    if settings.subjects.count == 0 {
                        Text("No subjects")
                            .foregroundColor(.gray)
                    }else{
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
            .navigationTitle("Subjects")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        displaySheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $displaySheet) {
                NewSubjectView()
                    .presentationDetents([.fraction(0.8)])
                    .presentationDragIndicator(.visible)
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
