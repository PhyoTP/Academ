//
//  SubjectManager.swift
//  Academ
//
//  Created by T Krobot on 18/11/23.
//

import Foundation
import SwiftUI

class SubjectManager: ObservableObject {
    @Published var subjects: [Subject] = [] {
        didSet {
            save()
        }
    }
    
    init() {
        load()
    }
    
    func compute(isTarget:Bool,userData:UserData)->Double{
        var creditArray:[Int] = []
        var gradePointArray:[Double] = []
        var gradeCumulativePointArray:[Double] = []
        var gradeCumulativePoint:Double = 0
        var credit:Int = 0
        var resultComputation = 0.0
        if userData.selection>0{
            for i in subjects{
                if isTarget{
                    gradePointArray.append(SystemManager().gradePointCalculate(mark: i.targetMark))
                }else{
                    gradePointArray.append(SystemManager().gradePointCalculate(mark: i.currentOverall()))
                }
                if userData.haveCredits{
                    creditArray.append(i.credits)
                }
            }
            
            if userData.selection==1&&userData.haveCredits{
                
                for i in gradePointArray.indices{
                    gradeCumulativePointArray.append(Double(creditArray[i])*gradePointArray[i])
                }
                for i in gradeCumulativePointArray{
                    gradeCumulativePoint+=i
                }
                for i in creditArray{
                    credit+=i
                }
                resultComputation = gradeCumulativePoint/Double(credit)
                
            }else if userData.selection==2{
                for i in gradePointArray{
                    gradeCumulativePoint+=i
                }
                resultComputation = gradeCumulativePoint/Double(gradePointArray.count)
            }else if userData.selection==3{
                for i in gradePointArray{
                    gradeCumulativePoint+=i
                }
                resultComputation = gradeCumulativePoint
            }else if userData.selection==8{
                for i in gradePointArray{
                    gradeCumulativePoint+=i
                }
                resultComputation = gradeCumulativePoint/Double(gradePointArray.count)
            }else{
                resultComputation = 0.0
            }
        }else{
            resultComputation = 0.0
        }
        return resultComputation
    }
    func getArchiveURL() -> URL {
        let plistName = "subjects.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedSubjects = try? propertyListEncoder.encode(subjects)
        try? encodedSubjects?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        if let retrievedSubjectData = try? Data(contentsOf: archiveURL),
           let subjectsDecoded = try? propertyListDecoder.decode([Subject].self, from: retrievedSubjectData) {
            subjects = subjectsDecoded
        }
    }
}


