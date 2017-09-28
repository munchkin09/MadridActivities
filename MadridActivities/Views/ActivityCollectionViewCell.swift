//
//  ActivityCollectionViewCell.swift
//  MadridActivities
//
//  Created by Carlos Ledesma on 20/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import UIKit

class ActivityCollectionViewCell: UICollectionViewCell {
    
    var activity : Activity?
    @IBOutlet weak var activityImage: UIImageView!
  
    @IBOutlet weak var activityNameLabel: UILabel!
    
    @IBOutlet weak var activityOpeningLabel: UILabel!
    
    func refresh(activity: Activity) {
        self.activity = activity
 
 
        self.activityNameLabel.text = self.activity?.name
        self.activityOpeningLabel.text = self.activity?.openingHours
        //TODO: image view
        self.activity?.logo.loadImage(into: self.activityImage)
    }
}
