//
//  SubjectDetailsView.swift
//  Asmaanotes
//
//  Created by asmaa gamal  on 01/11/2023.
//

import SwiftUI

struct SubjectDetailsView: View {
    @State var noteTitle = ""
    @State var noteDetails = ""
    @ObservedObject var noteModel = NoteModel()
    @ObservedObject var subjectModel = SubjectModel()
    func reset(){
        noteTitle = ""
        noteDetails = ""
    }
    var subject: Subject
    var body: some View {
        VStack(spacing:30){
            Text(subject.name ?? "")
            Button{
                subjectModel.deleteSubject(subject: subject)
                
            }label: {
                Label("Delete Subject", systemImage: "bin").foregroundColor(.red)
            }
            Divider()
            Text( "Add Note")
            input(text: $noteTitle, label: "Title", placeholder: "Enter Note Title")
            input(text: $noteDetails, label: "Details", placeholder: "Enter Note Details")
            Button{
                noteModel.addNote(name: noteTitle, details: noteDetails, subject: subject)
                reset()
                
            }label: {
                Label("Add Note", systemImage: "plus")
            }
            
        }
        List{
            ForEach( Array(subject.notes as? Set<Note> ?? []), id:\.self){note in
                
                NavigationLink(destination:NoteDetailsView( note:note)){
                    Text(note.title ?? "")
                }
               
                
                
            }
        }
        
        NavigationLink(destination:SeachForNoteView()){
          Label("search", systemImage: "search")
        }
        
    }
}

//#Preview {
//    SubjectDetailsView(subject: Subject())
//}
