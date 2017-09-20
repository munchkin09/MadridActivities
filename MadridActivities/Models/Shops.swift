//
//  Shops.swift
//  MadridShop
//
//  Created by Carlos Ledesma on 7/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import Foundation

public protocol ShopsProtocol {
    func count() -> Int
    func add(shop: Shop)
    func get(atIndex: Int) -> Shop
}

public class Shops : ShopsProtocol {
    
    private var shopsList : [Shop]?
    
    public init() {
        self.shopsList = []
    }
    
    public func count() -> Int {
        return (shopsList?.count)!
    }
    
    public func add(shop: Shop) {
        shopsList?.append(shop)
    }
    
    public func get(atIndex: Int) -> Shop {
        return (shopsList?[atIndex])!
    }
    
    
    
    
}
