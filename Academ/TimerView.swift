//
//  TimerView.swift
//  Academ
//
//  Created by yoeh iskandar on 12/10/23.
//

import SwiftUI

struct TimerView: View {
    var body: some View {
        VStack{
            Text("Timer")
                .font(.largeTitle)
                .offset(y:100)
            Circle()
                .strokeBorder(.black, lineWidth: 10)
                .background(Circle().fill(.white))
                .frame(width:400)
            
//            NavigationLink(destination: SetTimerView(), label: Button{
//            } label: {
//                Text("00:00")
//                .offset(y:-390)
//                .font(.system(size:50)))
//            }
        }
    }
}
struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
