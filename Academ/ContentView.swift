//
//  ContentView.swift
//  Academ testing maybe
//
//  Created by yoeh iskandar on 9/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            //                .offset(x:-70, y:-10)
            
            TabView{
                SubjectsView()
                    .tabItem{
                        Label("Subjects", systemImage: "books.vertical")
                            .ignoresSafeArea(.all)
                    }
                DashboardView()
                    .tabItem{
                        Label("Dashboard", systemImage: "house")
                            .ignoresSafeArea(.all)
                    }
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                            .ignoresSafeArea(.all)
                    }
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SubjectManager())
    }
}

