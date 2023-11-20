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
}
enum GradeType{
    case GPA, MSG, AL, ALf
}
struct GradeSystem{
    var gradeType: GradeType
    var grades: Grade
}
struct Grade{
    var name: String
    var minMark: Float
    var maxMark: Float
    var gradePoint: Float
}

