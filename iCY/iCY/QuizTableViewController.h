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

@end
