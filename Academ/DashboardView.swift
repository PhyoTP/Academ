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
                ZStack {
                    HStack {
                        Circle()
                            .size(width: 50,height: 50)
                        Circle()
                            .size(width: 50,height: 50)
                        Circle()
                            .size(width: 50,height: 50)
                        Circle()
                            .size(width: 50,height: 50)
                        Circle()
                            .size(width: 50,height: 50)
                    }
                    .padding()
                    List {
                        Section(header: Text("Subjects")) {
                            List($subjectmanager.subjects,editActions:.all){$subject in
                                Text(subject.name)
                                
                            }
                        }
                    }
                    .navigationTitle("Dashboard")
                    .offset(y:100)
                }
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
