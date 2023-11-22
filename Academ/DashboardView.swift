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
                Text("\(percentage, specifier: "%.0f")%")
                
            }
            //.padding()
            
            
        }
        
        
    }
    
}
struct DashboardView: View {
    @EnvironmentObject var subjectmanager: SubjectManager
    var body: some View {
        NavigationStack{
            
            
            
            List {
                //    Text("Test") works 👍🏻
                ScrollView{
                    HStack {
                        ForEach(subjectmanager.subjects.indices, id: \.self){ index in
                            
                            VStack{
                                DonutChartView(percentage: CGFloat(subjectmanager.subjects[index].average()))
                                    .frame(width: 50, height: 50)
                                    .padding(4)
                                
                                Text(subjectmanager.subjects[index].name)
                                
                            }
                            
                        }
                    }
                }
                .padding()
                .background(Color(red: 255/255, green: 255/255, blue: 255/255))
                .cornerRadius(4)
                Section(header: Text("Subjects")) {
                    //Text("Test") works 👍🏻
                    ForEach($subjectmanager.subjects){ $subject in
                        NavigationLink{
                            SubjectDetailView(sub: $subject)
                        }label: {
                            Text(subject.name)
                            Text("Average: \(subject.average(), specifier: "%.0f") %")
                            if ($subjectmanager.subjects.count == 0) {
                                Text("No subjects available. Go add some in the subjects tab!")
                            }
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
        //.preferredColorScheme(.dark)
    }
}
