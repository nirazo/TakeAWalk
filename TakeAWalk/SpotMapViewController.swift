//
//  SpotMapViewController.swift
//  TakeAWalk
//
//  Created by Kenzo on 2014/10/11.
//  Copyright (c) 2014年 Kenzo. All rights reserved.
//

import UIKit
import CoreLocation

class SpotMapViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {
    
    var lm: CLLocationManager! = CLLocationManager()
    let defaultRadius = 300
    var mapView : GMSMapView = GMSMapView()
    var spotThumbnailListViewController : SpotThumbnailListViewController = SpotThumbnailListViewController();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.myLocationEnabled = true
        mapView.delegate = self
        
        lm = CLLocationManager()
        lm.delegate = self
        lm.desiredAccuracy = kCLLocationAccuracyBest
        if (lm.respondsToSelector(Selector("requestAlwaysAuthorization"))) {
            lm.requestWhenInUseAuthorization()
        }
        lm.distanceFilter = 300
        lm.startUpdatingLocation()
        
        var frame : CGRect = CGRect()
        frame.origin.x = 0
        frame.origin.y = 0
        frame.size.width = self.view.frame.size.width
        frame.size.height = self.view.frame.size.height - 100
        mapView.frame = frame
        self.view.addSubview(mapView)
        self.view.addSubview(spotThumbnailListViewController.view)
        startLocation()
    }
    
    func startLocation(){
        NSLog("aaaaaa")
        lm.startUpdatingLocation()
    }
    
    func stopLocation(){
        
    }
    
    
    
    func locationManager(manager: CLLocationManager!, didUpdateToLocation newLocation: CLLocation!, fromLocation oldLocation: CLLocation!){
        NSLog("bbb")
        var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude:newLocation.coordinate.latitude,longitude:newLocation.coordinate.longitude)
        var now :GMSCameraPosition = GMSCameraPosition.cameraWithLatitude(coordinate.latitude,longitude:coordinate.longitude,zoom:17)
        mapView.camera = now
        
        
        
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!){
        NSLog("ccc")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

