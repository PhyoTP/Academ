import SwiftUI

struct NewNoteView: View {
    
    @State private var NoteTitle = ""
    @State private var NoteDate = Date()
    @State var notes_taken = ""
    @State var NoteEmoji = ""
    @Binding var sourceArray: [Note]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section("Details") {
                TextField("Title", text: $NoteTitle)
              //  TextField("Date", text: $NoteDate)
                DatePicker("Select due date", selection:  $NoteDate, displayedComponents: .date)
                TextField("Emoji (Optional)", text: $NoteEmoji)
            }
            Section("Note") {
                TextField("Notes", text: $notes_taken, axis: .vertical)
            }
                Section("Actions") {
                    Button("Save") {
                        let note = Note(title: NoteTitle, date: NoteDate, content: notes_taken, emoji: NoteEmoji)
                        sourceArray.append(note)
                        dismiss()
                    }
                    Button("Cancel", role: .destructive) {
                        dismiss()
                    }
                }
            }
            
            
        }
    }



struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        NewNoteView(sourceArray: .constant([]))
    }
}
