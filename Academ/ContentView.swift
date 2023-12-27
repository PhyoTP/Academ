//
//  ContentView.swift
//  Academ testing maybe
//
//  Created by yoeh iskandar on 9/10/23.
//

import SwiftUI
//to clean file errors just do command + shift + k

struct ContentView: View {
    @State private var selection = 2
    @StateObject private var userData = UserData()
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        TabView(selection: $selection){
            SubjectsView(userData: userData)
                .tabItem{
                    Label("Subjects", systemImage: "books.vertical")
                        .ignoresSafeArea(.all)
                }.tag(1)
            DashboardView(userData:userData)
                .tabItem{
                    Label("Dashboard", image: "gauge.open.with.lines.needle.33percent")
                    
                        .ignoresSafeArea(.all)
                }.tag(2)
            SettingsView(userData: userData)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                        .ignoresSafeArea(.all)
                }.tag(3)
            
        }
        .onAppear{
            
            if colorScheme == .light{
                if userData.themelists[userData.colorSelect].LightMode == true{
                    
                }else {
                    userData.colorSelect = 4
                }
                
            } else {
                if userData.themelists[userData.colorSelect].LightMode == false{
                    
                } else {
                    userData.colorSelect = 0
                }
                
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SubjectManager())
            .environmentObject(SystemManager())
        //.colorScheme(.dark)
    }
}

