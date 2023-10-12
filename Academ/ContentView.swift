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
                ScheduleView()
                    .tabItem {
                        Label("Schedule", systemImage: "checklist")
                            .ignoresSafeArea(.all)
                            }
                NotesView()
                    .tabItem{
                        Label("Notes", systemImage:"list.bullet.clipboard")
                            .ignoresSafeArea(.all)
                    }
                TimerView()
                    .tabItem{
                        Label("Timer", systemImage: "timer.circle.fill")
                            .ignoresSafeArea(.all)
                    }
                MarkCalculatorView()
                    .tabItem{
                        Label("Calculator", systemImage: "minus.diamond.fill")
                            .ignoresSafeArea(.all)
                    }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

