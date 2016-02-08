//
//  Question.m
//  iCY
//
//  Created by My Name on 2/5/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import "Question.h"

@implementation Question

-(instancetype)initWithBody: (NSString *) body
                     quizId: (NSString *) quizId
                         iD: (NSString *) iD
                    answers: (NSMutableArray *) answers {
    
    if(self = [super init]) {
        self.body = body;
        self.quizId = quizId;
        self.iD = iD;
        self.answers = answers;
    }
    return self;
}

+(Question *)questionWithBody: (NSString *) body
                       quizId: (NSString *) quizId
                           iD: (NSString *) iD
                      answers: (NSMutableArray *) answers
{

    return [[Question alloc] initWithBody:(NSString *) body
                                   quizId: (NSString *) quizId
                                       iD: (NSString *) iD
                                  answers: (NSMutableArray *) answers];
}

-(id)initWithDict: (NSDictionary *) dict  {
    
    return [self initWithBody: [dict objectForKey: @"body"]
                       quizId: [dict objectForKey: @"quizId"]
                           iD: [dict objectForKey: @"iD"]
                      answers: [dict objectForKey: @"answers"]] ;
}

-(id)dict {
    return @{
             @"body": self.body,
             @"quizId": self.quizId,
             @"iD": self.iD,
             @"answers": self.answers
             };
}

+(Question *)quiestionWithDict: (NSDictionary *)dict {
    return [[Question alloc] initWithDict: dict];
}

@end
