//
//  DashboardView.swift
//  Academ
//
//  Created by T Krobot on 18/11/23.
//

import SwiftUI

struct DonutChartView: View {
    var percentage: CGFloat
    @EnvironmentObject var subjectmanager: SubjectManager
    var body: some View {
        VStack{
            ZStack {
                Circle()
                    .stroke(lineWidth: 6)
                    .opacity(0.3)
                    .foregroundColor(Color.gray)
                Circle()
                    .trim(from: 0.0, to: percentage / 100.0)
                    .stroke(style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.blue)
                    .rotationEffect(Angle(degrees: -90))
                Text("\(Int(percentage))%")
            }
        }
    }
}
struct DashboardView: View {
    @EnvironmentObject var subjectmanager: SubjectManager
    
    var body: some View {
        NavigationStack{
            
             
                    VStack {
                        ForEach(subjectmanager.subjects.indices, id: \.self){ index in
                                DonutChartView(percentage: 75)
                                    .frame(width: 50, height: 50)
                                    .padding(4)
                            if index < 5 {
                                Text(subjectmanager.subjects[index].name)
                            }
                            
                    List {
                        Section(header: Text("Subjects")) {
                            List($subjectmanager.subjects,editActions:.all){ $subject in
                                VStack {
                                    Text(subject.name)
                                    //Text("%")
                                }
                                
                            }
                        }
                    }
                    .navigationTitle("Dashboard")
                    //.offset(y:100)
                }
               // DonutChartView(percentage: 75)
                    
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

