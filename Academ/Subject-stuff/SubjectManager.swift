//
//  SubjectManager.swift
//  Academ
//
//  Created by T Krobot on 18/11/23.
//

import Foundation
import SwiftUI

class SubjectManager: ObservableObject {
    @Published var subjects: [Subject] = [Subject(name: "Mathematics", assessments: [Assessment(name: "WA1", percentageValue: 10, totalMarks: 20, examDone: true, markAttained: 12, examDate: Date(), targetMarks: 0, haveReminder: false, reminder: Date())])] {
        didSet {
            save()
        }
    }
        
    init() {
        load()
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
