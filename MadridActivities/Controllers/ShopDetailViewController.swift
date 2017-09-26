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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        self.title = "La tienda que has pulsado"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
