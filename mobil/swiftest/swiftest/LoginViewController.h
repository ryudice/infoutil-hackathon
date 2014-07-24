//
//  LoginViewController.h
//  swiftest
//
//  Created by Roberto Yudice on 7/21/14.
//  Copyright (c) 2014 Roberto Yudice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
@interface LoginViewController : UIViewController <FBLoginViewDelegate>
@property (weak, nonatomic) IBOutlet FBLoginView *facebookLoginView;

@end
