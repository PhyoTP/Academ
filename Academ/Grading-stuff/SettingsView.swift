//
//  SettingsView.swift
//  Academ
//
//  Created by T Krobot on 18/11/23.
//

import SwiftUI

struct SettingsView: View {
    var systems = ["Default", "GPA", "MSG", "AL"]
    var themelist = ["Default", "Manual Light", "Manual Dark", "Beach",  "Winter", "Lemon", "Minty", "Salmon", "Custom"]
    var themelists = [themeColors(themeName: "Default", hideBackground: false, mainColor: .black, secondColor: .black),themeColors(themeName: "Manual Light", hideBackground: true, mainColor: Color(hex: "ffffff"), secondColor: Color(hex: "f2f2f7")),themeColors(themeName: "Manual Dark", hideBackground: true, mainColor: Color(hex: "000000"), secondColor: Color(hex: "5a5a5a")),themeColors(themeName: "Beach", hideBackground: true, mainColor: Color(hex: "f5f5dc"), secondColor: Color(hex: "ffffff")),themeColors(themeName: "Winter", hideBackground: true, mainColor: Color(hex: "739bdo"), secondColor: Color(hex: "bddeec")),themeColors(themeName: "Lemon", hideBackground: true, mainColor: Color(hex: "ffff00"), secondColor: Color(hex: "ffffff")),themeColors(themeName: "Minty", hideBackground: true, mainColor: Color(hex: "165607"), secondColor: Color(hex: "2a6f21")),themeColors(themeName: "Salmon", hideBackground: true, mainColor: Color(hex: "ffdbe3"), secondColor: Color(hex: "c9343c")),themeColors(themeName: "Custom", hideBackground: true, mainColor: Color(hex: "ffffff"), secondColor: Color(hex: "ffffff"))]
    @ObservedObject var userData: UserData
    @State private var hideBackground = false
    @State private var showAlert = false
    @State private var showSheet = false
    @EnvironmentObject var subjectmanager: SubjectManager
    @EnvironmentObject var systemmanager: SystemManager
    var body: some View {
        NavigationStack{
            Form {
                Section("Grading system") {
                    Picker("Grading System Type", selection: $userData.selection) {
                        ForEach(systems.indices, id: \.self) { index in
                            Text(systems[index])
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
                        ForEach(themelist.indices, id: \.self) { index in
                            Text(themelist[index])
                        }
                    }
                    .pickerStyle(.menu)
                }
                if userData.colorSelect == 0 {
                    
                } else if userData.colorSelect == 1 {
                    hideBackground = true
//                    mainColor = .white
//                    secondColor = .gray
                } else if userData.colorSelect == 2 {
                    hideBackground = true
                } else if userData.colorSelect == 3 {
                    hideBackground = true
                } else if userData.colorSelect == 4 {
                    hideBackground = true
                } else if userData.colorSelect == 5 {
                    hideBackground = true
                } else if userData.colorSelect == 6 {
                    hideBackground = true
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
            .background(.green)
            .scrollContentBackground(hideBackground ? .visible : .hidden)
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
