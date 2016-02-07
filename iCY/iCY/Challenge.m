//
//  Challenge.m
//  iCY
//
//  Created by My Name on 2/6/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import "Challenge.h"

@implementation Challenge

-(instancetype)initWithId: (NSString *) challengeeId
                  questId: (NSString *) questId
                 senderId: (NSString *) senderId
              senderScore: (NSString *) senderScore
               senderTime: (NSString *) senderTime {
    
    if(self = [super init]) {
        self.challengeeId = challengeeId;
        self.questId = questId;
        self.senderId = senderId;
        self.senderScore = senderScore;
        self.senderTime = senderTime;
        self.senderName = nil;
    }
    return self;
}

-(id)initWithDict: (NSDictionary *) dict  {
    
    return [self initWithId: [dict objectForKey: @"challengeeId"]
                    questId: [dict objectForKey: @"questId"]
                   senderId: [dict objectForKey: @"senderId"]
                senderScore: [dict objectForKey: @"senderScore"]
                 senderTime: [dict objectForKey: @"senderTime"]];
}

-(id)dict {
    return @{
             @"challengeeId": self.challengeeId,
                  @"questId": self.questId,
                 @"senderId": self.senderId,
              @"senderScore": self.senderScore,
               @"senderTime": self.senderTime
             };
}

+(Challenge *)challengeWithId: (NSString *) challengeeId
                      questId: (NSString *) questId
                     senderId: (NSString *) senderId
                  senderScore: (NSString *) senderScore
                   senderTime: (NSString *) senderTime {

    return [[Challenge alloc] initWithId: (NSString *) challengeeId
                                 questId: (NSString *) questId
                                senderId: (NSString *) senderId
                             senderScore: (NSString *) senderScore
                              senderTime: (NSString *) senderTime];
}

+(Challenge *)challengeWithDict: (NSDictionary *)dict {
    return [[Challenge alloc] initWithDict: dict];
}

@end
