//
//  MapAndShopsViewController+CollectionViewController.swift
//  MadridActivities
//
//  Created by Carlos Ledesma on 26/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import UIKit
import MapKit


extension MapAndShopsViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionInfo = fetchedResultsController.sections![section]
        return sectionInfo.numberOfObjects
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : ShopCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopCell", for: indexPath) as! ShopCollectionViewCell
        
        let shopCD : ShopCD = fetchedResultsController.object(at: indexPath)
        
        let shopLocation = CLLocation(latitude: CLLocationDegrees(shopCD.latitude), longitude: CLLocationDegrees(shopCD.longitude))
        
        
        let note = Note(coordinate: shopLocation.coordinate, title: shopCD.name!, subtitle: "")
        self.mapShops.addAnnotation(note)
        cell.refresh(shop: mapShopCDIntoShop(shopCD: shopCD))
        return cell
    }
    
    
}
