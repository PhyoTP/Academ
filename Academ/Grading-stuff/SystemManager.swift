//
//  SystemManager.swift
//  Academ
//
//  Created by T Krobot on 24/11/23.
//

import Foundation
import SwiftUI

class SystemManager: ObservableObject {
    @Published var systems: [GradeSystem] = [
        GradeSystem(name: "Default", grades: []),
        GradeSystem(name: "GPA", grades: [
            //user input here
        ]),// GPA
        GradeSystem(name: "MSG", grades: [
            Grade(name: "A1", minMark: 75, maxMark: 100, gradePoint: 1.0),
            Grade(name: "A2", minMark: 70, maxMark: 74, gradePoint: 2.0),
            Grade(name: "B3", minMark: 65, maxMark: 69, gradePoint: 3.0),
            Grade(name: "B4", minMark: 60, maxMark: 64, gradePoint: 4.0),
            Grade(name: "C5", minMark: 55, maxMark: 59, gradePoint: 5.0),
            Grade(name: "C6", minMark: 50, maxMark: 54, gradePoint: 6.0),
            Grade(name: "D7", minMark: 45, maxMark: 49, gradePoint: 7.0),
            Grade(name: "E8", minMark: 40, maxMark: 44, gradePoint: 8.0),
            Grade(name: "F9", minMark: 0, maxMark: 39, gradePoint: 9.0),
        ]),// MSG
        GradeSystem(name: "AL", grades: [
            Grade(name: "AL1", minMark: 90, maxMark: 100, gradePoint: 1.0),
            Grade(name: "AL2", minMark: 85, maxMark: 89, gradePoint: 2.0),
            Grade(name: "AL3", minMark: 80, maxMark: 84, gradePoint: 3.0),
            Grade(name: "AL4", minMark: 75, maxMark: 79, gradePoint: 4.0),
            Grade(name: "AL5", minMark: 65, maxMark: 74, gradePoint: 5.0),
            Grade(name: "AL6", minMark: 45, maxMark: 64, gradePoint: 6.0),
            Grade(name: "AL7", minMark: 20, maxMark: 44, gradePoint: 7.0),
            Grade(name: "AL8", minMark: 0, maxMark: 19, gradePoint: 8.0),
        ]),// AL
        GradeSystem(name:"Overall Grade", grades: [
            Grade(name: "A1", minMark: 75, maxMark: 100, gradePoint: 1.0),
            Grade(name: "A2", minMark: 70, maxMark: 74, gradePoint: 1.0),
            Grade(name: "B3", minMark: 65, maxMark: 69, gradePoint: 2.0),
            Grade(name: "B4", minMark: 60, maxMark: 64, gradePoint: 2.0),
            Grade(name: "C5", minMark: 55, maxMark: 59, gradePoint: 3.0),
            Grade(name: "C6", minMark: 50, maxMark: 54, gradePoint: 3.0),
            Grade(name: "D7", minMark: 45, maxMark: 49, gradePoint: 4.0),
            Grade(name: "E8", minMark: 40, maxMark: 44, gradePoint: 5.0),
            Grade(name: "F9", minMark: 0, maxMark: 40, gradePoint: 5.0),
        ]),// Overall grade (1 is distinction, 2 is merit, 3 is credit, 4 is sub-pass and 5 is fail for grade points)
        GradeSystem(name: "N(A)", grades: [
            Grade(name: "1", minMark: 75, maxMark: 100, gradePoint: 1.0),
            Grade(name: "2", minMark: 70, maxMark: 74, gradePoint: 2.0),
            Grade(name: "3", minMark: 65, maxMark: 69, gradePoint: 3.0),
            Grade(name: "4", minMark: 60, maxMark: 64, gradePoint: 4.0),
            Grade(name: "5", minMark: 50, maxMark: 59, gradePoint: 5.0),
            Grade(name: "U", minMark: 0, maxMark: 49, gradePoint: 6.0),
        ]),//N(A) levels grades (no grade point)
        GradeSystem(name:"N(T)", grades: [
            Grade(name: "A", minMark: 70, maxMark: 100, gradePoint: 1.0),
            Grade(name: "B", minMark: 65, maxMark: 69, gradePoint: 2.0),
            Grade(name: "C", minMark: 60, maxMark: 64, gradePoint: 3.0),
            Grade(name: "D", minMark: 50, maxMark: 59, gradePoint: 4.0),
            Grade(name: "U", minMark: 0, maxMark: 49, gradePoint: 5.0),
            //            Grade(name: "N", minMark: 0, maxMark: 0, gradePoint: 6.0), //idk how to define N
        ]),// N(T) levels grades (no grade point)
        GradeSystem(name:"O Levels", grades: [
            Grade(name: "A1", minMark: 75, maxMark: 100, gradePoint: 1.0),
            Grade(name: "A2", minMark: 70, maxMark: 74, gradePoint: 2.0),
            Grade(name: "B3", minMark: 65, maxMark: 69, gradePoint: 3.0),
            Grade(name: "B4", minMark: 60, maxMark: 64, gradePoint: 4.0),
            Grade(name: "C5", minMark: 55, maxMark: 59, gradePoint: 5.0),
            Grade(name: "C6", minMark: 50, maxMark: 54, gradePoint: 6.0),
            Grade(name: "D7", minMark: 45, maxMark: 49, gradePoint: 7.0),
            Grade(name: "E8", minMark: 40, maxMark: 44, gradePoint: 8.0),
            Grade(name: "F9", minMark: 0, maxMark: 40, gradePoint: 9.0)
        ]),// O levels grades (no grade point)
        GradeSystem(name: "MAG", grades: [
            Grade(name: "A", minMark: 70, maxMark: 100, gradePoint: 1.0),
            Grade(name: "B", minMark: 60, maxMark: 69, gradePoint: 3.0),
            Grade(name: "C", minMark: 50, maxMark: 59, gradePoint: 5.0),
            Grade(name: "D", minMark: 45, maxMark: 49, gradePoint: 7.0),
            Grade(name: "E", minMark: 40, maxMark: 44, gradePoint: 8.0),
            Grade(name: "F", minMark: 0, maxMark: 39, gradePoint: 9.0),
        ]),// MAG
    ]
    {
        didSet {
            save()
        }
    }
    
    init() {
        load()
    }
    func gradeCalculate(mark:Double,formatt:String)->String{
        var resultGrade = ""
        if UserData().selection>0{
            let selectedSystem = systems[UserData().selection]
            for i in selectedSystem.grades{
                if mark >= i.minMark{
                    resultGrade = i.name
                    break
                }
            }
        }else{
            resultGrade = "\(String(format:formatt,mark))%"
        }
        return resultGrade
    }
    func getNames()->[String]{
        var nameArray:[String] = []
        for i in systems{
            nameArray.append(i.name)
        }
        return nameArray
    }
    func gradePointCalculate(mark:Double)->Double{
        var resultGradePoint:Double = 0
        if UserData().selection>0{
            let selectedSystem = systems[UserData().selection]
            for i in selectedSystem.grades{
                if mark >= i.minMark{
                    resultGradePoint = i.gradePoint
                    break
                }
            }
        }else{
            resultGradePoint = 0.0
        }
        return resultGradePoint
    }
    func MSGtoMAG(msg:Double)->String{
        var resultGrade = ""
        for i in systems[8].grades{
            if msg<=i.gradePoint{
                resultGrade = i.name
                break
            }
        }
        return resultGrade
    }
    func getArchiveURL() -> URL {
        let plistName = "systems.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedGradeSystems = try? propertyListEncoder.encode(systems)
        try? encodedGradeSystems?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        if let retrievedGradeSystemData = try? Data(contentsOf: archiveURL),
           let systemsDecoded = try? propertyListDecoder.decode([GradeSystem].self, from: retrievedGradeSystemData) {
            systems = systemsDecoded
        }
    }
}
