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
    
    @IBOutlet weak var collectionActivities: UICollectionView!
    
    @IBOutlet weak var mapActivities: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.locationManager.requestWhenInUseAuthorization()
        self.mapActivities.showsUserLocation = true
        ExecuteOnceInteractorImpl().execute(forKey: "once_activities") {
            initializeData()
        }
        self.collectionActivities.delegate = self
        self.collectionActivities.dataSource = self
        
        
        let madridLocation = CLLocation(latitude: 40.416418, longitude: -3.703410)
        let coordSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: madridLocation.coordinate, span: coordSpan)
        self.mapActivities.setRegion(region, animated: true)
        drawPinsInMap()
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ActivityDetailSegue" {
            let vc = segue.destination as! ActivityDetailViewController
            let indexPath = self.collectionActivities.indexPathsForSelectedItems?.first
            let activityCD : ActivityCD = fetchedResultsController.object(at: indexPath!)
            vc.activity = mapActivityCDIntoActivity(activityCD: activityCD)
        }
    }
    
    func drawPinsInMap() {
        if let arrActivitiesCD = fetchedResultsController.fetchedObjects {
            for activityCD in arrActivitiesCD {
                let activityLocation = CLLocation(latitude: CLLocationDegrees(activityCD.latitude), longitude: CLLocationDegrees(activityCD.longitude))
                let note = Note(coordinate: activityLocation.coordinate, title: activityCD.name!, subtitle: "")
                self.mapActivities.addAnnotation(note)
            }
        }
    }

}

