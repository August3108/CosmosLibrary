//
//  Sample.swift
//  Cosmos Library
//
//  Created by Rahul jha on 03/12/24.
//

import Foundation
// Core Data

// Persistent controller (named:filename)  
// then we write init to load into memory
//
//
//Then we push the persistent controller class in environment object


import CoreData
import SwiftUI

class PersistenceController {
    static let shared = PersistenceController()

    // The container that holds the managed object model and context
    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Model")  // "Model" is the name of the .xcdatamodeld file

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }

    // A context for performing operations on Core Data
    var context: NSManagedObjectContext {
        return container.viewContext
    }
}

//FetchRequest is used to access the values

@objc(Item)
public class Item: NSManagedObject {
    @NSManaged public var timestamp: Date?
}

extension Item {
    static func create(context: NSManagedObjectContext) -> Item {
        let newItem = Item(context: context)
        newItem.timestamp = Date() // You can leave it nil if it's optional
        return newItem
    }
}
