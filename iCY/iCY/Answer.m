//
//  Answer.m
//  iCY
//
//  Created by My Name on 2/5/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import "Answer.h"

@implementation Answer

-(instancetype)initWithBody:(NSString *)body
                 questionId:(NSString *)questionId
                         iD:(NSString *)iD
                     isTrue:(NSString *)isTrue {
    
    if(self = [super init]) {
        self.body = body;
        self.questionId = questionId;
        self.iD = iD;
        self.isTrue = isTrue;
    }
    return self;
}

+(Answer *)answerWithBody:(NSString *)body
               questionId:(NSString *)questionId
                       iD:(NSString *)iD
                   isTrue:(NSString *)isTrue {

    return [[Answer alloc] initWithBody:(NSString *)body
                             questionId:(NSString *)questionId
                                     iD:(NSString *)iD
                                 isTrue:(NSString *)isTrue];
}

-(id)initWithDict: (NSDictionary *) dict  {
    
    return [self initWithBody: [dict objectForKey: @"body"]
                   questionId: [dict objectForKey: @"questionId"]
                           iD: [dict objectForKey: @"iD"]
                       isTrue: [dict objectForKey: @"isTrue"]] ;
}

-(id)dict {
    return @{
             @"body": self.body,
             @"questionId": self.questionId,
             @"iD": self.iD,
             @"isTrue": self.isTrue
             };
}

+(Answer *)answerWithDict: (NSDictionary *)dict {
    return [[Answer alloc] initWithDict: dict];
}

@end
