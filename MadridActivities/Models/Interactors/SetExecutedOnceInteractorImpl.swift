//
//  SetExecutedOnceInteractorImpl.swift
//  MadridShop
//
//  Created by Carlos Ledesma on 18/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import Foundation

class SetExecutedOnceInteractorImpl : SetExecutedOnceInteractor {
    func execute(forKey: String) {
        let defaults = UserDefaults.standard
        
        defaults.set("SAVED", forKey: forKey)
        
        defaults.synchronize()
    }
}
