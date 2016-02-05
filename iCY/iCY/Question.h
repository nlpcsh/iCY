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
@property  NSInteger *quizId;
@property  NSInteger *iD;
@property (strong, nonatomic) NSArray *answers;

-(instancetype)initWithBody: (NSString*) body
                       quizId:(NSInteger*) quizId
                         iD: (NSInteger*) iD;

+(Question*) questionWithBody: (NSString*) body
                       quizId:(NSInteger*) quizId
                           iD: (NSInteger*) iD;

@end
