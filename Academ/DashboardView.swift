//
//  DashboardView.swift
//  Academ
//
//  Created by T Krobot on 18/11/23.
//

import SwiftUI
import Charts
struct ChartAssessment: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var mark: Int
}
struct DonutChartView: View {
    var percentage: CGFloat
    //    @EnvironmentObject var subjectmanager: SubjectManager
    @ObservedObject var userData: UserData
    @EnvironmentObject var systemmanager: SystemManager
    var formattedResult: String {
        return percentage.isNaN || percentage.isSignalingNaN ? "--" : systemmanager.gradeCalculate(mark: Double(percentage), formatt: "%.0f")
    }
    var body: some View {
        
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
            Text("\(formattedResult)")
            
        }
        
    }
}

struct DashboardView: View {
    @EnvironmentObject var subjectmanager: SubjectManager
    @ObservedObject var userData: UserData
    @EnvironmentObject var systemmanager: SystemManager
    var body: some View {
        NavigationStack{
            List {
                Section{
                    if subjectmanager.subjects.count == 0 {
                        Text("No subjects")
                            .foregroundColor(.gray)
                        
                    }else{
                        ScrollView(.horizontal){
                            HStack {
                                ForEach(subjectmanager.subjects.indices, id: \.self){ index in
                                    VStack{
                                        DonutChartView(percentage:CGFloat(subjectmanager.subjects[index].currentOverall()),userData:userData)
                                            .frame(width: 70, height: 50)
                                            .padding(4)
                                        Text(subjectmanager.subjects[index].name)
                                    }
                                    
                                }
                            }
                            
                        }
                        
                        .cornerRadius(4)
                    }
                }
                .listRowBackground(userData.themelists[userData.colorSelect].secondColor)
                
                    if subjectmanager.subjects.count == 0 {
                        Text("No subjects available. Go add some in the subjects tab!")
                            .foregroundColor(.gray)
                    }else{
                        ForEach($subjectmanager.subjects){ $subject in
                            
                            if subject.assessments.count > 1 {
                                // Text("\(subject.name) results")
                                Section(subject == subjectmanager.subjects.first ? "Subjects" : "") {
                                    NavigationLink(destination: SubjectDetailView(sub: $subject,userData: userData)){
                                        VStack{
                                            Text("\(subject.name) trends")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .offset(y: 8)
                                            Chart(subject.assessments, id: \.self) { assessment in
                                                LineMark(x: .value("Assessment", assessment.name), y: .value("Mark", percentage(amount: assessment.markAttained, total: assessment.totalMarks)))
                                                    .foregroundStyle(.red)
                                                    
                                                LineMark(x: .value("Assessment", assessment.name), y: .value("Mark", subject.targetMark),series: .value("blank", "smth"))
                                                    .foregroundStyle(.green)

                                                    
                                            }
                
                                            
 
                                            
                                        }
                                        .frame(width: 300, height: 200)
                                        .chartYScale(domain:0...100)
  
                                    }
                                    HStack{
                                        Image(systemName: "circle.fill")
                                            .foregroundColor(.red)
                                        Text("Marks per WA")
                                        Image(systemName: "circle.fill")
                                            .foregroundColor(.green)
                                        Text("Goal marks")
                                    }
                                }
                                
                                .listRowBackground(userData.themelists[userData.colorSelect].secondColor)
                            } else {
                                Section{
                                    NavigationLink(destination: SubjectDetailView(sub: $subject,userData: userData)){
                                        Text("\(subject.name) needs at least two scores to see overall grades.")
                                    }
                                }
                                .listRowBackground(userData.themelists[userData.colorSelect].secondColor)
                                
                            }
                        }
                    
                    }
                
                
                    
   
                }
            .background(userData.themelists[userData.colorSelect].mainColor)
            .scrollContentBackground(userData.themelists[userData.colorSelect].hideBackground ? .hidden : .visible)
            .navigationTitle("Dashboard")
        }
    }
    
}
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(userData: UserData())
            .environmentObject(SubjectManager())
            .environmentObject(SystemManager())
    }
}
