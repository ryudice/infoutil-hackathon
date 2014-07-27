//
//  AppDelegate.swift
//  swiftest
//
//  Created by Roberto Yudice on 7/19/14.
//  Copyright (c) 2014 Roberto Yudice. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {
                            
    var window: UIWindow?

    var _locationManager : CLLocationManager?
    
    
    var user : FBGraphUser?

//    func webSocket(webSocket: SRWebSocket!, didReceiveMessage message: AnyObject!)
//    {
//        
//        
//    }
//    
//    func webSocketDidOpen(webSocket: SRWebSocket!) {
//        
//        	webSocket.send("holamamon")
//    }
    
    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        // Override point for customization after application launch.
        
        var color =  UIColor(red: 0.23, green:0.62, blue:0.99, alpha:1.0)
        
        UINavigationBar.appearance().barTintColor = color
        UIBarButtonItem.appearance().tintColor = UIColor.whiteColor()
        
        _locationManager = CLLocationManager()
        _locationManager!.requestWhenInUseAuthorization()
        _locationManager!.requestAlwaysAuthorization()
        _locationManager!.delegate = self
        _locationManager!.distanceFilter = kCLDistanceFilterNone
        _locationManager!.desiredAccuracy = kCLLocationAccuracyHundredMeters
       _locationManager!.startUpdatingLocation()
        
//        var params : [String:String] = ["location":"13.685173, -89.239616"]
        
        
        
//         var manager = AFHTTPRequestOperationManager()
//        manager.GET("http://localhost:3000/api/asaltos", parameters: params , success: {(operation: AFHTTPRequestOperation!,responseObject: AnyObject!)  in
//            
//            var json : NSDictionary! =   responseObject as NSDictionary
//            
//            
//            
//            
//            if (json.count > 0){
//                //                     println("esta en un punto de asalto")
//                
//                //                    UIAlertView(title: "Infoutil", message: "Estas cerca de un punto de asalto", delegate: nil, cancelButtonTitle: "OK").show()
//            }
//            
//            
//            }, failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
//                println("Error: " + error.localizedDescription)
//            })
        
        //            NSLog("%@",currentLocation.coordinate.latitude)
        //            self.location!.text = NSString(format: "%f , %f mamones", lat, long)
    

    
//        var socket : SRWebSocket = SRWebSocket(URLRequest: NSURLRequest(URL: NSURL(string: "ws://localhost:8080")))
//        
//        
//        socket.open()
        
//        socket.send("mamon")
        
        
        return true
    }

    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        var locationsArray : Array! = locations
        
        if(locationsArray.count > 0){
            NSLog("Location updated delegate", "" )
            var currentLocation : CLLocation! = locationsArray[0] as CLLocation
            var lat = currentLocation.coordinate.latitude
            
            var long = currentLocation.coordinate.longitude
            
            println(lat)
            
            var manager = AFHTTPRequestOperationManager()
            var coordinates = "\(lat),\(long)"
            var params : [String:String] = ["location": "\(lat),\(long)" ]
            
            var facade = ApiFacade(manager: _locationManager)
            
            facade.checkAsaltosWithCoordinates(coordinates)
//            manager.GET("http://localhost:3000/api/asaltos", parameters: params, success: {(operation: AFHTTPRequestOperation!,responseObject: AnyObject!)  in
//            
//                 var json =   responseObject as NSDictionary!
//                
//              
//                
//                if (json.count > 0){
////                     println("esta en un punto de asalto")
//                    
////                    UIAlertView(title: "Infoutil", message: "Estas cerca de un punto de asalto", delegate: nil, cancelButtonTitle: "OK").show()
//                }
//            
//            
//                }, failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
//                    println("Error: " + error.localizedDescription)
//                })
            
            //            NSLog("%@",currentLocation.coordinate.latitude)
//            self.location!.text = NSString(format: "%f , %f mamones", lat, long)
        }
        
    }
    

    
    func applicationWillResignActive(application: UIApplication!) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication!) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication!) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication!) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication!) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

