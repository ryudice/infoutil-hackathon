//
//  MisReportesObjcTableViewController.m
//  swiftest
//
//  Created by tio jaime on 7/26/14.
//  Copyright (c) 2014 Roberto Yudice. All rights reserved.
//

#import "MisReportesObjcTableViewController.h"
#import "SWRevealViewController.h"
#import "AFNetworking.h"
#import "swiftest-Swift.h"
#import "FBGraphUser.h"
#import "AppDelegate.h"
@interface MisReportesObjcTableViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *revealButton;

@property(strong,nonatomic) NSArray* reportes;


@end

@implementation MisReportesObjcTableViewController

@synthesize revealButton = _revealButton;

@synthesize reportes = _reportes;


//-(NSArray*) reportes{
//    if (_reportes == nil) {
//        [self loadJson];
//    }
//    return _reportes;
//}



-(void)setupRevealController{
    SWRevealViewController*  revealController = [self revealViewController];
    
    self.revealButton.target = revealController;
    
    self.revealButton.action = @selector(revealToggle:);
    [self.navigationController.navigationBar addGestureRecognizer: [revealController panGestureRecognizer]];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupRevealController];
    
    [self loadJson];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


-(NSString*) getUserId{
    AppDelegate* app = [[UIApplication sharedApplication] delegate];
        
    
    return [app.user objectID];

        
    
    
}

-(void) loadJson{
    
    AFHTTPRequestOperationManager* manager =  [AFHTTPRequestOperationManager manager];
    
    [manager GET: [ NSString stringWithFormat:@"http://localhost:3000/api/users/%@/reportes", [self getUserId] ]  parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary* json = responseObject;
        
        NSArray* reportes = [json objectForKey: @"reportes"];
        
        self.reportes = reportes;
        
        [self.tableView reloadData];
        
        NSLog(@"JSON: %@", responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.reportes.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reporte" forIndexPath:indexPath];
    
    NSDictionary* reporte = [self.reportes objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [reporte valueForKey:@"id"];
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
