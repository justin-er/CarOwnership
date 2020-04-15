//
//  DBManager.swift
//  AEFetchedResultsControllerApp
//
//  Created by Amirreza Eghtedari on 14.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import CoreData

class DBManager {
    
    static var shared: DBManager = DBManager()
    var persistentContainer: NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "AEFetchedResultsControllerApp")
        persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
    }
    
    var context: NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

