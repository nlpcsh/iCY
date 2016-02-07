//
//  Challage.m
//  iCY
//
//  Created by My Name on 2/6/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import "Challage.h"

@implementation Challage

-(instancetype)initWithId: (NSString *) challengeeId
                  questId: (NSString *) questId
                   sender: (NSString *) sender
              senderScore: (NSString *) senderScore
               senderTime: (NSString *) senderTime {
    
    if(self = [super init]) {
        self.challengeeId = challengeeId;
        self.questId = questId;
        self.sender = sender;
        self.senderScore = senderScore;
        self.senderTime = senderTime;
    }
    return self;
}

+(Challage *)challengeWithId: (NSString *) challengeeId
                     questId: (NSString *) questId
                      sender: (NSString *) sender
                 senderScore: (NSString *) senderScore
                  senderTime: (NSString *) senderTime {
    
    return [[Challage alloc] initWithId: (NSString *) challengeeId
                                questId: (NSString *) questId
                                 sender: (NSString *) sender
                            senderScore: (NSString *) senderScore
                             senderTime: (NSString *) senderTime];
}

@end
