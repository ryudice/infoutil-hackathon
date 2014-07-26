//
//  MisReportesTableViewController.swift
//  
//
//  Created by tio jaime on 7/26/14.
//
//

import UIKit

class MisReportesTableViewController: UITableViewController {

    @IBOutlet weak var revealButton: UIBarButtonItem!
    
    
    func setUpRevealController(){
        
        var revealController = self.revealViewController()
        self.revealButton!.target = revealController
        
        self.revealButton.action = Selector("revealToggle:")
        self.navigationController.navigationBar.addGestureRecognizer(revealController.panGestureRecognizer())
        
        
    }
    func getUserId() -> String{
        
        var app : AppDelegate! =   UIApplication.sharedApplication().delegate as AppDelegate
        
        return app.user!.objectID
        
    }
    
    func loadJson(){
        
       var manager = AFHTTPRequestOperationManager()
    
        manager.GET("http://localhost:3000/api/users/\(getUserId())/reportes", parameters: nil, success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
            println(responseObject.description) // { token = "bd8f26da-219a-4a88-be80-b09207dfc067"; }
            
            let responseDict = responseObject as Dictionary<String, AnyObject>
            var token = (responseDict["reportes"] as AnyObject?)
            println(token)
            
            }, failure: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpRevealController()
        loadJson()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 0
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 0
    }

    /*
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
