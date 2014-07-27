//
//  LoginViewController.m
//  swiftest
//
//  Created by Roberto Yudice on 7/21/14.
//  Copyright (c) 2014 Roberto Yudice. All rights reserved.
//

#import "LoginViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import "swiftest-Swift.h"
#import <AFNetworking/AFNetworking.h>
#import "AppDelegate.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize facebookLoginView = _facebookLoginView;


- (void)viewDidLoad {
    [super  viewDidLoad];
    // Do any additional setup after loading the view.
    
    _facebookLoginView.delegate=self;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    
}

-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user{
    
    [self performSegueWithIdentifier: @"login_successful" sender:self];
    
    NSLog(@"%@", [user objectID]);
    
    AppDelegate* delegate = [[UIApplication sharedApplication]delegate];
    
    [delegate setUser:user];
    
    AFHTTPRequestOperationManager *manager =  [[AFHTTPRequestOperationManager alloc] init];
    
    
    NSDictionary *params= @{@"facebook_id": [user objectID],
                            @"name":@"Mamon usando iphone"
                            };
    
    
    [manager POST:@"http://localhost:3000/api/users" parameters: params success: nil failure:nil];
    
    
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
