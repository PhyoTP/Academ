//
//  AcademApp.swift
//  Academ
//
//  Created by T Krobot on 1/10/23.
//

import SwiftUI
import UserNotifications

class AppDelegate: NSObject, UNUserNotificationCenterDelegate, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Notification authorization granted")
            } else {
                print("Notification authorization denied")
            }
        }
        
        return true
    }
}

@main
struct AcademApp: App {
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(SubjectManager())
                .environmentObject(SystemManager())
        }
    }
}
class UserData: ObservableObject{
    @AppStorage("gradeType") var selection = 0
    @AppStorage("gpaCredits") var haveCredits = false
    @AppStorage("themes") var colorSelect = 0
}
