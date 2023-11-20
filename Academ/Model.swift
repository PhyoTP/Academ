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
    var grades: Grade
}
struct Grade{
    var name: String
    var minMark: Float
    var maxMark: Float
    var gradePoint: Float
}
func percentage(amount:Float,total:Float)->Float{
    return amount/total*100
}
func average(floatArray:[Float])->Float{
    var sum:Float = 0
    for i in floatArray{
        sum+=i
    }
    sum/=Float(floatArray.count)
    return sum
    
}
func highest(floatArray:[Float])->Float{
    var high:Float=0
    for i in floatArray{
        if i > high{
            high=i
        }
    }
    return high
}
func arrayPercentage(amountArray:[Float],totaledArray:[Float])->[Float]{
    var percentageArray:[Float] = []
    for i in 0...amountArray.count{
        percentageArray.append(percentage(amount: amountArray[i], total: totaledArray[i]))
    }
    return percentageArray
}



