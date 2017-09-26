//
//  Note.swift
//  MadridActivities
//
//  Created by Carlos Ledesma on 26/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

class Note: NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}
