//
//  QuizDoneViewController.m
//  iCY
//
//  Created by My Name on 2/5/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import "QuizDoneViewController.h"

@interface QuizDoneViewController ()

@end

@implementation QuizDoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Quiz Rezults";
    
    NSLog(@"Quiz DONE sceene!");
    // Do view setup here.
}

- (IBAction)goChallengeSmone:(id)sender {
    NSLog(@"go to Challenge Again!");
    
   ResultsTableViewController *resultsList = [self.storyboard instantiateViewControllerWithIdentifier:@"resultsList"];
    
    //AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    //appDelegate.window.rootViewController = quizList;
    
    [self.navigationController pushViewController:resultsList animated:YES];
}

- (IBAction)goToQuizAgain:(id)sender {
    NSLog(@"go to Quiz Again!");
    //AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    //[delegate.data addPhone:phone];
    
    QuizListTableViewController *quizList = [self.storyboard instantiateViewControllerWithIdentifier:@"quizList"];
    
    //AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    //appDelegate.window.rootViewController = quizList;
    
    [self.navigationController pushViewController:quizList animated:YES];
}

@end
