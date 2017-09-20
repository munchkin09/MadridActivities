//
//  MapShops.swift
//  MadridShop
//
//  Created by Carlos Ledesma on 18/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import CoreData


func mapShopIntoShopCD(context: NSManagedObjectContext, shop: Shop) -> ShopCD {
    
    let shopCD = ShopCD(context: context)
    
    shopCD.name = shop.name
    shopCD.address = shop.address
    shopCD.image = shop.image
    shopCD.logo = shop.logo
    
    shopCD.latitude = shop.latitude ?? 0.0
    shopCD.longitude = shop.longitude ?? 0.0
    shopCD.desc_en = shop.description
    shopCD.openingHours = shop.openingHours
    
    return shopCD
}


func mapShopCDIntoShop(shopCD: ShopCD) -> Shop {
    
    let shop = Shop(name: shopCD.name!)

    shop.address = shopCD.address ?? ""
    shop.image = shopCD.image ?? ""
    shop.logo = shopCD.logo ?? ""
    shop.description = shopCD.desc_en ?? ""
    shop.latitude = shopCD.latitude
    shop.longitude = shopCD.longitude
    
    shop.openingHours = shopCD.openingHours ?? ""
    
    return shop

}


