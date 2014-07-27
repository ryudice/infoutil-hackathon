//
//  AppDelegate.h
//  Infoutil
//
//  Created by tio jaime on 7/26/14.
//  Copyright (c) 2014 tiaime. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBGraphUser.h"

@interface AppDelegatea : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) id<FBGraphUser> user;

@end

