//
//  ViewController.swift
//  UpdatingLocation
//
//  Created by osu on 2018/04/21.
//  Copyright © 2018 osu. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager!
    var isUpdating: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 5
        
        let status = CLLocationManager.authorizationStatus()
        if (status != CLAuthorizationStatus.authorizedAlways) {
            locationManager.requestAlwaysAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch (status) {
        case .authorizedAlways:
            updatingLocation()
            break
        default:
            break
        }
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("locations: \(locations.count)")
        for location in locations {
            print(location.description)
        }
    }
    
    func updatingLocation() {
        guard isUpdating == false else {
            return
        }
        isUpdating = true
        
        locationManager.startUpdatingLocation()
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
}
