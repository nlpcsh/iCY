//
//  QuizHeader.m
//  iCY
//
//  Created by My Name on 2/7/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import "QuizHeader.h"

@implementation QuizHeader

-(instancetype)initWithId: (NSString *) iD
                     name: (NSString *) name
                     type: (NSString *) type {
    if(self = [super init]) {
        self.iD = iD;
        self.name = name;
        self.type = type;
    }
    return self;
}

-(id)initWithDict: (NSDictionary *) dict  {
    
    return [self initWithId: [dict objectForKey: @"iD"]
                       name: [dict objectForKey: @"name"]
                       type: [dict objectForKey: @"type"]];
}

-(id)dict {
    return @{
             @"iD": self.iD,
             @"name": self.name,
             @"type": self.type
             };
}

+(QuizHeader *)quizWithId: (NSString *) iD
                          name: (NSString *) name
                          type: (NSString *) type {
    
    return [[QuizHeader alloc] initWithId: (NSString *) iD
                                     name: (NSString *) name
                                     type: (NSString *) type];
}

+(QuizHeader *)quizWithDict: (NSDictionary *)dict {
    return [[QuizHeader alloc] initWithDict: dict];
}


@end
