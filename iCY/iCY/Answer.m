//
//  Answer.m
//  iCY
//
//  Created by My Name on 2/5/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import "Answer.h"

@implementation Answer

-(instancetype)initWithBody:(NSString *)body questionId:(NSInteger *)questionId iD:(NSInteger *)iD isTrue:(BOOL)isTrue {
    if(self = [super init]) {
        self.body = body;
        self.questionId = questionId;
        self.iD = iD;
        self.isTrue = isTrue;
    }
    return self;
}

+(Answer *)answerWithBody:(NSString *)body questionId:(NSInteger *)questionId iD:(NSInteger *)iD isTrue:(BOOL)isTrue {
    return [[Answer alloc] initWithBody:(NSString *)body questionId:(NSInteger *)questionId iD:(NSInteger *)iD isTrue:(BOOL)isTrue];
}


@end
