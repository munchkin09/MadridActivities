//
//  CoreDataStack.swift
//  MadridActivities
//
//  Created by Carlos Ledesma on 20/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import CoreData

// MARK: - Core Data stack
public class CoreDataStack {
    
    //Aquí creamos(o nos devuelve) una db con un nombre dado
    public func createContainter(dbName: String) -> NSPersistentContainer {
        
        let container = NSPersistentContainer(name: dbName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            print(" \(storeDescription.description)")
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }
    
    // MARK: - Core Data Saving support
    
    public func saveContext (context: NSManagedObjectContext) {
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

