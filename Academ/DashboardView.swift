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
    var formattedResult: String {
        return percentage.isNaN || percentage.isSignalingNaN ? "--" : String(format: "%.0f", percentage)
    }
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
                    .foregroundColor(Color.accentColor)
                    .rotationEffect(Angle(degrees: -90))
                Text("\(formattedResult)%")
                
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
                if subjectmanager.subjects.count == 0 {
                    Text("No subjects")
                        .foregroundColor(.gray)
                }else{
                    ScrollView(.horizontal){
                        HStack {
                            ForEach(subjectmanager.subjects.indices, id: \.self){ index in
                                
                                VStack{
//                                    if subjectmanager.subjects[index].currentOverall().isNaN {
//                                        DonutChartView(percentage:CGFloat(0))
//                                            .frame(width: 50, height: 50)
//                                            .padding(4)
//                                        Text(subjectmanager.subjects[index].name)
//                                    } else {
                                        DonutChartView(percentage:CGFloat(subjectmanager.subjects[index].currentOverall()))
                                            .frame(width: 50, height: 50)
                                            .padding(4)
                                        Text(subjectmanager.subjects[index].name)
//                                    }
                                }
                            }
                        }
                    }
                    .cornerRadius(4)
                }
                Section(header: Text("Subjects")) {
                    if subjectmanager.subjects.count == 0 {
                        Text("No subjects available. Go add some in the subjects tab!")
                            .foregroundColor(.gray)
                    }else{
                        ForEach($subjectmanager.subjects){ $subject in
                            NavigationLink{
                                SubjectDetailView(sub: $subject,userData: UserData())
                            }label: {
                                VStack{
                                    Text(subject.name)
//                                    if (subject.currentOverall().isNaN) {
//                                        Text("Current Overall: --%")
//                                            .font(.subheadline)
//                                            .foregroundColor(.gray)
//                                    } else {
//                                        Text("Current Overall: \(subject.currentOverall(), specifier: "%.2f")%")
//                                            .font(.subheadline)
//                                            .foregroundColor(.gray)
//                                    }
                                }
                            }
                        }
                    }
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
