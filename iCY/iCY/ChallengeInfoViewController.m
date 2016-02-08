//
//  ChallengeInfoViewController.m
//  iCY
//
//  Created by My Name on 2/7/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import "ChallengeInfoViewController.h"

@interface ChallengeInfoViewController ()

@end

@implementation ChallengeInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.challengerName.text = self.challenge.senderName;
    self.challengerScore.text = self.challenge.senderScore;
    self.challengerTime.text = self.challenge.senderTime;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)acceptChallenge:(id)sender {
    
    QuizTableViewController *quiz = [self.storyboard instantiateViewControllerWithIdentifier: @"quizView"];
    
    //AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    //appDelegate.window.rootViewController = quizList;
    
    [self.navigationController pushViewController: quiz
                                         animated: YES];
}
@end
