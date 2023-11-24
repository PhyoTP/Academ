//
//  GradeDetailView.swift
//  Academ
//
//  Created by T Krobot on 24/11/23.
//

import SwiftUI

struct GradeDetailView: View {
    @Binding var grade: Grade
    var body: some View {
        Form{
            Section("Grade Info"){
                TextField("Name", text: $grade.name)
                HStack{
                    Text("Min. Mark:")
                    TextField("Number",value: $grade.minMark, formatter: NumberFormatter())
                }
                HStack{
                    Text("Max. Mark:")
                    TextField("Number",value: $grade.maxMark, formatter: NumberFormatter())
                }
                HStack{
                    Text("Grade Point:")
                    TextField("Number",value: $grade.gradePoint, formatter: NumberFormatter())
                }
            }
        }
    }
}

struct GradeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GradeDetailView(grade: .constant(Grade(name: "A", minMark: 80, maxMark:100 , gradePoint: 4.0)))
    }
}
