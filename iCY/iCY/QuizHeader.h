//
//  QuizHeader.h
//  iCY
//
//  Created by My Name on 2/7/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuizHeader : NSObject

@property (strong, nonatomic) NSString *iD;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *type;


-(instancetype)initWithId: (NSString *) iD
                     name: (NSString *) name
                     type: (NSString *) type;

+(QuizHeader *) quizWithId: (NSString *) iD
                      name: (NSString *) name
                      type: (NSString *) type;

-initWithDict: (NSDictionary *) dict;

+(QuizHeader *) quizWithDict: (NSDictionary *) dict;

-dict;

@end
