//
//  Challenge.h
//  iCY
//
//  Created by My Name on 2/6/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Challenge : NSObject

@property (strong, nonatomic) NSString *challengeeId;

@property (strong, nonatomic) NSString *questId;

@property (strong, nonatomic) NSString *senderId;

@property (strong, nonatomic) NSString *senderName;

@property (strong, nonatomic) NSString *senderScore;

@property  (strong, nonatomic) NSString *senderTime;


-(instancetype)initWithId: (NSString *) challengeeId
                  questId: (NSString *) questId
                 senderId: (NSString *) senderId
              senderScore: (NSString *) senderScore
               senderTime: (NSString *) senderTime;

+(Challenge *) challengeWithId: (NSString*) challengeeId
                      questId: (NSString *) questId
                     senderId: (NSString *) senderId
                  senderScore: (NSString *) senderScore
                   senderTime: (NSString *) senderTime;

-initWithDict: (NSDictionary*) dict;

+(Challenge *) challengeWithDict: (NSDictionary *) dict;

-dict;

@end
