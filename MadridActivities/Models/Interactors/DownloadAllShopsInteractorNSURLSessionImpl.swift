//
//  DownloadAllShopsInteractorNSURLSessionImpl.swift
//  MadridShop
//
//  Created by Carlos Ledesma on 12/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import Foundation

class DownloadAllShopsInteractorNSURLSessionImpl : DownloadAllShopsInteractor {
    
    func execute(onSuccess: @escaping (Shops) -> Void, onError: errorClosure) {
        let session = URLSession.shared
        if let url = URL(string: "https://madrid-shops.com/json_new/getShops.php") {
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, err: Error?) in
                
                OperationQueue.main.addOperation {
                    assert(Thread.current == Thread.main)
                    if err == nil {
                        let shops = parseShops(data: data!)
                        onSuccess(shops)
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
    
    func execute(onSuccess: @escaping (Shops) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    
}
