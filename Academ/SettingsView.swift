//
//  SettingsView.swift
//  Academ
//
//  Created by T Krobot on 18/11/23.
//

import SwiftUI

struct SettingsView: View {
    var systems = ["default", "gpa", "msg", "al"]
    @ObservedObject var userData: UserData

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Grading System", selection: $userData.selection) {
                        ForEach(systems.indices, id: \.self) { index in
                            Text(systems[index].capitalized)
                        }
                    }
                    .pickerStyle(.menu)
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
