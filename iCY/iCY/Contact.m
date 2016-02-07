//
//  Contact.m
//  iCY
//
//  Created by My Name on 2/6/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import "Contact.h"

@implementation Contact

+ (id)createContactWithFirst: (NSString *) firstName
                        Last: (NSString *) lastName
                MobileNumber: (NSString *) mobileNumber
                  HomeNumber: (NSString *) homeNumber
{
    Contact *newContact = [[self alloc] init];
    [newContact setFirstName: firstName];
    [newContact setLastName: lastName];
    [newContact setMobileNumber: mobileNumber];
    [newContact setHomeNumber: homeNumber];
    
    return newContact;
}

@end
