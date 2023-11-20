//
//  AcademApp.swift
//  Academ
//
//  Created by T Krobot on 1/10/23.
//

import SwiftUI

@main
struct AcademApp: App {
    @AppStorage("gradeSys") private var selection = GradeTypes.al
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
