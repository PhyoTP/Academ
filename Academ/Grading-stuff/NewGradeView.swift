//
//  NewGradeView.swift
//  Academ
//
//  Created by T Krobot on 24/11/23.
//

import SwiftUI

struct NewGradeView: View {
    @State private var newGrade = Grade(name: "", minMark: 0, maxMark: 0, gradePoint: 0)
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var systemmanager: SystemManager
    var body: some View {
        Form{
            Section("Grade Info"){
                TextField("Name", text: $newGrade.name)
                HStack{
                    Text("Min. Mark:")
                    TextField("Number",value: $newGrade.minMark, formatter: NumberFormatter())
                }
                HStack{
                    Text("Max. Mark:")
                    TextField("Number",value: $newGrade.maxMark, formatter: NumberFormatter())
                }
                HStack{
                    Text("Grade Point:")
                    TextField("Number",value: $newGrade.gradePoint, formatter: NumberFormatter())
                }
            }
            Section{
                Button("Save"){
                    systemmanager.systems[0].grades.append(newGrade)
                    dismiss()
                }
                Button("Cancel",role: .destructive){
                    dismiss()
                }
            }
        }
    }
}

struct NewGradeView_Previews: PreviewProvider {
    static var previews: some View {
        NewGradeView()
    }
}
