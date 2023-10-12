import Foundation

struct Note: Identifiable {
    
    let id = UUID()
    var title: String
    var date: Date
    var content: String
    var emoji: String
    
    
}
