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

    var body: some View {
        NavigationView {
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
            }
            .navigationTitle("Settings")
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(userData: UserData())
            
    }
}
