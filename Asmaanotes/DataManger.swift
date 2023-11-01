//
//  DataManger.swift
//  Asmaanotes
//
//  Created by asmaa gamal  on 01/11/2023.
//

import Foundation
import CoreData
class DataManger{
    static   var shared = DataManger()
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Asmaanotes")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }else{
                print("loaded")
            }
        }
        return container
    }()

    func addSubject(name:String){
        if let entity = NSEntityDescription.entity(forEntityName: "Subject", in:persistentContainer.viewContext ){
            let subject = NSManagedObject(entity: entity, insertInto: persistentContainer.viewContext)
            
            subject.setValue(name, forKey: "name")
            
            do{
                try persistentContainer.viewContext.save()
                print("Saved")
            }catch{
                print(error)
            }
            
        }
    }
    
    
    func fetchSubjects()->[Subject]{
        let request : NSFetchRequest<Subject>  = Subject.fetchRequest()
        
        do{
            let subjects = try persistentContainer.viewContext.fetch(request)
            return subjects
        }catch{
            print(error)
            return []
        }
        
    }
    
    
    
    func addNote(name:String , details:String , subject:Subject){
        if let entity = NSEntityDescription.entity(forEntityName: "Note", in:persistentContainer.viewContext ){
            let note = NSManagedObject(entity: entity, insertInto: persistentContainer.viewContext)
            
            note.setValue(name, forKey: "title")
            note.setValue(details, forKey: "details")
            subject.addToNotes(note as! Note)
            do{
                try persistentContainer.viewContext.save()
                print("Saved")
            }catch{
                print(error)
            }
            
        }
    }
    
    
    func fetchNotes()->[Note]{
        let request : NSFetchRequest<Note>  = Note.fetchRequest()
        
        do{
            let notes = try persistentContainer.viewContext.fetch(request)
            return notes
        }catch{
            print(error)
            return []
        }
        
    }
    
    
    func addTag(tag:String  , note:Note){
        if let entity = NSEntityDescription.entity(forEntityName: "Tag", in:persistentContainer.viewContext ){
            let mytag = NSManagedObject(entity: entity, insertInto: persistentContainer.viewContext)
            
            mytag.setValue(tag, forKey: "tag")
            note.addToTags(mytag as! Tag)
            
            do{
                try persistentContainer.viewContext.save()
                print("Saved")
            }catch{
                print(error)
            }
            
        }
    }
    
    
    func updateNote(note: Note , title: String? , details: String?){
        
        if let newtitle = title {
            note.title = newtitle
        }
        if let newDetails  = details {
            note.details = newDetails
        }
        
        do{
            try persistentContainer.viewContext.save()
            print("Saved")
        }catch{
            print(error)
        }
        
        
        
      
    }
    
    
    
    func deleteNote(note:Note){
        persistentContainer.viewContext.delete(note)

        do{
            try persistentContainer.viewContext.save()

            print("Deleted")
        }catch{
            print(error)
        }
        
    }
    
    
    func deletSubject(subject:Subject){
        persistentContainer.viewContext.delete(subject)

        do{
            try persistentContainer.viewContext.save()

            print("Deleted")
        }catch{
            print(error)
        }
        
    }
    
    func fetchNotesByTag(tag:String ) -> [Note]{
        let request: NSFetchRequest<Note> = Note.fetchRequest()
        request.predicate = NSPredicate(format: "tag == %@" , tag )
        do{
            let result = try persistentContainer.viewContext.fetch(request)
            print("fetched")
            return result
            
        }catch{
            print(error)
            return  []
        }
        
    }
    
    
    
    
}
