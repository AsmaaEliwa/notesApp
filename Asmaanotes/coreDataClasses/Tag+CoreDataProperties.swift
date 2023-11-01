//
//  Tag+CoreDataProperties.swift
//  Asmaanotes
//
//  Created by asmaa gamal  on 01/11/2023.
//
//

import Foundation
import CoreData


extension Tag {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tag> {
        return NSFetchRequest<Tag>(entityName: "Tag")
    }

    @NSManaged public var tag: String?
    @NSManaged public var notes: NSSet?

}

// MARK: Generated accessors for notes
extension Tag {

    @objc(addNotesObject:)
    @NSManaged public func addToNotes(_ value: Note)

    @objc(removeNotesObject:)
    @NSManaged public func removeFromNotes(_ value: Note)

    @objc(addNotes:)
    @NSManaged public func addToNotes(_ values: NSSet)

    @objc(removeNotes:)
    @NSManaged public func removeFromNotes(_ values: NSSet)

}

extension Tag : Identifiable {

}
