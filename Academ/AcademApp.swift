//
//  AcademApp.swift
//  Academ
//
//  Created by T Krobot on 1/10/23.
//

import SwiftUI
import UserNotifications

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
    @AppStorage("gpaCredits") var haveCredits = false
    @AppStorage("themes") var colorSelect = 0
}
