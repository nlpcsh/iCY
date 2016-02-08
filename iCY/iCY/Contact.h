//
//  Contact.h
//  iCY
//
//  Created by My Name on 2/6/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *mobileNumber;
@property (nonatomic, strong) NSString *homeNumber;


+ (id)createContactWithFirst:(NSString *)firstName
                        Last:(NSString *)lastName
                MobileNumber:(NSString *)mobileNumber
                  HomeNumber:(NSString *)homeNumber;

@end
