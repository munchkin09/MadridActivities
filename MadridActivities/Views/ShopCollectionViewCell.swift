//
//  ShopCollectionViewCell.swift
//  MadridActivities
//
//  Created by Carlos Ledesma on 20/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import UIKit
import SDWebImage

class ShopCollectionViewCell: UICollectionViewCell {
    
    var shop : Shop?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var opHoursLabel: UILabel!
    
    @IBOutlet weak var logoImage: UIImageView!
    
    
    func refresh(shop: Shop) {
        self.shop = shop
         
         //
         self.titleLabel.text = shop.name
         self.opHoursLabel.text = shop.openingHours
         //TODO: image view
        self.logoImage.sd_setImage(with: URL(string: (self.shop?.logo)!), completed: nil)
         //self.shop?.logo.loadImage(into: self.logoImage)
    }
}
