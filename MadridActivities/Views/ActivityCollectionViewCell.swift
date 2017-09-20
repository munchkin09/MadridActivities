//
//  ActivityCollectionViewCell.swift
//  MadridActivities
//
//  Created by Carlos Ledesma on 20/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import UIKit

class ActivityCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var activityImage: UIImageView!
  
    @IBOutlet weak var activityNameLabel: UILabel!
    
    @IBOutlet weak var activityOpeningLabel: UILabel!
    
    func refresh(activity: Activity) {
        /*self.shop = shop
        
        //
        self.nameLabel.text = shop.name
        //TODO: image view
        self.shop?.logo.loadImage(into: self.shopImage)*/
    }
}
