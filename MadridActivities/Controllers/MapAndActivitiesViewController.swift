//
//  MapAndActivitiesViewController.swift
//  MadridActivities
//
//  Created by Carlos Ledesma on 19/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import UIKit
import MapKit


class MapAndActivitiesViewController: UIViewController {

    @IBOutlet weak var mapActivities: MKMapView!
    
    @IBOutlet weak var collectionViewActivities: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

