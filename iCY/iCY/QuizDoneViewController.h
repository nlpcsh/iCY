//
//  QuizDoneViewController.h
//  iCY
//
//  Created by My Name on 2/5/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "QuizListTableViewController.h"
#import "ResultsTableViewController.h"

@interface QuizDoneViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *scoreLable;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;
@property (weak, nonatomic) IBOutlet UILabel *diffScoreLable;
@property (weak, nonatomic) IBOutlet UILabel *diffTimeLable;
@property (weak, nonatomic) IBOutlet UILabel *howYouDidLable;
@property NSInteger *timeSeconds;
@property (strong, nonatomic) NSString *timeStr;
@property NSInteger *score;


- (IBAction)goChallengeSmone:(id)sender;
- (IBAction)goToQuizAgain:(id)sender;


@end
