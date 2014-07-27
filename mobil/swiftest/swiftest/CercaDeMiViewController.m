//
//  CercaDeMiViewController.m
//  swiftest
//
//  Created by tio jaime on 7/26/14.
//  Copyright (c) 2014 Roberto Yudice. All rights reserved.
//

#import "CercaDeMiViewController.h"
#import "SWRevealViewController.h"
#import "swiftest-Swift.h"
#import "FBGraphUser.h"
#import "AppDelegate.h"
@interface CercaDeMiViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *revealButton;

@end

@implementation CercaDeMiViewController


@synthesize revealButton = _revealButton;

-(void)setupRevealController{
    SWRevealViewController*  revealController = [self revealViewController];
    
    self.revealButton.target = revealController;
    
    self.revealButton.action = @selector(revealToggle:);
    [self.navigationController.navigationBar addGestureRecognizer: [revealController panGestureRecognizer]];
    
}

-(NSString*) getUserId{
    AppDelegate* app = [[UIApplication sharedApplication] delegate];
    
    
    return [app.user objectID];
    
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupRevealController];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
