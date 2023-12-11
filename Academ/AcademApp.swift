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
    @AppStorage("themes") var colorSelect = 3
    
    let themelists = [
        themeColors(themeName: "Default", hideBackground: false, mainColor: .black, secondColor: Color(hex: "1c1c1e"), LightMode: false),
        
        themeColors(themeName: "Minty", hideBackground: true, mainColor: Color(hex: "165607"), secondColor: Color(hex: "2a6f21"), LightMode: false),
        
        themeColors(themeName: "Purple (Dark mode)", hideBackground: true, mainColor: Color(hex: "31004a"), secondColor: Color(hex: "4c00a4"), LightMode: false),
        
        themeColors(themeName: "Charcoal", hideBackground: true, mainColor: Color(hex: "101314"), secondColor: Color(hex: "36454f"), LightMode: false),
        
        themeColors(themeName: "Light", hideBackground: true, mainColor: .white, secondColor: Color(hex: "f2f2f7"), LightMode: true),
        
        themeColors(themeName: "Beach", hideBackground: true, mainColor: Color(hex: "f5f5dc"), secondColor: Color(hex: "ffffff"), LightMode: true),
        
        themeColors(themeName: "Winter", hideBackground: true, mainColor: Color(hex: "bddeec"), secondColor: Color(hex: "ffffff"), LightMode: true),
        
        themeColors(themeName: "Lemon", hideBackground: true, mainColor: Color(hex: "ffff9f"), secondColor: Color(hex: "ffffff"), LightMode: true),
        
        themeColors(themeName: "Purple (Light mode)", hideBackground: true, mainColor: Color(hex: "d0bdf4"), secondColor: Color(hex: "ffffff"), LightMode: true),
        themeColors(themeName: "Minty", hideBackground: true, mainColor: Color(hex: "E1F8DC"), secondColor: Color(hex: "ffffff"), LightMode: true),
        
    ]
    
}
