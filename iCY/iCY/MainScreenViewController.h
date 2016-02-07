//
//  ViewController.h
//  iCY
//
//  Created by My Name on 2/2/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HttpData.h"
#import "Challenge.h"

@interface MainScreenViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *welcome;
@property (weak, nonatomic) IBOutlet UIButton *acceptChallenge;
@property (weak, nonatomic) IBOutlet UIButton *challange;
@property (weak, nonatomic) IBOutlet UIButton *doQuiz;

//@property (strong, nonatomic) HttpData *httpData;
//@property (strong, nonatomic) NSArray* challenges;

- (IBAction)goToQuiz:(id)sender;
- (IBAction)goToResults:(id)sender;
- (IBAction)goToChallenges:(id)sender;

@end

