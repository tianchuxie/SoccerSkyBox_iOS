//
//  GameController.swift
//  test2
//
//  Created by macboy on 7/12/16.
//  Copyright © 2016 XTC. All rights reserved.
//

import UIKit


import MapKit
import CoreLocation
import EventKit


class GameController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{
    
    
    
    
    
    @IBOutlet var mapView: MKMapView!
    
    
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let location = CLLocationCoordinate2DMake(38.989697, -76.937760)
        
        let span = MKCoordinateSpanMake(0.02, 0.02)
        
        let region = MKCoordinateRegionMake(location, span)
        
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()

        annotation.coordinate = location
        annotation.title = "University of Maryland"
        annotation.subtitle = "College Park"
        
        mapView.addAnnotation(annotation)
        
        //Showing the device location on the map
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations.last
        
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        
        self.mapView.setRegion(region, animated: true)
        
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        print("Errors: " + error.localizedDescription)
    }
    
    
    var savedEventId : String = ""
    
    
    
  
    
    
    @IBAction func Directions(sender: AnyObject) {
        
        if let url = NSURL(string: "http://maps.apple.com/maps?daddr=38.989697,-76.937760"){
            UIApplication.sharedApplication().openURL(url)
        }
        
    }
    
    
}


