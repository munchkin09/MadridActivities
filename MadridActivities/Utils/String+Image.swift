//
//  File.swift
//  MadridActivities
//
//  Created by Carlos Ledesma on 20/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//
import UIKit

extension String {
    
    func loadImage(into imageView: UIImageView)  {
        let queue = OperationQueue()
        
        queue.addOperation {
            
            if let url = URL(string: self),
                let data = NSData(contentsOf: url),
                let image = UIImage(data: data as Data) {
                OperationQueue.main.addOperation {
                    imageView.image = image
                }
            }
        }
    }
    
    func trimAndConvertToFloat() -> Float {
        return Float(self.trimmingCharacters(in: .whitespaces)) ?? 0.0
    }
    
}
