//
//  ActivityDetailViewController.swift
//  MadridActivities
//
//  Created by Carlos Ledesma on 28/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import UIKit
import SDWebImage

class ActivityDetailViewController: UIViewController {

    var activity : Activity?
    
    @IBOutlet weak var imageMap: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var openingLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let strUrl = "https://maps.googleapis.com/maps/api/staticmap?center=\(activity!.latitude!.description),\(activity!.longitude!.description)&zoom=17&size=320x220&scale=2&markers=%7Ccolor:0x9C7B14%7C\(activity!.latitude!.description),\(activity!.longitude!.description)"
        self.imageMap.sd_setImage(with: URL(string: strUrl), completed: nil)
        self.nameLabel.text = self.activity?.address
        self.openingLabel.text = self.activity?.openingHours
        self.descriptionLabel.text = self.activity?.description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
