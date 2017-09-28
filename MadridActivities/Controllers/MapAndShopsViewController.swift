//
//  MapAndShopsViewController.swift
//  MadridActivities
//
//  Created by Carlos Ledesma on 20/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation
import MapKit


class MapAndShopsViewController: UIViewController, CLLocationManagerDelegate {

    var context : NSManagedObjectContext!
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapShops: MKMapView!
    
    @IBOutlet weak var collectionShops: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        self.mapShops.showsUserLocation = true
        // Do any additional setup after loading the view.
        ExecuteOnceInteractorImpl().execute(forKey: "once_shops") {
            initializeData()
        }
        self.collectionShops.delegate = self
        self.collectionShops.dataSource = self
        
        let madridLocation = CLLocation(latitude: 40.416418, longitude: -3.703410)
        let coordSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: madridLocation.coordinate, span: coordSpan)
        self.mapShops.setRegion(region, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeData() {
        let downloadShopsInteractor : DownloadAllShopsInteractor = DownloadAllShopsInteractorNSURLSessionImpl()
        
        downloadShopsInteractor.execute(onSuccess: { (shops: Shops) in
            
            let cacheInteractor = SaveAllShopsInteractorImpl()
            
            cacheInteractor.execute(shops: shops, context: self.context, onSuccess: { (shops: Shops) in
                SetExecutedOnceInteractorImpl().execute(forKey: "once_shops")
                
                self._fetchedResultsController = nil
                self.collectionShops.delegate = self
                self.collectionShops.dataSource = self
                self.collectionShops.reloadData()
            })
            
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowShopDetailSegue" {
            let vc = segue.destination as! ShopDetailViewController
            let indexPath = self.collectionShops.indexPathsForSelectedItems?.first
            let shopCD : ShopCD = fetchedResultsController.object(at: indexPath!)
            vc.shop = mapShopCDIntoShop(shopCD: shopCD)
            
        }
    }
    
    
    
    // MARK: - Fetched results controller
    var _fetchedResultsController: NSFetchedResultsController<ShopCD>? = nil
    
    var fetchedResultsController: NSFetchedResultsController<ShopCD> {
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        
        let fetchRequest: NSFetchRequest<ShopCD> = ShopCD.fetchRequest()
        
        // Set the batch size to a suitable number.
        fetchRequest.fetchBatchSize = 20
        
        // Edit the sort key as appropriate.
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        // Edit the section name key path and cache name if appropriate.
        // nil for section name key path means "no sections".
        let aFetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.context!, sectionNameKeyPath: nil, cacheName: "Master")
        //aFetchedResultsController.delegate = self
        _fetchedResultsController = aFetchedResultsController
        
        do {
            try _fetchedResultsController!.performFetch()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return _fetchedResultsController!
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        //self.mapShops.setCenter(location.coordinate, animated: true)
    }
    
}
