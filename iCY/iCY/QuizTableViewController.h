//
//  QuizTableViewController.h
//  iCY
//
//  Created by My Name on 2/4/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Quiz.h"
#import "QuizDoneViewController.h"
#import "AnswerTableViewCell.h"

@interface QuizTableViewController : UITableViewController

@property (strong, nonatomic) Quiz *quiz;
@property (strong, nonatomic) NSMutableArray *questionAndAnswersList;
@property (strong, nonatomic) NSTimer *stopWatch;
@property (strong, nonatomic) UILabel *stopwatchView;
@property double ticks;
@property (strong, nonatomic) NSString *timeStr;
@property NSInteger *timeSeconds;
@property NSInteger *score;

@end
