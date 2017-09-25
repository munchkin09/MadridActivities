//
//  DownloadAllShopsInteractor.swift
//  MadridActivities
//
//  Created by Carlos Ledesma on 25/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import Foundation

protocol DownloadAllShopsInteractor {
    // execute: download all shops. Return on the main thread
    
    func execute(onSuccess: @escaping (Shops) -> Void, onError: errorClosure )
    func execute(onSuccess: @escaping (Shops) -> Void)
}

