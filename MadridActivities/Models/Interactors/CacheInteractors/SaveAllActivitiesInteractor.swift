//
//  SaveAllActivitiesInteractor.swift
//  MadridActivities
//
//  Created by Carlos Ledesma on 28/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import Foundation
import CoreData

protocol SaveAllActivitiesInteractor {
    // execute: save all shops. Return on the main thread
    func execute(activities: Activities, context: NSManagedObjectContext ,onSuccess: @escaping (Activities) -> Void, onError: errorClosure )
    func execute(activities: Activities, context: NSManagedObjectContext ,onSuccess: @escaping (Activities) -> Void)
}
