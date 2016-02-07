//
//  LocalData.m
//  iCY
//
//  Created by My Name on 2/7/16.
//  Copyright © 2016 My Name. All rights reserved.
//
#import "LocalData.h"

@implementation LocalData

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.challenges = [NSMutableArray array];
    }
    return self;
}

-(void)deleteChallenge:(Challenge *)challenge {
    NSInteger index = [self.challenges indexOfObject:challenge];
    [self.challenges removeObjectAtIndex:index];
}

-(void) addContact: (Contact *) contact {
    [self.contacts addObject:contact];
}

@end
