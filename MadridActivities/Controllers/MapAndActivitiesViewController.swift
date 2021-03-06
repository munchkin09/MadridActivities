//
//  MapAndActivitiesViewController.swift
//  MadridActivities
//
//  Created by Carlos Ledesma on 19/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import UIKit
import CoreData
import MapKit
import CoreLocation


class MapAndActivitiesViewController: UIViewController {

    var context : NSManagedObjectContext!
    let locationManager = CLLocationManager()
    let reachability = Reachability()!
    
    @IBOutlet weak var collectionActivities: UICollectionView!
    
    @IBOutlet weak var mapActivities: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.locationManager.requestWhenInUseAuthorization()
        self.mapActivities.showsUserLocation = true
        reachability.whenReachable = { reachability in
            ExecuteOnceInteractorImpl().execute(forKey: "once_activities") {
                self.initializeData()
            }
        }
        
        reachability.whenUnreachable = { reachability in
            self.nonReachability()
        }
        
        self.collectionActivities.delegate = self
        self.collectionActivities.dataSource = self
        
        
        let madridLocation = CLLocation(latitude: initialLatitude , longitude: initialLongitude )
        let coordSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: madridLocation.coordinate, span: coordSpan)
        self.mapActivities.setRegion(region, animated: true)
        drawPinsInMap()
        
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func initializeData() {
        let downloadActivitiesInteractor : DownloadAllActivitiesInteractor = DownloadAllActivitiesInteractorNSURLSessionImpl()
        
        downloadActivitiesInteractor.execute(onSuccess: { (activities : Activities) in
            
            let cacheInteractor = SaveAllActivitiesInteractorImpl()
            
            cacheInteractor.execute(activities: activities, context: self.context, onSuccess: { (activities: Activities) in
                SetExecutedOnceInteractorImpl().execute(forKey: "once_activities")
                
                self._fetchedResultsController = nil
                self.collectionActivities.delegate = self
                self.collectionActivities.dataSource = self
                self.collectionActivities.reloadData()
            })
            
        })
    }
    
    // MARK: - Fetched results controller
    var _fetchedResultsController: NSFetchedResultsController<ActivityCD>? = nil
    
    var fetchedResultsController: NSFetchedResultsController<ActivityCD> {
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        
        let fetchRequest: NSFetchRequest<ActivityCD> = ActivityCD.fetchRequest()
        
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
    
    //MARK: - Segue code
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ActivityDetailSegue" {
            let vc = segue.destination as! ActivityDetailViewController
            let indexPath = self.collectionActivities.indexPathsForSelectedItems?.first
            let activityCD : ActivityCD = fetchedResultsController.object(at: indexPath!)
            vc.activity = mapActivityCDIntoActivity(activityCD: activityCD)
        }
    }
    
    //MARK: - Reachability
    func nonReachability() {
        let alert = UIAlertController(title: "No connection", message: "There is no internet connection", preferredStyle: UIAlertControllerStyle.alert)
        self.present(alert, animated: true, completion: nil)
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { _ in
            alert.dismiss(animated: true, completion: nil)
        })
    }
}

