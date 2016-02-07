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
    
    
    Answer *a1_1 = [ Answer answerWithBody:@"Is ok" questionId:(NSInteger *)101 iD:(NSInteger *)201 isTrue:(BOOL)YES];
    Answer *a1_2 = [ Answer answerWithBody:@"Not ok" questionId:(NSInteger *)101 iD:(NSInteger *)202 isTrue:(BOOL)NO];
    Question *q1 = [Question questionWithBody:@"How are you?" quizId:(NSInteger *)1 iD:(NSInteger *)101];
    
    q1.answers = [NSArray arrayWithObjects:a1_1, a1_2, nil];
    
    Answer *a2_1 = [ Answer answerWithBody:@"23" questionId:(NSInteger *)101 iD:(NSInteger *)203 isTrue:(BOOL)NO];
    Answer *a2_2 = [ Answer answerWithBody:@"12" questionId:(NSInteger *)101 iD:(NSInteger *)204 isTrue:(BOOL)YES];
    Question *q2 = [Question questionWithBody:@"How much is 1 + 11?" quizId:(NSInteger *)1 iD:(NSInteger *)102];
    
    q2.answers = [NSArray arrayWithObjects:a2_1, a2_2, nil];
    
    NSArray *questionsToQuiz = [NSArray arrayWithObjects: q1, q2, nil];
    
    myQuiz.questions = questionsToQuiz;
    
    
    Quiz *myQuiz2 = [Quiz quizWithType:@"Biology" name:@"Reptiles" iD:(NSInteger *)2];
    
    NSLog(@" Quiz name: %@", myQuiz2.name);
    
    NSArray *questionsToQuiz2 = [NSArray arrayWithObjects: q2, q1, nil];
    
    myQuiz2.questions = questionsToQuiz2;
    
    self.quizList = [NSArray arrayWithObjects: myQuiz, myQuiz2, nil ];
}

-(UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"quizNameCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault
                                      reuseIdentifier: cellIdentifier];
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
    [self.navigationController pushViewController: quizVC
                                         animated: YES];
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
