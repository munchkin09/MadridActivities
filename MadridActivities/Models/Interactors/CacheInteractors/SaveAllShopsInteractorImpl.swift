//
//  SaveAllShopsInteractorImpl.swift
//  MadridShop
//
//  Created by Carlos Ledesma on 15/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import CoreData

class SaveAllShopsInteractorImpl : SaveAllShopsInteractor {
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping (Shops) -> Void) {
        execute(shops: shops, context: context, onSuccess: onSuccess, onError: nil)
    }
    
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping (Shops) -> Void, onError: errorClosure) {
        for i in 0 ..< shops.count() {
            let shop = shops.get(atIndex: i)
            let _ : ShopCD = mapShopIntoShopCD(context: context, shop: shop)
        }
        
        do {
            try context.save()
            onSuccess(shops)
        } catch {
            
        }
    }
    
   
    
}
