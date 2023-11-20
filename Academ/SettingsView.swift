//
//  SettingsView.swift
//  Academ
//
//  Created by T Krobot on 18/11/23.
//

import SwiftUI

struct SettingsView: View {
    var systems = ["default", "gpa", "msg", "al"]
    @AppStorage("gradeType") var selection = 0

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Grading System", selection: $selection) {
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
        SettingsView()
    }
}
