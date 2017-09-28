//
//  AppDelegate.swift
//  MadridActivities
//
//  Created by Carlos Ledesma on 19/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var cds = CoreDataStack()
    var context : NSManagedObjectContext?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.context = cds.createContainter(dbName: "MadridShopsActivities").viewContext
        let tabBar = self.window?.rootViewController as! UITabBarController
        let navActivities = tabBar.viewControllers![0] as! UINavigationController
        let mapAndActivitiesVC = navActivities.topViewController as! MapAndActivitiesViewController
        let navShops = tabBar.viewControllers![1] as! UINavigationController
        let mapAndShopsVC = navShops.topViewController as! MapAndShopsViewController
        mapAndShopsVC.context = context
        mapAndActivitiesVC.context = context
        
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        guard let context = self.context else { return }
        self.cds.saveContext(context: context)
    }


}

