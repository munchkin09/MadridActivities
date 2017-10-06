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
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if let noteShop = view.annotation as? NoteShop {
            let shopCD = noteShop.shopCD
            self.performSegue(withIdentifier: "ShowShopDetailSegue", sender: shopCD )
        }
    }
    
    func drawPinsInMap() {
        if let arrShopsCD = fetchedResultsController.fetchedObjects {
            for shopCD in arrShopsCD {
                let shopLocation = CLLocation(latitude: CLLocationDegrees(shopCD.latitude), longitude: CLLocationDegrees(shopCD.longitude))
                let note = NoteShop(coordinate: shopLocation.coordinate, title: shopCD.name!, subtitle: shopCD.address ?? "", shopCD: shopCD)
                self.mapShops.addAnnotation(note)
            }
        }
    }
}
