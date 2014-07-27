//
//  ApiFacade.h
//  swiftest
//
//  Created by tio jaime on 7/26/14.
//  Copyright (c) 2014 Roberto Yudice. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>
@interface ApiFacade : NSObject<UIAlertViewDelegate>

-(void) checkAsaltosWithCoordinates: (NSString *) coordinates ;

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end