//
//  BaseViewController.swift
//  swiftest
//
//  Created by tio jaime on 7/26/14.
//  Copyright (c) 2014 Roberto Yudice. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func getUserId() -> String{
        
        var app : AppDelegate! =   UIApplication.sharedApplication().delegate as AppDelegate
        
        return app.user!.objectID
        
    }
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
