//
//  MapController.swift
//  JarturaExpress
//
//  Created by Carlos Gonzalez on 12/19/16.
//  Copyright © 2016 Carlos Gonzalez. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

class MapController : UIViewController, UITextFieldDelegate, CLLocationManagerDelegate, GMSMapViewDelegate {
    var firstTime : Bool?
    //location
    let locationManager = CLLocationManager()
    //The map view
    @IBOutlet weak var mapView: GMSMapView!{
        didSet{
            //setting map info
            mapView.isMyLocationEnabled = true;
            mapView.settings.rotateGestures = false
            mapView.settings.zoomGestures = false
            mapView.settings.tiltGestures = false
            mapView.delegate = self
        }
    }
    //my text field for search
    @IBOutlet weak var txtSearch: SearchTextField! {
        didSet{
            txtSearch.delegate = self
        }
    }
    
    //loading
    override func viewDidLoad() {
        super.viewDidLoad()
        //keyboard dismiss
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MapController.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        //setting location
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled(){
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.locationManager.delegate = self
            self.locationManager.startUpdatingLocation()
        }
        firstTime = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //getting location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0]
        if firstTime!{
            //setting camera
            let camera = GMSCameraPosition.camera(withLatitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude, zoom: 15)
            self.mapView.camera = camera
            firstTime = false
        }
    }
    //when pressing enter dismiss keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        return true
    }
    //when tapping map hide keyboard
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        dismissKeyboard()
    }
    
    //end keyboard
    func dismissKeyboard(){
        self.view.endEditing(true)
    }
}
