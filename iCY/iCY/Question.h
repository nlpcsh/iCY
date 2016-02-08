//
//  Question.h
//  iCY
//
//  Created by My Name on 2/5/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (strong, nonatomic) NSString *body;
@property (strong, nonatomic) NSString *quizId;
@property (strong, nonatomic) NSString *iD;
@property (strong, nonatomic) NSMutableArray *answers;

-(instancetype)initWithBody: (NSString *) body
                     quizId: (NSString *) quizId
                         iD: (NSString *) iD
                    answers: (NSMutableArray *) answers;

+(Question*) questionWithBody: (NSString *) body
                       quizId: (NSString *) quizId
                           iD: (NSString *) iD
                      answers: (NSMutableArray *) answers;

-initWithDict: (NSDictionary *) dict;

+(Question *) quiestionWithDict: (NSDictionary *) dict;

-dict;

@end
