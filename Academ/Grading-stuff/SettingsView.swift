//
//  SettingsView.swift
//  Academ
//
//  Created by T Krobot on 18/11/23.
//

import SwiftUI

struct SettingsView: View {
    
    @ObservedObject var userData: UserData
    @State private var hideBackground = false
    @State private var showAlert = false
    @State private var showSheet = false
    @EnvironmentObject var subjectmanager: SubjectManager
    @EnvironmentObject var systemmanager: SystemManager
    var body: some View {
        //Color(hex:0xf2f2f7)
        NavigationStack{
            Form {
                Section("Grading system") {
                    Picker("Grading System Type", selection: $userData.selection) {
                        ForEach(systemmanager.getNames().indices, id: \.self) { index in
                            Text(systemmanager.getNames()[index])
                        }
                    }
                    .pickerStyle(.menu)
                }
                if userData.selection == 1{
                    Section("GPA Settings"){
                        Toggle(isOn: $userData.haveCredits, label: {Text("Have credits?")})
                        List($systemmanager.systems[0].grades){$grade in
                            NavigationLink{
                                GradeDetailView(grade: $grade)
                            }label: {
                                VStack(alignment: .leading){
                                    Text(grade.name)
                                    Text("Grade Point: \(String(format:"%.1f",grade.gradePoint))")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15))
                                }
                            }
                        }
                        Button{
                            showSheet = true
                        }label: {
                            HStack{
                                Image(systemName: "plus")
                                Text("Add a grade")
                            }
                        }
                    }
                    .sheet(isPresented: $showSheet){
                        NewGradeView()
                    }
                }else if userData.selection == 3{
                    Section("AL settings"){
                        
                    }
                }
                Section("Themes") {
                    Picker("Set Theme", selection: $userData.colorSelect) {
                        ForEach(userData.themelists.indices) { index in
                            Text(userData.themelists[index].themeName)
                        }
                    }
                    .pickerStyle(.menu)
                }
                Section{
                    Button("Reset to new year", role: .destructive){
                        showAlert = true
                    }
                }
                .navigationTitle("Settings")
                .alert("Are you sure you want to rest to a new year?", isPresented: $showAlert){
                    Button("Confirm", role: .destructive){
                        subjectmanager.subjects = []
                    }
                    Button("Cancel", role: .cancel){}
                }message: {
                    Text("This cannot be undone.")
                }
            }
         //   .background()
          //  .scrollContentBackground(hideBackground ? .visible : .hidden)
        }

    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(userData: UserData())
            .environmentObject(SubjectManager())
            .environmentObject(SystemManager())
    }
}
