//
//  ApiFacade.m
//  swiftest
//
//  Created by tio jaime on 7/26/14.
//  Copyright (c) 2014 Roberto Yudice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApiFacade.h"
#import "AFNetworking.h"

@interface ApiFacade()
@property (strong,nonatomic) CLLocationManager *manager;
@end

@implementation ApiFacade

@synthesize manager=_manager;


-(id) initWithManager: (CLLocationManager *) manager{
    _manager=manager;
    
    return self;
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
}

-(void)checkAsaltosWithCoordinates: (NSString*) coordinates{
    
    
    AFHTTPRequestOperationManager* manager =  [AFHTTPRequestOperationManager manager];
    
    NSDictionary* params = @{
                             @"location" : coordinates
                             
                             };
    
    
    [manager GET: @"http://localhost:3000/api/asaltos" parameters: params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary* json = responseObject;
        
        if (json.count > 0) {
            NSLog(@"asalto encontrado");
            
            [[[UIAlertView alloc]initWithTitle:@"Infoutil" message:@"Se encuentra cerca de un punto de asalto" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
        }
        
//        NSLog(@"JSON: %@", responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

    
}

@end