//
//  LocalData.h
//  iCY
//
//  Created by My Name on 2/7/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Challenge.h"
#import "Contact.h"

@interface LocalData : NSObject

@property NSMutableArray *challenges;
@property NSMutableArray *contacts;

-(void) deleteChallenge: (Challenge *) challenge;
-(void) addContact: (Contact *) contact;

@end
