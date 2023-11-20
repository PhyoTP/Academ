//
//  SubjectOverallview.swift
//  Academ
//
//  Created by yoeh iskandar on 18/11/23.
//

import SwiftUI

struct SubjectOverallview: View {
    @EnvironmentObject var subjectmanager: SubjectManager
    var body: some View {
        NavigationStack{
            VStack{
                
            }
        }
    }
}

struct SubjectOverallview_Previews: PreviewProvider {
    static var previews: some View {
        SubjectOverallview()
            .environmentObject(SubjectManager())
    }
}
