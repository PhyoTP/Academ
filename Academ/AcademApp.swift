//
//  AcademApp.swift
//  Academ
//
//  Created by T Krobot on 1/10/23.
//

import SwiftUI

@main
struct AcademApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(SubjectManager())
        }
    }
}
class UserData: ObservableObject{
    @AppStorage("gradeType") var selection = 0
}
