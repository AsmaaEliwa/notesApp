//
//  NoteDetailsView.swift
//  Asmaanotes
//
//  Created by asmaa gamal  on 01/11/2023.
//

import SwiftUI

struct NoteDetailsView: View {
    @State var newTitle = ""
    @State var newDetails = ""
    @State var showUpdateNote = false
    var note: Note
    @ObservedObject var tagModel = TagModel()
    @State var tagName = ""
//    @Environment(\.) var p
    var body: some View {
        VStack(spacing:30){
            Text("Note Info")
            Divider()
            Text(note.title ?? "" )
            Text(note.details ?? "" )
            HStack(spacing:50){
                Button{
                    showUpdateNote = true
                }label: {
                    Label("Update",systemImage: "pen")
                }
                
                Button{
                    DataManger.shared.deleteNote(note: note)
                    
                   
                }label: {
                    Label("Delete",systemImage: "pen").foregroundColor(.red)
                }
                
                
                
            }
            Text("Add Tag to this Note")
            input(text: $tagName, label: "Tag", placeholder: "Enter Tag")
            Button{
                tagModel.addTag(tag: tagName , note: note)
            }label: {
                Label("Add Tag",systemImage: "plus")            }
            Text("Note Tags")
            Divider()
            List{
                ForEach(Array(note.tags as? Set<Tag> ?? []), id:\.self){tag in
                    
            
                    Text(tag.tag ?? "").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    
                   
                    
                    
                }
            }
            
            .sheet(isPresented: $showUpdateNote , content: {
                VStack(spacing:30){
                    input(text: $newTitle, label: "New Title", placeholder: "Enter the new Title")
                    input(text: $newDetails, label: "New Details", placeholder: "Enter the new Details")
                    Button{
                        DataManger.shared.updateNote(note: note, title: newTitle, details: newDetails)
                        showUpdateNote = false
                    }label: {
                        Label("Update", systemImage: "pin")
                    }
                    
                    
                    
                }.padding()
            })

            
        }
       
    }
}

//#Preview {
//    NoteDetailsView(note: Note())
//}
