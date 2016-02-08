//
//  ChallengeInfoViewController.h
//  iCY
//
//  Created by My Name on 2/7/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Challenge.h"
#import "QuizTableViewController.h"

@interface ChallengeInfoViewController : UIViewController

@property (strong, nonatomic) Challenge *challenge;

@property (weak, nonatomic) IBOutlet UILabel *challengerName;
@property (weak, nonatomic) IBOutlet UILabel *challengerScore;
@property (weak, nonatomic) IBOutlet UILabel *challengerTime;

- (IBAction)acceptChallenge:(id)sender;

@end
