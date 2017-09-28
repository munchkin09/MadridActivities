//
//  Activities.swift
//  MadridActivities
//
//  Created by Carlos Ledesma on 20/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import Foundation

protocol ActivitiesProtocol {
    func count() -> Int
    func add(activity: Activity)
    func get(atIndex: Int) -> Activity
}

public class Activities : ActivitiesProtocol {
    
    private var activitiesList : [Activity]?
    
    public init() {
        self.activitiesList = []
    }
    
    func count() -> Int {
        return activitiesList?.count ?? 0
    }

    func add(activity: Activity) {
        self.activitiesList?.append(activity)
    }

    func get(atIndex: Int) -> Activity {
        return (activitiesList?[atIndex])!
    }

    
}
