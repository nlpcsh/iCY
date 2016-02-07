//
//  AppDelegate.h
//  iCY
//
//  Created by My Name on 2/2/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import "HttpData.h"
//#import "Challenge.h"
#import "LocalData.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) LocalData *data;
@property (strong, nonatomic) HttpData *httpData;

@end

