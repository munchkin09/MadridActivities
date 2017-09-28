//
//  DownloadAllActivitiesInteractorNSURLSessionImpl.swift
//  MadridActivities
//
//  Created by Carlos Ledesma on 25/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import Foundation

class DownloadAllActivitiesInteractorNSURLSessionImpl : DownloadAllActivitiesInteractor {
    
    func execute(onSuccess: @escaping (Activities) -> Void, onError: errorClosure) {
        let session = URLSession.shared
        if let url = URL(string: "https://madrid-shops.com/json_new/getActivities.php") {
            
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, err: Error?) in
                
                OperationQueue.main.addOperation {
                    assert(Thread.current == Thread.main)
                    if err == nil {
                        let activities = parseActivities(data: data!)
                        onSuccess(activities)
                    } else {
                        if let myError = onError {
                            myError(err!)
                        }
                    }
                }
                
            }
            task.resume()
        }
    }
    
    func execute(onSuccess: @escaping (Activities) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    
}
