//
//  NewAssessmentView.swift
//  Academ
//
//  Created by yoeh iskandar on 20/11/23.
//

import SwiftUI

struct NewAssessmentView: View {
    @State private var name = ""
    @State private var assessmentPercentage = 0
    @State private var total_marks = 0
    @State private var target_marks = 0
    @State private var exam_done = false
    var body: some View {
        Form{
            Section("Assessment Info"){
                TextField("Name",text: $name)
                //TextField()
                HStack{
                    Text("Percentage value:")
                    TextField("Percentage", value: $assessmentPercentage, formatter: NumberFormatter())
                    Text("%")
                    
                    
                }
                HStack{
                    Text("Total marks:")
                    TextField("Marks", value: $total_marks, formatter: NumberFormatter())
                    
                }
                HStack{
                    Text("Target marks:")
                    TextField("Marks", value: $target_marks, formatter: NumberFormatter())
                }
                HStack{
                    Text("Exam done?")
                    
                }
            }
        }

    }
}

struct NewAssessmentView_Previews: PreviewProvider {
    static var previews: some View {
        NewAssessmentView()
    }
}
