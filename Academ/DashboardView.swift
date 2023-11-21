//
//  DashboardView.swift
//  Academ
//
//  Created by T Krobot on 18/11/23.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var subjectmanager: SubjectManager
    var body: some View {
        NavigationStack{
            VStack {
                List {
                    Section(header: Text("Subjects")) {
                        List($subjectmanager.subjects,editActions:.all){$subject in
                            Text(subject.name)
                        }
                    }
                    
                    
                }
                .navigationTitle("Dashboard")
            }
        }
    }
}
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .environmentObject(SubjectManager())
    }
}
