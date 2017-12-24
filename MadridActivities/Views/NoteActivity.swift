//
//  NoteActivity.swift
//  MadridActivities
//
//  Created by Carlos Ledesma on 6/10/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

class NoteActivity: NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    let activityCD : ActivityCD
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String, activityCD: ActivityCD) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.activityCD = activityCD
        
    }
}
