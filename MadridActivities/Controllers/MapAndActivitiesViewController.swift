//
//  MapAndActivitiesViewController.swift
//  MadridActivities
//
//  Created by Carlos Ledesma on 19/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class MapAndActivitiesViewController: UIViewController {

    @IBOutlet weak var collectionActivities: UICollectionView!
    
    @IBOutlet weak var mapActivities: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.collectionViewActivities.dataSource = self
        //self.collectionViewActivities.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

