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
        center.delegate = self 
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
    
    let themelists = [
        themeColors(themeName: "Default", hideBackground: false, mainColor: .black, secondColor: .black),
        themeColors(themeName: "Manual Light", hideBackground: true, mainColor: Color(hex: "ffffff"), secondColor: Color(hex: "f2f2f7")),
        themeColors(themeName: "Manual Dark", hideBackground: true, mainColor: Color(hex: "000000"), secondColor: Color(hex: "5a5a5a")),
        themeColors(themeName: "Beach", hideBackground: true, mainColor: Color(hex: "f5f5dc"), secondColor: Color(hex: "ffffff")),
        themeColors(themeName: "Winter", hideBackground: true, mainColor: Color(hex: "739bdo"), secondColor: Color(hex: "bddeec")),
        themeColors(themeName: "Lemon", hideBackground: true, mainColor: Color(hex: "ffff00"), secondColor: Color(hex: "ffffff")),
        themeColors(themeName: "Minty", hideBackground: true, mainColor: Color(hex: "165607"), secondColor: Color(hex: "2a6f21")),
        themeColors(themeName: "Salmon", hideBackground: true, mainColor: Color(hex: "ffdbe3"), secondColor: Color(hex: "c9343c")),
        themeColors(themeName: "Custom", hideBackground: true, mainColor: Color(hex: "ffffff"), secondColor: Color(hex: "ffffff"))
    ]

}
