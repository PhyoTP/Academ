//
//  SettingsView.swift
//  Academ
//
//  Created by T Krobot on 18/11/23.
//

import SwiftUI

struct SettingsView: View {
    var systems = ["Default", "GPA", "MSG", "AL"]
    @ObservedObject var userData: UserData
    @State private var showAlert = false
    @EnvironmentObject var subjectmanager: SubjectManager
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
                    }
                }else if userData.selection == 3{
                    Section("AL settings"){
                        
                    }
                }
                Section{
                    Button("Reset to new year", role: .destructive){
                        showAlert = true
                    }
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
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(userData: UserData())
            .environmentObject(SubjectManager())
        
    }
}
