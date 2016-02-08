//
//  QuizDoneViewController.m
//  iCY
//
//  Created by My Name on 2/5/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import "QuizDoneViewController.h"

@interface QuizDoneViewController ()

@property(nonatomic, strong) CoreDataHelper* cdHelper;

@end

@implementation QuizDoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Rezults";
    
    //NSLog(@"Quiz DONE sceene!");
    
    // hide the navbar
    [self.navigationController setNavigationBarHidden: YES
                                             animated: YES];
    
    [self updateVisualResult];
    
    [self saveResultsToDb];
    
}

-(void) saveResultsToDb {
    //
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    [appDelegate.data.results addObject:[[Score alloc] initWithId: self.quizId
                                                            score: self.score
                                                             time: self.timeSeconds]];
    
    _cdHelper = [[CoreDataHelper alloc] init];
    [_cdHelper setupCoreData];
    
    //Score *currentScore = [NSEntityDescription insertNewObjectForEntityForName: @"Score"
    //                                                    inManagedObjectContext: _cdHelper.context];
    //
    //currentScore.iD = self.quizId;
    //currentScore.score = self.score;
    //currentScore.time = self.timeSeconds;
    //[_cdHelper.context insertObject: currentScore];
    //
    //[self.cdHelper saveContext];
    
}

-(void) updateVisualResult {
    self.timeLable.text = self.timeStr;
    self.scoreLable.text = [NSString stringWithFormat:@"%i", (int)self.score];
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    long qId = [self.quizId integerValue];
    long smt = [[appDelegate.data.challenges[qId] senderScore] integerValue];
    long scoreDiff = smt - [self.score integerValue];
    
    if (scoreDiff < 0) {
        self.diffScoreLable.textColor = [UIColor blueColor];
    }
    else {
        self.diffScoreLable.textColor = [UIColor redColor];
    }
    
    self.diffScoreLable.text = [NSString stringWithFormat:@"%li", scoreDiff];
    
    double timeDiff = [self.timeSeconds doubleValue] - [[appDelegate.data.challenges[qId] senderTime] integerValue];
    
    self.diffTimeLable.text = [NSString stringWithFormat:@"%.1f", timeDiff];
    if (timeDiff < 0) {
        self.diffTimeLable.textColor = [UIColor blueColor];
    }
    else {
        self.diffTimeLable.textColor = [UIColor redColor];
    }
    
    
    if (timeDiff < 0 && scoreDiff < 0) {
        self.howYouDidLable.text = @"You WIN!";
        self.howYouDidLable.textColor = [UIColor greenColor];
    }
    else {
        self.howYouDidLable.text = @"May be next time!";
        self.howYouDidLable.textColor = [UIColor blueColor];
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    // show the navbar
    [self.navigationController setNavigationBarHidden: NO
                                             animated: YES];
}

- (IBAction)goChallengeSmone:(id)sender {
    NSLog(@"go to Challenge Again!");
    
    ResultsTableViewController *resultsList = [self.storyboard instantiateViewControllerWithIdentifier: @"resultsList"];
    
    //AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    //appDelegate.window.rootViewController = quizList;
    
    [self.navigationController pushViewController: resultsList
                                         animated: YES];
}

- (IBAction)goToQuizAgain:(id)sender {
    NSLog(@"go to Quiz Again!");
    
    //AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    //[delegate.data addPhone:phone];
    
    QuizListTableViewController *quizList = [self.storyboard instantiateViewControllerWithIdentifier: @"quizList"];
    
    //AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    //appDelegate.window.rootViewController = quizList;
    
    [self.navigationController pushViewController: quizList
                                         animated: YES];
}

@end
