//
//  MapAndActivitiesViewController+CollectionViewController.swift
//  MadridActivities
//
//  Created by Carlos Ledesma on 21/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import UIKit

extension MapAndActivitiesViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : ActivityCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActivityCell", for: indexPath) as! ActivityCollectionViewCell
        
        //cell.refresh(activity: <#T##Activity#>)
        return cell
    }
        
}
