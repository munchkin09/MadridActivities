//
//  SaveAllShopsInteractor.swift
//  MadridShop
//
//  Created by Carlos Ledesma on 15/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import Foundation
import CoreData

protocol SaveAllShopsInteractor {
    // execute: save all shops. Return on the main thread
    func execute(shops: Shops, context: NSManagedObjectContext ,onSuccess: @escaping (Shops) -> Void, onError: errorClosure )
    func execute(shops: Shops, context: NSManagedObjectContext ,onSuccess: @escaping (Shops) -> Void)
}
