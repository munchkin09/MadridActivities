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
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        <#code#>
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let viewAnnotation : MKAnnotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "prueba")
        
    }
}
