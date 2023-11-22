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
            HStack {
                ForEach(subjectmanager.subjects.indices, id: \.self){ index in
                    if index < 5 {
                        VStack{
                            DonutChartView(percentage: CGFloat(subjectmanager.subjects[index].average()))
                                .frame(width: 50, height: 50)
                                .padding(4)
                            
                            Text(subjectmanager.subjects[index].name)
//                            Text(subjectmanager.subjects[index].average())
                        }
                    }
                    
                    
                    
                }
            }
            List {
            //    Text("Test") works 👍🏻
                Section(header: Text("Subjects")) {
                    //Text("Test") works 👍🏻
                    ForEach($subjectmanager.subjects){ $subject in
                        NavigationLink{
                            SubjectDetailView(sub: $subject)
                        }label: {
                            Text(subject.name)
                            Text("Average: \(subject.average(), specifier: "%.0f") %")
                        }
                        
                           
                        //Text()
                        
                        
                    }
                   // Text("baller")
                }
            }
            .navigationTitle("Dashboard")
        }
    }
}
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .environmentObject(SubjectManager())
            .preferredColorScheme(.dark)
    }
}
