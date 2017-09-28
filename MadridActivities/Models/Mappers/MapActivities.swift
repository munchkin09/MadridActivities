//
//  MapActivities.swift
//  MadridActivities
//
//  Created by Carlos Ledesma on 28/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import CoreData


func mapActivityIntoActivityCD(context: NSManagedObjectContext, activity: Activity) -> ActivityCD {
    
    let activityCD = ActivityCD(context: context)
    
    
    activityCD.name = activity.name
    activityCD.address = activity.address
    activityCD.image = activity.image
    activityCD.logoImage = activity.logo
    
    activityCD.latitude = activity.latitude ?? 0.0
    activityCD.longitude = activity.longitude ?? 0.0
    activityCD.desc_en = activity.description
    activityCD.opening_hours = activity.openingHours
    
    return activityCD
}


func mapActivityCDIntoActivity(activityCD: ActivityCD) -> Activity {
    
    let activity = Activity(name: activityCD.name!)
    
    activity.address = activityCD.address ?? ""
    activity.image = activityCD.image ?? ""
    activity.logo = activityCD.logoImage ?? ""
    activity.description = activityCD.desc_en ?? ""
    activity.latitude = activityCD.latitude
    activity.longitude = activityCD.longitude
    activity.openingHours = activityCD.opening_hours ?? ""
    
    return activity
    
}
