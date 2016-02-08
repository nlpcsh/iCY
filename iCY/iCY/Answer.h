//
//  Answer.h
//  iCY
//
//  Created by My Name on 2/5/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Answer : NSObject

@property (strong, nonatomic) NSString  *body;
@property (strong, nonatomic) NSString  *questionId;
@property (strong, nonatomic) NSString  *iD;
@property (strong, nonatomic) NSString  *isTrue;

-(instancetype)initWithBody: (NSString *) body
                 questionId: (NSString *) questionId
                         iD: (NSString *) iD
                     isTrue: (NSString *) isTrue;

+(Answer*) answerWithBody: (NSString *) body
               questionId: (NSString *) questionId
                       iD: (NSString *) iD
                   isTrue: (NSString *) isTrue;

-initWithDict: (NSDictionary *) dict;

+(Answer *) answerWithDict: (NSDictionary *) dict;

-dict;

@end
