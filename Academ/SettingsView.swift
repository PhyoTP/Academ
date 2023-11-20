//
//  SettingsView.swift
//  Academ
//
//  Created by T Krobot on 18/11/23.
//

import SwiftUI

struct SettingsView: View {
    @State private var selection = GradeTypes.al
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    Picker("Grading System", selection: $selection){
                        ForEach(GradeTypes.allCases, id: \.self) {

                            Text("\($0.rawValue.uppercased())")
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
