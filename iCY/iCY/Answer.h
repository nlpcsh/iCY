//
//  Answer.h
//  iCY
//
//  Created by My Name on 2/5/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Answer : NSObject

@property (strong, nonatomic) NSString *body;
@property  NSInteger *questionId;
@property  NSInteger *iD;
@property  BOOL isTrue;

-(instancetype)initWithBody: (NSString*) body
                 questionId: (NSInteger*) questionId
                         iD: (NSInteger*) iD
                     isTrue: (BOOL) isTrue;

+(Answer*) answerWithBody: (NSString*) body
               questionId: (NSInteger*) questionId
                       iD: (NSInteger*) iD
                   isTrue: (BOOL) isTrue;

@end
