//
//  Question.m
//  iCY
//
//  Created by My Name on 2/5/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import "Question.h"

@implementation Question

-(instancetype)initWithBody:(NSString *)body quizId:(NSInteger *)quizId iD:(NSInteger *)iD {
    if(self = [super init]) {
        self.body = body;
        self.quizId = quizId;
        self.iD = iD;
    }
    return self;
}

+(Question *)questionWithBody:(NSString *)body quizId:(NSInteger *)quizId iD:(NSInteger *)iD {
    return [[Question alloc] initWithBody:(NSString *)body quizId:(NSInteger *)quizId iD:(NSInteger *)iD];
}

@end
