//
//  QuizTableViewController.m
//  iCY
//
//  Created by My Name on 2/4/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import "QuizTableViewController.h"

@interface QuizTableViewController ()

@end

@implementation QuizTableViewController

static NSString* cellQuestIdentifier = @"QuestionTableViewCell";

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.score = 0;
    
    [self setStopwatch];
    
    // reset array of question and answers
    self.questionAndAnswersList = [[NSMutableArray alloc] init];
    [self.questionAndAnswersList removeAllObjects];
    
    // add Done button
    UIBarButtonItem *doneBarButton =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemDone
                                                  target: self
                                                  action: @selector(quizDone)];
    self.navigationItem.rightBarButtonItem = doneBarButton;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self loadQuiz];
}


-(void) loadQuiz {
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    self.quiz = [appDelegate.data loadQuizFromJson: self.quizId];
}

-(IBAction)quizDone {
    
    [self.stopWatch invalidate];
    self.stopWatch = nil;
        
    NSString *storyBoardId = @"quizDoneScene";
    
    QuizDoneViewController *quizDoneVC = [self.storyboard instantiateViewControllerWithIdentifier: storyBoardId];
    
    quizDoneVC.timeStr = self.timeStr;
    quizDoneVC.timeSeconds = self.timeSeconds;
    
    //self.score = (int)11;
    
    quizDoneVC.score = self.score;
    
    
    [self.navigationController pushViewController: quizDoneVC animated: YES];
}

-(void) setStopwatch {
    self.stopWatch = [NSTimer scheduledTimerWithTimeInterval: 1.0
                                                      target: self
                                                    selector: @selector(timerTick:)
                                                    userInfo: nil
                                                     repeats: YES];
    
    [[NSRunLoop mainRunLoop] addTimer: self.stopWatch forMode: NSRunLoopCommonModes];
    
    self.stopwatchView = (UILabel *)self.navigationItem.titleView;
    
    if (!self.stopwatchView) {
        self.stopwatchView = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, 100, 32)];
        self.stopwatchView.backgroundColor = [UIColor clearColor];
        self.stopwatchView.font = [UIFont boldSystemFontOfSize: 20.0];
        self.stopwatchView.shadowColor = [UIColor colorWithWhite: 0.0
                                                           alpha: 0.5];
        self.stopwatchView.textColor = [UIColor blueColor];
        //self.stopwatchView.backgroundColor = [UIColor blackColor];
        //self.stopwatchView.text = @"00:00:00";
        self.stopwatchView.textAlignment = UITextAlignmentCenter;
        [self.navigationItem setTitleView: self.stopwatchView];
    }
    
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
}

-(void)timerTick:(NSTimer *)timer
{
    self.ticks += 1.0;
    self.timeSeconds = self.ticks;
    double seconds = fmod(self.ticks, 60.0);
    double minutes = fmod(trunc(self.ticks / 60.0), 60.0);
    double hours = trunc(self.ticks / 3600.0);
    self.timeStr = [NSString stringWithFormat:@"%02.0f:%02.0f:%02.0f", hours, minutes, seconds];
    self.stopwatchView.text = self.timeStr;
    //NSLog([NSString stringWithFormat:@"%02.0f:%02.0f:%02.0f", hours, minutes, seconds] );
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    int rowsCount = 0;
    
    self.answersCheck = [NSMutableArray array];
    
    rowsCount = (int)self.quiz.questions.count;
    
    // set all questions in single array in proper order
    for (int i=0; i < self.quiz.questions.count; i++) {
        
        [self.questionAndAnswersList addObject:self.quiz.questions[i]];
        
        NSArray *answersArr = [self.quiz.questions[i] answers];
        
        [self.questionAndAnswersList addObjectsFromArray: answersArr];
        
        rowsCount += (int)[self.quiz.questions[i] answers].count;
        
    }
    //NSLog(@"Rows for quiz: %i", rowsCount);
    
    for (int i=0; i < self.questionAndAnswersList.count; i++) {
        if ([self.questionAndAnswersList[i] isKindOfClass: Question.class]) {
            [self.answersCheck addObject: @"2"];
        }
        else {
            if ([[self.questionAndAnswersList[i] isTrue] isEqual: @"1"]) {
                [self.answersCheck addObject: @"1"];
            }
            else {
                [self.answersCheck addObject: @"0"];
            }
        }
    }
    
    return rowsCount;
}

-(UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    NSString *cellIdentifier;
    NSString *cellText;
    NSString *questionImgStr;
    
    if ([self.questionAndAnswersList[indexPath.row] isKindOfClass:Question.class]) {
        cellIdentifier = @"QuestionTableViewCell";
        questionImgStr = @"questionImage";
    }
    else {
        cellIdentifier = @"AnswerTableViewCell";
    }
    
    cellText = [self.questionAndAnswersList[indexPath.row] body];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault
                                      reuseIdentifier: cellIdentifier];
    }
    
    cell.textLabel.text = cellText;
    cell.imageView.image = [UIImage imageNamed:questionImgStr];
    
    return cell;
}

-(void)viewWillDisappear:(BOOL)animated {
    [self.stopWatch invalidate];
    self.stopWatch = nil;
}

-(void)viewDidAppear:(BOOL)animated{
    self.score = 0;
}


-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell* theCell = [tableView cellForRowAtIndexPath:indexPath];
    
    if ([self.answersCheck[indexPath.row] isEqualToString: @"1"]) {
        
        //Then you change the properties (label, text, color etc..) in your case, the background color
        theCell.contentView.backgroundColor = [UIColor grayColor];
        self.score += 1;
        
        //Deselect the cell so you can see the color change
        
    }
    else if ([self.answersCheck[indexPath.row] isEqualToString: @"0"]) {
        theCell.contentView.backgroundColor = [UIColor grayColor];
    }
    
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
