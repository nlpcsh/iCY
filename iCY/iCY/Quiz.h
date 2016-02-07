//
//  Quiz.h
//  iCY
//
//  Created by My Name on 2/5/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <UIKit/UIKit.h>

@interface Quiz : NSObject

@property  NSInteger *iD;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *type;

@property (strong, nonatomic) NSArray *questions;

-(instancetype)initWithType: (NSString *) type
                       name: (NSString *) name
                         iD: (NSInteger *) iD;

+(Quiz *) quizWithType: (NSString *) type
                  name: (NSString *) name
                    iD: (NSInteger *) iD;
@end
