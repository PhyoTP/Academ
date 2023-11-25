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
        ])] {
            didSet {
                save()
            }
        }
    
    init() {
        load()
    }
    func gradeCalculate(mark:Float,formatt:String)->String{
        var resultGrade = ""
        if UserData().selection>0{
            let selectedSystem = systems[UserData().selection-1]
            for i in selectedSystem.grades{
                if mark > i.minMark{
                    resultGrade = i.name
                    break
                }
            }
        }else{
            resultGrade = "\(String(format:formatt,mark))%"
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
