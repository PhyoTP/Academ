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
        themeColors(themeName: "Default (For Dark Mode)", hideBackground: false, mainColor: .black, secondColor: Color(hex: "1c1c1e")),
     //   textColor: .white
     
        themeColors(themeName: "Minty (For Dark Mode)", hideBackground: true, mainColor: Color(hex: "165607"), secondColor: Color(hex: "2a6f21")),
        // textColor: .white
        themeColors(themeName: "Dark (For Dark Mode)", hideBackground: true, mainColor: Color(hex: "000000"), secondColor: Color(hex: "5a5a5a")),
        // textColor: .white
        themeColors(themeName: "Light (For Light Mode)", hideBackground: true, mainColor: Color(hex: "ffffff"), secondColor: Color(hex: "f2f2f7")),
                    //textColor: .black)
        themeColors(themeName: "Beach (For Light Mode)", hideBackground: true, mainColor: Color(hex: "f5f5dc"), secondColor: Color(hex: "ffffff")),
        // textColor: .black)
        themeColors(themeName: "Winter (For Light Mode)", hideBackground: true, mainColor: Color(hex: "bddeec"), secondColor: Color(hex: "ffffff")),
        // textColor: .black
        themeColors(themeName: "Lemon (For Light Mode)", hideBackground: true, mainColor: Color(hex: "ffff00"), secondColor: Color(hex: "ffffff")),
       // textColor: .black
       
        themeColors(themeName: "Salmon (For Light Mode)", hideBackground: true, mainColor: Color(hex: "c9343c"), secondColor: Color(hex: "ffdbe3")),
        //textColor: .black
    ]

}
