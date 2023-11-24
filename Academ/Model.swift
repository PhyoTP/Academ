//
//  Model.swift
//  Academ
//
//  Created by T Krobot on 18/11/23.
//

import Foundation
import SwiftUI

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
    // var hasGoal: Bool
    var credits: Int
    var numOfAssessments: Int
    func assessmentArray(type:Int)->[Float]{
        var numArray:[Float] = []
        for i in assessments{
            if i.examDone{
                if type == 0{
                    numArray.append(i.totalMarks) // maximum number of marks
                }else if type == 1{
                    numArray.append(i.markAttained) // number of marks attained
                }else if type == 2{
                    numArray.append(i.percentageValue) // weightage
                }
            }else{
                if type == 3{
                    numArray.append(i.totalMarks)
                }
            }
        }
        return numArray
    }//gets a value from the assessments array (type 0 is totalMarks for done assessments, 1 is marksAttained, 2 is percentageValue, 3 is totalMarks for not done exams)
    func arrayPercentage()->[Float]{
        let amountArray = assessmentArray(type:1) // marks attained
        let totaledArray = assessmentArray(type:0) // max marks
        var percentageArray:[Float] = []
        for i in 0..<amountArray.count{
            percentageArray.append(percentage(amount: amountArray[i], total: totaledArray[i]))
        }
        return percentageArray
    }//calculates percentage and puts it in an array
    func highest()->Float{
        let floatArray = arrayPercentage()
        var high:Float=0
        for i in floatArray{
            if i > high{
                high=i
            }
        }
        return high
    }//finds the highest value in an array
    /*func average()->Float{
        let floatArray = arrayPercentage()
        var sum:Float = 0
        for i in floatArray{
            sum+=i
        }
        sum/=Float(floatArray.count)
        return sum
        
    }*///finds the average of floats in an array (deprecated)
    func currentOverall() -> Float {
        let examPercentages = assessmentArray(type: 2)
        let arrayPercentages = arrayPercentage()
        
        guard !examPercentages.isEmpty && examPercentages.count == arrayPercentages.count else {
            // Handle the case where either examPercentages is empty or its count is different from arrayPercentages count.
            return 0.0
        }
        
        var total: Float = 0
        
        for i in examPercentages.indices {
            total += examPercentages[i] * arrayPercentages[i]
        }
        
        let totalExamPercentages = examPercentages.reduce(0, +)
        return totalExamPercentages != 0 ? total / totalExamPercentages : 0.0
        
        
    }//finds the current overall based on the percentage
    func weightedGoal()->Float{
        var percentageSum:Float=0
        for i in 0..<arrayPercentage().count{
            percentageSum+=arrayPercentage()[i]/100*assessmentArray(type: 2)[i]
        }
        var valueSum:Float = 0
        for i in assessmentArray(type: 2){
            valueSum+=i
        }
        valueSum=100-valueSum
        let sum = (targetGrade-percentageSum)/valueSum*100
        return sum
    }//finds the percentage needed to achieve the goal
    func checkIfSubjectGradeExceeds100() -> Float{
        
        var finalGradeForSubject:Float = 0.0
       // var exceeds100 = false
        for test in  (assessments) {
            finalGradeForSubject += test.percentageValue
            
    //        if finalGradeForSubject >= 100.0 {
   //             exceeds100 = true        
   //         }
        }
        return finalGradeForSubject
    }//pretty self explanatory
    func getUnfinishedAssessments()->[Assessment]{
    var unfinishedArray:[Assessment]=[]
        for i in assessments{
            if !i.examDone{
                unfinishedArray.append(i)
            }
        }
        return unfinishedArray
    }
}
struct GradeSystem: Codable{
    var type: Int
    var grades: [Grade]
    func gpaCalculate(){
        
    }
}
struct Grade: Codable{
    var name: String
    var minMark: Float
    var maxMark: Float
    var gradePoint: Float
}



func percentage(amount:Float,total:Float)->Float{
    return amount/total*100
}

var gradingSystems = [
    GradeSystem(type: 1, grades: [
        //user input here
    ]),
    GradeSystem(type: 2, grades: [
        Grade(name: "A1", minMark: 75, maxMark: 100, gradePoint: 1.0),
        Grade(name: "A2", minMark: 70, maxMark: 74, gradePoint: 2.0),
        Grade(name: "B3", minMark: 65, maxMark: 69, gradePoint: 3.0),
        Grade(name: "B4", minMark: 60, maxMark: 64, gradePoint: 4.0),
        Grade(name: "C5", minMark: 55, maxMark: 59, gradePoint: 5.0),
        Grade(name: "C6", minMark: 50, maxMark: 54, gradePoint: 6.0),
        Grade(name: "D7", minMark: 45, maxMark: 49, gradePoint: 7.0),
        Grade(name: "D8", minMark: 40, maxMark: 44, gradePoint: 8.0),
        Grade(name: "F9", minMark: 0, maxMark: 39, gradePoint: 9.0),
    ]),
    GradeSystem(type: 3, grades: [
        Grade(name: "AL1", minMark: 90, maxMark: 100, gradePoint: 1.0),
        Grade(name: "AL2", minMark: 85, maxMark: 89, gradePoint: 2.0),
        Grade(name: "AL3", minMark: 80, maxMark: 84, gradePoint: 3.0),
        Grade(name: "AL4", minMark: 75, maxMark: 79, gradePoint: 4.0),
        Grade(name: "AL5", minMark: 65, maxMark: 74, gradePoint: 5.0),
        Grade(name: "AL6", minMark: 45, maxMark: 64, gradePoint: 6.0),
        Grade(name: "AL7", minMark: 20, maxMark: 44, gradePoint: 7.0),
        Grade(name: "AL8", minMark: 0, maxMark: 19, gradePoint: 8.0),
    ])
]

//var mainColor : Color = .green
//var secondColor : Color = .blue



