//
//  ViewController.m
//  iCY
//
//  Created by My Name on 2/2/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import "MainScreenViewController.h"
#import "QuizListViewController.h"
#include "ResultsTableViewController.h"

#import "AppDelegate.h"

@interface MainScreenViewController ()

@end

@implementation MainScreenViewController

//@synthesize quizListController;

static NSString *viewIdentifier = @"MainScreenView" ;



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Main";
    
    NSLog(@"Main Did Load!");
    // Do any additional setup after loading the view, typically from a nib.
    
    //NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:viewIdentifier owner:self options:nil];
    //UIView *subview = (UIView *)[nibs objectAtIndex:0 ];
    
    //(UIButton *)[subview viewWithTag:111].titleLable.Text = @"Clicked" ;
    
    //[self.view addSubview:subview];
    
    //MainScreenUIView* mainUiView = [[[NSBundle mainBundle] loadNibNamed:@"MainScreenView" owner:self options:nil] objectAtIndex:0];
    
    //[self.view addSubview:mainUiView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*-(void)goToQuiz:(id)sender{
    //if (self.quizListController == nil) {
    NSLog(@"goTo Quiz!");
        
 
    
    
    //[[QuizListViewController alloc] init];
        
        
        //self.quizListController = quizList;
        //[quizList ];
    //}
    //[self.navigationController pushViewController:self animated:YES];
    
}*/

- (IBAction)goToQuiz:(id)sender {
    NSLog(@"goTo Quiz!");
    QuizListViewController *quizList = [self.storyboard instantiateViewControllerWithIdentifier:@"quizList"];
    
    
    //AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    //appDelegate.window.rootViewController = quizList;
    
    [self.navigationController pushViewController:quizList animated:YES];
}

- (IBAction)goToResults:(id)sender {
    NSLog(@"goTo Results!");
    ResultsTableViewController *resultsList = [self.storyboard instantiateViewControllerWithIdentifier:@"resultsList"];
    
    
    //AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    //appDelegate.window.rootViewController = quizList;
    
    [self.navigationController pushViewController:resultsList animated:YES];
}
@end
