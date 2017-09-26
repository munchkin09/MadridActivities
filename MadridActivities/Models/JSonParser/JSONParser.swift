//
//  JSONParser.swift
//  MadridShop
//
//  Created by Carlos Ledesma on 12/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import Foundation

func parseShops(data: Data) -> Shops {
    let shops = Shops()
    
    do {
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Dictionary<String, Any>
        let result = jsonObject["result"] as! [Dictionary<String,Any>]
        
        for shopJson in result {
            let shop = Shop(name: shopJson["name"]! as! String)
            shop.address = shopJson["address"]! as! String
            shop.description = shopJson["description_en"]! as! String
            shop.logo = shopJson["logo_img"] as! String
            shop.image = shopJson["img"] as! String
            shop.openingHours = shopJson["opening_hours_en"] as! String
            shop.latitude = (shopJson["gps_lat"] as! String).trimAndConvertToFloat()
            shop.longitude = (shopJson["gps_lon"] as! String).trimAndConvertToFloat()
            shops.add(shop: shop)
        }
        
    } catch {
        
    }
    return shops
}

func parseActivities(data: Data) -> Activities {
    let activities = Activities()
    do {
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Dictionary<String, Any>
        let result = jsonObject["result"] as! [Dictionary<String,Any>]
        
        for activityJson in result {
            /*let shop = Shop(name: shopJson["name"]! as! String)
            shop.address = shopJson["address"]! as! String
            shop.description = shopJson["description_en"]! as! String
            shop.logo = shopJson["logo_img"] as! String
            shop.image = shopJson["img"] as! String
            shops.add(shop: shop)*/
        }
    } catch {
        
    }
    return activities
}
