//
//  ExecuteOnceInteractorImpl.swift
//  MadridShop
//
//  Created by Carlos Ledesma on 18/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import Foundation


class ExecuteOnceInteractorImpl : ExecuteOnceInteractor {
    func execute(forKey: String, closure: () -> Void) {
        let defaults = UserDefaults.standard
        if let _ = defaults.string(forKey: forKey) {
            // do nothing, already saved
        } else {
            closure()
        }
        
    }
    
    
}
