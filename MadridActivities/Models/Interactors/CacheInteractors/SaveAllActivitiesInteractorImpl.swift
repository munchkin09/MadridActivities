//
//  SaveAllActivitiesInteractorImpl.swift
//  MadridActivities
//
//  Created by Carlos Ledesma on 28/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//
import CoreData

class SaveAllActivitiesInteractorImpl : SaveAllActivitiesInteractor {
    func execute(activities: Activities, context: NSManagedObjectContext, onSuccess: @escaping (Activities) -> Void) {
        execute(activities: activities, context: context, onSuccess: onSuccess, onError: nil)
    }
    
    func execute(activities: Activities, context: NSManagedObjectContext, onSuccess: @escaping (Activities) -> Void, onError: errorClosure) {
        for i in 0 ..< activities.count() {
            let activity = activities.get(atIndex: i)
            let _ : ActivityCD = mapActivityIntoActivityCD(context: context, activity: activity)
        }
        
        do {
            try context.save()
            onSuccess(activities)
        } catch {
            
        }
    }
}

