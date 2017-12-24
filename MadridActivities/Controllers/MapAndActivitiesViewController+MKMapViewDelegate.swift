//
//  MapAndActivitiesViewController+MKAnnotationView.swift
//  MadridActivities
//
//  Created by Carlos Ledesma on 6/10/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import Foundation
import MapKit

extension MapAndActivitiesViewController : MKMapViewDelegate {
   func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    
        let noteActivity = annotation as! NoteActivity    
        return nil
    
    }
    
    func drawPinsInMap() {
        if let arrActivitiesCD = fetchedResultsController.fetchedObjects {
            for activityCD in arrActivitiesCD {
                let activityLocation = CLLocation(latitude: CLLocationDegrees(activityCD.latitude), longitude: CLLocationDegrees(activityCD.longitude))
                let note = NoteActivity(coordinate: activityLocation.coordinate, title: activityCD.name!, subtitle: "", activityCD: activityCD)
                self.mapActivities.addAnnotation(note)
            }
        }
    }
}
