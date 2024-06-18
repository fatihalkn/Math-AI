//
//  SubjectTopics+CoreDataProperties.swift
//  Math-AI
//
//  Created by Fatih on 17.06.2024.
//
//

import Foundation
import CoreData


extension SubjectTopics {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SubjectTopics> {
        return NSFetchRequest<SubjectTopics>(entityName: "SubjectTopics")
    }

    @NSManaged public var title: String?
    

}

extension SubjectTopics : Identifiable {

}
