//
//  ShopCollectionViewCell.swift
//  MadridActivities
//
//  Created by Carlos Ledesma on 20/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import UIKit

class ShopCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var opHoursLabel: UILabel!
    
    @IBOutlet weak var logoImage: UIImageView!
    
    func refresh(activity: Activity) {
        /*self.shop = shop
         
         //
         self.nameLabel.text = shop.name
         //TODO: image view
         self.shop?.logo.loadImage(into: self.shopImage)*/
    }
}
