//
//  Score.h
//  iCY
//
//  Created by My Name on 2/8/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Score : NSObject

@property (strong, nonatomic) NSString *iD;
@property NSNumber *score;
@property NSNumber *time;

-(instancetype)initWithId: (NSString *) iD
                    score: (NSNumber * ) score
                     time: (NSNumber * ) time;

@end
