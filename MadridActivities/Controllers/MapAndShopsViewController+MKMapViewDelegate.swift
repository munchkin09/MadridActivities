//
//  MapAndShopsViewController+MKMapViewDelegate.swift
//  MadridActivities
//
//  Created by Carlos Ledesma on 6/10/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import Foundation
import MapKit
import SDWebImage

extension MapAndShopsViewController : MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            return nil
        }
        
        
        var noteView = mapView.dequeueReusableAnnotationView(withIdentifier: "noteShop")
        
        if noteView == nil {
            noteView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "noteShop")
            
            noteView?.canShowCallout = true
            
            let shop = (annotation as! NoteShop).shopCD
            let imageView : UIImageView = UIImageView()
            imageView.frame.size.height = 40.0
            imageView.frame.size.width = 40.0
            if let logoStr = shop.logo {
                imageView.sd_setImage(with: URL(string: logoStr), completed: nil)
            } else {
                imageView.image = #imageLiteral(resourceName: "images.png")
            }
            
            noteView?.leftCalloutAccessoryView = imageView
            noteView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        
        return noteView
    }
}
