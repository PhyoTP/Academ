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
                MarkCalculatorView()
                    .tabItem{
                        Label("Subjects", systemImage: "book.pages")
                            .ignoresSafeArea(.all)
                    }
                TimerView()
                    .tabItem{
                        Label("Dashboard", systemImage: "timer.circle.fill")
                            .ignoresSafeArea(.all)
                    }
                ScheduleView()
                    .tabItem {
                        Label("Reminders", systemImage: "bell.fill")
                            .ignoresSafeArea(.all)
                            }
//                NotesView()
//                    .tabItem{
//                        Label("Notes", systemImage:"list.bullet.clipboard")
//                            .ignoresSafeArea(.all)
//                    }


            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

