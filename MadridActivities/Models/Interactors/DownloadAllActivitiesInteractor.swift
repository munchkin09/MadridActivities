//
//  DownloadAllActivitiesInteractor.swift
//  MadridActivities
//
//  Created by Carlos Ledesma on 25/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import Foundation

protocol DownloadAllActivitiesInteractor {
    // execute: download all shops. Return on the main thread
    
    func execute(onSuccess: @escaping (Activities) -> Void, onError: errorClosure )
    func execute(onSuccess: @escaping (Activities) -> Void)
}
