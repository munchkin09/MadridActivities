//
//  Activity.swift
//  MadridActivities
//
//  Created by Carlos Ledesma on 20/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import Foundation


public class Activity {
    
    var name : String
    var description : String = ""
    var latitude : Float? = nil
    var longitude : Float? = nil
    var image : String = ""
    var logo : String = ""
    var openingHours : String = ""
    var address : String = ""
    
    public init(name: String) {
        self.name = name
    }
}
