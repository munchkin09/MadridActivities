//
//  ShopDetailViewController.swift
//  MadridActivities
//
//  Created by Carlos Ledesma on 26/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import UIKit

class ShopDetailViewController: UIViewController {

    var shop : Shop?
    
    @IBOutlet weak var descriptionText: UITextView!
    
    @IBOutlet weak var staticMapImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        self.title = shop?.name
        self.descriptionText.text = shop?.description
        let strUrl = "https://maps.googleapis.com/maps/api/staticmap?center=\(shop!.latitude!.description),\(shop!.longitude!.description)&zoom=17&size=320x220&scale=2&markers=%7Ccolor:0x9C7B14%7C\(shop!.latitude!.description),\(shop!.longitude!.description)"
        strUrl.loadImage(into: staticMapImage)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
