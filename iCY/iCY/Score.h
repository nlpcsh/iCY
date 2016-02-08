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
@property (strong, nonatomic) NSString *score;
@property (strong, nonatomic) NSString *time;

-(instancetype)initWithId: (NSString *) iD
                    score: (NSString *) score
                     time: (NSString *) time;

@end
