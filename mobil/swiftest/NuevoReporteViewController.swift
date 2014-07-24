//
//  NuevoReporteViewController.swift
//  swiftest
//
//  Created by Roberto Yudice on 7/20/14.
//  Copyright (c) 2014 Roberto Yudice. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class NuevoReporteViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet  var mapView: MKMapView?
    
    var _imagePickerController : UIImagePickerController!
    
    @IBOutlet  var imageView: UIImageView!
    
    var _locationManager : CLLocationManager!
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        var locationsArray : Array! = locations
        
        if(locationsArray.count > 0){
            NSLog("Location updated", "" )
            var currentLocation : CLLocation! = locationsArray[0] as CLLocation
            var lat = currentLocation.coordinate.latitude
            var long = currentLocation.coordinate.longitude
            println(lat)
//            NSLog("%@",currentLocation.coordinate.latitude)
            self.location.text = NSString(format: "%f , %f mamones", lat, long)
        }
        
    }
    
    @IBAction func sendReport(sender: AnyObject) {
           
        
    }
    
    @IBOutlet var location: UILabel!
    
    @IBAction func showPicker(){
        _imagePickerController = UIImagePickerController()
        
        _imagePickerController!.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        _imagePickerController.delegate = self
        
        self.presentViewController(_imagePickerController, animated: true, completion: nil)
        
    }
    
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!) {
        
        var images : Dictionary! = info
        
        var pickerImage = images[UIImagePickerControllerOriginalImage] as UIImage
        
        self.imageView.image = pickerImage
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.mapView!.delegate = self
        
        _locationManager = CLLocationManager()
        _locationManager.requestWhenInUseAuthorization()
         _locationManager.requestAlwaysAuthorization()
        _locationManager.delegate = self
        _locationManager.distanceFilter = kCLDistanceFilterNone
        _locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters

        _locationManager.startUpdatingLocation()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
     func mapView(mapView: MKMapView!, didUpdateUserLocation userLocation: MKUserLocation!) {
        mapView.setCenterCoordinate(userLocation.coordinate, animated: true)
        
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
