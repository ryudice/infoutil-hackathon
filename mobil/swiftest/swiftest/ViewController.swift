//
//  ViewController.swift
//  swiftest
//
//  Created by Roberto Yudice on 7/19/14.
//  Copyright (c) 2014 Roberto Yudice. All rights reserved.
//

import UIKit


class ViewController: BaseViewController {
    @IBOutlet var readVC : UIButton!
    
    @IBOutlet var revealButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setUpRevealController()
        
        
        
        
    }
    func setUpRevealController(){
        
        var revealController = self.revealViewController()
        self.revealButton!.target = revealController
        
        self.revealButton.action = Selector("revealToggle:")
        self.navigationController.navigationBar.addGestureRecognizer(revealController.panGestureRecognizer())
        
        
    }
    
   
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

