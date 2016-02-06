//
//  QuizListViewController.m
//  iCY
//
//  Created by My Name on 2/3/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import "QuizListTableViewController.h"
#import "QuizTableViewController.h"

//#import "iCY-Bridging-Header.h"
//#import "iCY-Swift.h"

@interface QuizListTableViewController ()

@end

@implementation QuizListTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSLog(@"Quiz list did load");
    
    [self quizListUpdate];
    
}

-(void) quizListUpdate {
    
    Quiz *myQuiz = [Quiz quizWithType:@"IT" name:@"Programming" iD:(NSInteger *)1];
    
    NSLog(@" Quiz name: %@", myQuiz.name);
    
    NSArray *questionsToQuiz = [NSArray arrayWithObjects:@"Question 1", @"Question 2", nil];
    
    myQuiz.questions = questionsToQuiz;
    
    
    Quiz *myQuiz2 = [Quiz quizWithType:@"Biology" name:@"Reptiles" iD:(NSInteger *)2];
    
    NSLog(@" Quiz name: %@", myQuiz2.name);
    
    NSArray *questionsToQuiz2 = [NSArray arrayWithObjects:@"Question 3", @"Question 4", nil];
    
    myQuiz2.questions = questionsToQuiz2;
    
    self.quizList = [NSArray arrayWithObjects: myQuiz, myQuiz2, nil ];
}

-(UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"quizNameCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [[self.quizList objectAtIndex:indexPath.row] name];
    //cell.imageView.image =
    
    return cell;
}

-(NSInteger)tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section {
    return self.quizList.count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //NSLog(@" Selected row is %ld", indexPath.row);
    
    Quiz *quiz = [self.quizList objectAtIndex:indexPath.row];
    NSString *storyBoardId = @"quizView";
    
    QuizTableViewController *quizVC =
    [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
    quizVC.quiz = quiz;
    
    //         AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    //    appDelegate.window.rootViewController = detailsVC;
    [self.navigationController pushViewController:quizVC animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
