//
//  CoreDataModel.swift
//  Math-AI
//
//  Created by Fatih on 17.06.2024.
//

import Foundation
import UIKit
import CoreData

class CoreDataModel {
    static let shared = CoreDataModel()
    
    func saveTopics(topicType: SubjectItemType) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let saveData = NSEntityDescription.insertNewObject(forEntityName: "SubjectTopics", into: context)
        saveData.setValue(topicType.rawValue, forKey: "title")
        
        do {
            try context.save()
            print("KAYDETME İŞLEMİ BAŞARILI" )
            
        } catch {
            print("KAYDETME İŞLEMİ BAŞARISIZ")
        }
    }
    
    func deleteTopics(withTitle topicType: SubjectItemType) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SubjectTopics")
        fetchRequest.predicate = NSPredicate(format: "title == %@", topicType.rawValue as CVarArg)
        
        do {
            if let result = try  context.fetch(fetchRequest).first as? NSManagedObject {
                context.delete(result)
                try context.save()
            }
        } catch {
            print("Error deleting item: \(error.localizedDescription)")

        }
    }
    
    func fetchGetCoreData() -> [SubjectItemType] {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SubjectTopics")
        fetchRequest.returnsObjectsAsFaults = false
        var typeArray: [SubjectItemType] = []
        
        do {
           let results = try context.fetch(fetchRequest)
            for result in results as! [NSManagedObject] {
                if let title = result.value(forKey: "title") as? String {
                    typeArray.append(SubjectItemType(rawValue: title) ?? .ask)
                }
                
            }
            
            return typeArray
        } catch {
            return typeArray
        }
    }
}
