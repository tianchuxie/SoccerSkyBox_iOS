//
//  GameViewController.swift
//  test2
//
//  Created by macboy on 7/20/16.
//  Copyright © 2016 XTC. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import EventKit

class GameViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    
    
    @IBOutlet weak var availability: UISegmentedControl!
    
    
    @IBOutlet var mapView: MKMapView!
    
    
    @IBOutlet weak var viewAvaliablity: UIView!
    
    @IBOutlet weak var viewDetails: UIView!
    
    @IBAction func changeview(sender: UISegmentedControl) {
        
        if (sender.selectedSegmentIndex == 0 ){
            viewDetails.hidden = false
            viewAvaliablity.hidden = true
        } else if (sender.selectedSegmentIndex == 1 ){
            viewAvaliablity.hidden = false
            viewDetails.hidden = true
            
        }
        
    }
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
    
    
    let titles = ["Location", "Details", "Home/Away"]
    let details = ["Big City", "Field 3", "Home"]
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! GameDetailsViewCell
        cell.title?.text = titles[indexPath.row]
        cell.detail?.text = details[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return titles.count
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
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
    
    // Creates an event in the EKEventStore. The method assumes the eventStore is created and
    // accessible
    func createEvent(eventStore: EKEventStore, title: String, startDate: NSDate, endDate: NSDate) {
        let event = EKEvent(eventStore: eventStore)
        
        event.title = title
        event.startDate = startDate
        event.endDate = endDate
        event.calendar = eventStore.defaultCalendarForNewEvents
        do {
            try eventStore.saveEvent(event, span: .ThisEvent)
            savedEventId = event.eventIdentifier
        } catch {
            print("Bad things happened")
        }
    }
    
    // Removes an event from the EKEventStore. The method assumes the eventStore is created and
    // accessible
    func deleteEvent(eventStore: EKEventStore, eventIdentifier: String) {
        let eventToRemove = eventStore.eventWithIdentifier(eventIdentifier)
        if (eventToRemove != nil) {
            do {
                try eventStore.removeEvent(eventToRemove!, span: .ThisEvent)
            } catch {
                print("Bad things happened")
            }
        }
    }
    
    // Responds to button to add event. This checks that we have permission first, before adding the
    // event
    @IBAction func addEvent(sender: UIButton) {
        let eventStore = EKEventStore()
        
        let startDate = NSDate()
        let endDate = startDate.dateByAddingTimeInterval(60 * 60) // One hour
        
        if (EKEventStore.authorizationStatusForEntityType(.Event) != EKAuthorizationStatus.Authorized) {
            eventStore.requestAccessToEntityType(.Event, completion: {
                granted, error in
                self.createEvent(eventStore, title: "SoccerSkyBoxEvent", startDate: startDate, endDate: endDate)
            })
        } else {
            createEvent(eventStore, title: "SoccerSkyBoxEvent", startDate: startDate, endDate: endDate)
        }
    }
    
    
    // Responds to button to remove event. This checks that we have permission first, before removing the
    // event
    @IBAction func removeEvent(sender: UIButton) {
        let eventStore = EKEventStore()
        
        if (EKEventStore.authorizationStatusForEntityType(.Event) != EKAuthorizationStatus.Authorized) {
            eventStore.requestAccessToEntityType(.Event, completion: { (granted, error) -> Void in
                self.deleteEvent(eventStore, eventIdentifier: self.savedEventId)
            })
        } else {
            deleteEvent(eventStore, eventIdentifier: savedEventId)
        }
        
    }
    
    
    
}