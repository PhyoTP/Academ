//
//  Model.swift
//  Academ
//
//  Created by T Krobot on 18/11/23.
//

import Foundation

struct Assessment: Identifiable{
    var id = UUID()
    var name: String
    var percentageValue: Float
    var totalMarks: Float
    var examDone: Bool
    var markAttained: Float
    var examDate: Date
    var targetMarks: Float
    var haveReminder: Bool
    var reminder: Date
}
struct Subject: Identifiable{
    var id = UUID()
    var name: String
    var assessments: [Assessment]
}

