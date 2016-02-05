//
//  Quiz.m
//  iCY
//
//  Created by My Name on 2/5/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import "Quiz.h"

@implementation Quiz

-(instancetype)initWithType:(NSString *)type name:(NSString *) name iD:(NSInteger *)iD {
    if(self = [super init]) {
        self.type = type;
        self.name = name;
        self.iD = iD;
    }
    return self;
}

+(Quiz *)quizWithType:(NSString *)type name:(NSString *)name iD:(NSInteger *)iD {
    return [[Quiz alloc] initWithType:(NSString *)type name:(NSString *)name iD:(NSInteger *)iD];
}
@end
