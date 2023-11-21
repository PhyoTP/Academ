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
    
    var haveReminder: Bool
    var reminder: Date
}
struct Subject: Identifiable, Codable{
    var id = UUID()
    var name: String
    var assessments: [Assessment]
    var targetGrade: Float
    var credits: Int
    
    func assessmentArray(total:Bool)->[Float]{
        var numArray:[Float] = []
        for i in assessments{
            if i.examDone{
                if total{
                    numArray.append(i.totalMarks)
                }else{
                    numArray.append(i.markAttained)
                }
            }
        }
        return numArray
    }
    func arrayPercentage()->[Float]{
        let amountArray = assessmentArray(total: false)
        let totaledArray = assessmentArray(total: true)
        var percentageArray:[Float] = []
        for i in 0..<amountArray.count{
            percentageArray.append(percentage(amount: amountArray[i], total: totaledArray[i]))
        }
        return percentageArray
    }
    func highest()->Float{
        let floatArray = arrayPercentage()
        var high:Float=0
        for i in floatArray{
            if i > high{
                high=i
            }
        }
        return high
    }
    func average()->Float{
        let floatArray = arrayPercentage()
        var sum:Float = 0
        for i in floatArray{
            sum+=i
        }
        sum/=Float(floatArray.count)
        return sum
        
    }
    
}
  // redesign average function 



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






