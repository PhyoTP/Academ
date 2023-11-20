//
//  ContentView.swift
//  Academ testing maybe
//
//  Created by yoeh iskandar on 9/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 2
    var body: some View {
        
        
        //                .offset(x:-70, y:-10)
        
        TabView(selection: $selection){
            SubjectsView()
                .tabItem{
                    Label("Subjects", systemImage: "books.vertical")
                        .ignoresSafeArea(.all)
                }.tag(1)
            DashboardView()
                .tabItem{
                    Label("Dashboard", systemImage: "house")
                        .ignoresSafeArea(.all)
                }.tag(2)
            SettingsView()
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
    }
}

