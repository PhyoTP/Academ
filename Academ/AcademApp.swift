//
//  AcademApp.swift
//  Academ
//
//  Created by T Krobot on 1/10/23.
//

import SwiftUI

@main
struct AcademApp: App {
    @AppStorage("gradeType") var selection = 0
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(SubjectManager())
        }
    }
}
