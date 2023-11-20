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
    @State private var totalMarks = 0
    @State private var targetMarks = 0
    @State private var examDone = false
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
                    TextField("Marks", value: $totalMarks, formatter: NumberFormatter())
                    
                }
                HStack{
                    Text("Target marks:")
                    TextField("Marks", value: $targetMarks, formatter: NumberFormatter())
                }
                HStack{
                    Text("Exam done?")
                    Toggle(isOn: $examDone){
                        Text("")
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
}
