//
//  InitialViewController.swift
//  MadridActivities
//
//  Created by Carlos Ledesma on 3/11/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import UIKit
import CoreData

class InitialViewController: UIViewController {

    var context : NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let tabBar = segue.destination as! UITabBarController
        let navActivities = tabBar.viewControllers![0] as! UINavigationController
        let mapAndActivitiesVC = navActivities.topViewController as! MapAndActivitiesViewController
        let navShops = tabBar.viewControllers![1] as! UINavigationController
        let mapAndShopsVC = navShops.topViewController as! MapAndShopsViewController
        mapAndShopsVC.context = context
        mapAndActivitiesVC.context = context
        
    }
}
