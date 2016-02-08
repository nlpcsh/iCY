//
//  Quiz.m
//  iCY
//
//  Created by My Name on 2/5/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import "Quiz.h"

@implementation Quiz

-(instancetype)initWithType:(NSString *)type
                       name:(NSString *)name
                         iD:(NSString *)iD
                  questions:(NSMutableArray *)questions {
    
    if(self = [super init]) {
        self.type = type;
        self.name = name;
        self.iD = iD;
        self.questions = questions;
    }
    return self;
}

+(Quiz *)quizWithType:(NSString *)type
                 name:(NSString *)name
                   iD:(NSString *)iD
            questions:(NSMutableArray *)questions {
    
    return [[Quiz alloc] initWithType:(NSString *) type
                                 name:(NSString *) name
                                   iD:(NSString *) iD
                            questions:(NSMutableArray *) questions];
}

-(id)initWithDict: (NSDictionary *) dict  {
    
    return [self initWithType: [dict objectForKey: @"type"]
                         name: [dict objectForKey: @"name"]
                           iD: [dict objectForKey: @"iD"]
                    questions: [dict objectForKey: @"questions"]] ;
}

-(id)dict {
    return @{
             @"type": self.type,
             @"name": self.name,
             @"iD": self.iD,
             @"questions": self.questions
             };
}

+(Quiz *)quizWithDict: (NSDictionary *)dict {
    return [[Quiz alloc] initWithDict: dict];
}

@end
