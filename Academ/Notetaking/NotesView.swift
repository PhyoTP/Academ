import SwiftUI

struct NotesView: View {
    @State private var notes = [Note(title: "Math topic 1A", date: Date(), content: "", emoji: "🧑‍🎓"),
                                Note(title: "Physics", date: createDate(day: 21, month: 8, year: 2023), content: "", emoji: "🙀"),
                                
                                Note(title: "English Essays", date: Date(), content: "", emoji: "👩‍💻"),
                                Note(title: "Death of me from overstudying",  date: Date(), content: "", emoji: "💀")]
    var body: some View {
        
        NavigationStack {
            VStack{
                List($notes, editActions:[.all]) { $note in
                    NavigationLink (destination: NoteEdit(Noted: $note)) {
                        
                        HStack {
                            VStack(alignment: .leading){
                                Text(note.title)
                                    .bold()
                                Text(formatDate(date: note.date))
                                    .foregroundColor(.gray)
                                
                            }
                            Text(note.emoji)
                        }
                        
                    }
                }
                .navigationTitle("Notes")
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    NavigationLink(destination: NewNoteView( sourceArray: $notes)) {
                        Image(systemName:("plus"))
                    }
                }
            }
        }
    }
}

func formatDate(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM dd, yyyy hh:mm a" // Customize the date format as needed
    return dateFormatter.string(from: date)
}

// Function to create a Date with a specific day, month, and year
func createDate(day: Int, month: Int, year: Int) -> Date {
    var dateComponents = DateComponents()
    dateComponents.year = year
    dateComponents.month = month
    dateComponents.day = day
    let calendar = Calendar.current
    return calendar.date(from: dateComponents) ?? Date()
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}
