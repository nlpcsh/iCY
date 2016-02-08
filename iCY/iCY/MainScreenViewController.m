//
//  ViewController.m
//  iCY
//
//  Created by My Name on 2/2/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import "MainScreenViewController.h"
#import "QuizListTableViewController.h"
#import "ResultsTableViewController.h"
#import "ChallengesTableViewController.h"

#import "AppDelegate.h"


@interface MainScreenViewController ()

@end

@implementation MainScreenViewController

static NSString *viewIdentifier = @"MainScreenView" ;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Main";
    
    NSLog(@"Main Did Load!");
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    if (appDelegate.data.challenges.count > 0) {
        self.countOfChallanges.text = [NSString stringWithFormat:@" You have %lu challanges ", (unsigned long)appDelegate.data.challenges.count];
    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)goToQuiz:(id)sender {
    NSLog(@"goTo Quiz!");
    QuizListTableViewController *quizList = [self.storyboard instantiateViewControllerWithIdentifier:@"quizList"];
    
    //AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    //appDelegate.window.rootViewController = quizList;
    
    [self.navigationController pushViewController:quizList animated:YES];
}

- (IBAction)goToResults:(id)sender {
    NSLog(@"goTo Results!");
    ResultsTableViewController *resultsList = [self.storyboard instantiateViewControllerWithIdentifier:@"resultsList"];
    
    //AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    //appDelegate.window.rootViewController = quizList;
    
    [self.navigationController pushViewController: resultsList animated: YES];
}

- (IBAction)goToChallenges:(id)sender {
    NSLog(@"goTo Challenges!");
    ChallengesTableViewController *challengesViewList = [self.storyboard instantiateViewControllerWithIdentifier: @"challengesViewList"];
    
    //challengesViewList.challenges = self.challenges;
    
    [self.navigationController pushViewController: challengesViewList animated: YES];
}
@end
