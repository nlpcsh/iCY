//
//  Score.m
//  iCY
//
//  Created by My Name on 2/8/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import "Score.h"

@implementation Score

-(instancetype)initWithId:(NSString *)iD
                    score:(NSString *)score
                     time:(NSString *)time {
    
    if(self = [super init]) {
        self.iD = iD;
        self.score = score;
        self.time = time;
    }
    return self;
}

@end
