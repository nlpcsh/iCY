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
{
    NSString *_url;
}

static NSString *viewIdentifier = @"MainScreenView" ;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Main";
    
    NSLog(@"Main Did Load!");
    
    _url = @"http://localhost:9001/api/challenges";
    
    self.httpData = [HttpData httpData];
    
    [self loadChallenges];
}

-(void) loadChallenges {
    [ self.httpData getFrom: _url
                    headers: nil
      withCompletionHandler: ^(NSDictionary *dict, NSError *err) {
          
          if(err){
              NSLog(@"Error!");
              return;
          }
          
          NSMutableArray *challenges = [NSMutableArray array];
          
          for (NSDictionary *challengesDict in [dict objectForKey:@"result"]){
              [challenges addObject:[Challenge challengeWithDict: challengesDict]];
          }
          self.challenges = challenges;
          
          //// update data in the element when done
          //dispatch_async(dispatch_get_main_queue(), ^{
          //    [self.tableView reloadData];
          //});
          //NSLog(@"%@", [self.challenges[0] challengeeId]);
      }];
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
    
    challengesViewList.challenges = self.challenges;
    
    [self.navigationController pushViewController: challengesViewList animated: YES];
}
@end
