//
//  Challage.h
//  iCY
//
//  Created by My Name on 2/6/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Challage : NSObject

@property (strong, nonatomic) NSString *challengeeId;

@property (strong, nonatomic) NSString *questId;

@property (strong, nonatomic) NSString *sender;

@property (strong, nonatomic) NSString *senderScore;

@property  (strong, nonatomic) NSString *senderTime;


-(instancetype)initWithId: (NSString *) challengeeId
                  questId: (NSString *) questId
                   sender: (NSString *) sender
              senderScore: (NSString *) senderScore
               senderTime: (NSString *) senderTime;

+(Challage *) challengeWithId: (NSString*) challengeeId
                      questId: (NSString *) questId
                       sender: (NSString *) sender
                  senderScore: (NSString *) senderScore
                   senderTime: (NSString *) senderTime;

@end
