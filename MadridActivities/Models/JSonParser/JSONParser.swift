//
//  JSONParser.swift
//  MadridShop
//
//  Created by Carlos Ledesma on 12/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//  ¯\_(ツ)_/¯

import Foundation

func parseShops(data: Data) -> Shops {
    let preferredLang = NSLocale.preferredLanguages[0]
    let shops = Shops()
    
    do {
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Dictionary<String, Any>
        let result = jsonObject["result"] as! [Dictionary<String,Any>]
        
        for shopJson in result {
            let shop = Shop(name: shopJson["name"]! as! String)
            shop.address = shopJson["address"]! as! String
            if preferredLang == "es-ES" {
                shop.description = shopJson["description_es"]! as! String
                shop.openingHours = shopJson["opening_hours_es"] as! String
            } else {
                shop.description = shopJson["description_en"]! as! String
                shop.openingHours = shopJson["opening_hours_en"] as! String
            }
            shop.logo = shopJson["logo_img"] as! String
            shop.image = shopJson["img"] as! String
            
            shop.latitude = (shopJson["gps_lat"] as! String).trimAndConvertToFloat()
            shop.longitude = (shopJson["gps_lon"] as! String).trimAndConvertToFloat()
            shops.add(shop: shop)
        }
        
    } catch {
        
    }
    return shops
}

func parseActivities(data: Data) -> Activities {
    let preferredLang = NSLocale.preferredLanguages[0]
    let activities = Activities()
    do {
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Dictionary<String, Any>
        let result = jsonObject["result"] as! [Dictionary<String,Any>]
        
        for activityJson in result {
            let activity = Activity(name: activityJson["name"] as! String)
            activity.address = activityJson["address"] as! String 
            if preferredLang == "es-ES" {
                activity.description = activityJson["description_es"] as! String
                activity.openingHours = activityJson["opening_hours_es"] as! String
            } else {
                activity.description = activityJson["description_en"] as! String
                activity.openingHours = activityJson["opening_hours_en"] as! String
            }
            activity.logo = activityJson["logo_img"] as! String
            activity.image = activityJson["img"] as! String
            activity.latitude = (activityJson["gps_lat"] as! String).trimAndConvertToFloat()
            activity.longitude = (activityJson["gps_lon"] as! String).trimAndConvertToFloat()
            activities.add(activity: activity)
        }
    } catch {
        
    }
    return activities
}
