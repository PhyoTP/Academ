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
    var body: some View {
        TabView(selection: $selection){
            SubjectsView()
                .tabItem{
                    Label("Subjects", systemImage: "books.vertical")
                        .ignoresSafeArea(.all)
                }.tag(1)
            DashboardView(userData: UserData())
                .tabItem{
                    Label("Dashboard", image: "gauge.open.with.lines.needle.33percent")
                        
                        .ignoresSafeArea(.all)
                }.tag(2)
            SettingsView(userData: UserData())
                .tabItem {
                    Label("Settings", systemImage: "gear")
                        .ignoresSafeArea(.all)
                }.tag(3)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SubjectManager())
    }
}

