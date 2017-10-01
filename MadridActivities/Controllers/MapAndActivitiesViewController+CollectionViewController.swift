//
//  MapAndActivitiesViewController+CollectionViewController.swift
//  MadridActivities
//
//  Created by Carlos Ledesma on 21/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import UIKit
import CoreLocation

extension MapAndActivitiesViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionInfo = fetchedResultsController.sections![section]
        return sectionInfo.numberOfObjects
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : ActivityCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActivityCell", for: indexPath) as! ActivityCollectionViewCell
        let activityCD : ActivityCD = fetchedResultsController.object(at: indexPath)
        
        cell.refresh(activity: mapActivityCDIntoActivity(activityCD: activityCD))
        return cell
    }
        
}
