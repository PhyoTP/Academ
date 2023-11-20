//
//  Model.swift
//  Academ
//
//  Created by T Krobot on 18/11/23.
//

import Foundation

struct Assessment: Identifiable, Codable{
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
struct Subject: Identifiable, Codable{
    var id = UUID()
    var name: String
    var assessments: [Assessment]
    var credits: Int
}
enum GradeTypes: String,CaseIterable{
    case gpa, msg, al
}
struct GradeSystem{
    var gradeType: GradeTypes
    var grades: Grade
}
struct Grade{
    var name: String
    var minMark: Float
    var maxMark: Float
    var gradePoint: Float
}


