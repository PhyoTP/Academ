import SwiftUI

struct NoteEdit: View {
    
    @Binding var Noted: Note
    
    var body: some View {
        Form {
            Section {
                TextField("Note title", text: $Noted.title)
                DatePicker("Select due date", selection:  $Noted.date, displayedComponents: .date)
                //DatePicker("Select due date", selection: $NoteDate, displayedComponents: .date)
                TextField("Emoji (Optional)", text: $Noted.emoji)
            }
            Section{
                TextField("Notes here", text: $Noted.content, axis: .vertical)
                    
                
            }
                    }
        .navigationTitle("Details")

    }
}

struct TodoDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationStack {
            NoteEdit(Noted: .constant(Note(title: "Fake Todo", date: Date(), content: "", emoji: "")))
        }
    }
}
