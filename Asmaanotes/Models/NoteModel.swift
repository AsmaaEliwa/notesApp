//
//  NoteModel.swift
//  Asmaanotes
//
//  Created by asmaa gamal  on 01/11/2023.
//

import Foundation
import Foundation
class NoteModel: ObservableObject{
    @Published var notes = DataManger.shared.fetchNotes()
    func addNote(name:String , details:String , subject:Subject){
        DataManger.shared.addNote(name: name, details: details, subject: subject)
        notes = DataManger.shared.fetchNotes()
    }
    
}
