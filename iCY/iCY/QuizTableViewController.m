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
    
    // reset array of question and answers
    //
    self.questionAndAnswersList = [[NSMutableArray alloc] init];
    [self.questionAndAnswersList removeAllObjects];
    
    UIBarButtonItem *doneBarButton =
    [[UIBarButtonItem alloc]
     initWithBarButtonSystemItem:UIBarButtonSystemItemDone
     target:self
     action:@selector(quizDone)];
    
    self.navigationItem.rightBarButtonItem = doneBarButton;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(IBAction)quizDone {
    NSString *storyBoardId = @"quizDoneScene";
    
    QuizDoneViewController *quizDoneVC =
    [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
    
    [self.navigationController pushViewController:quizDoneVC animated:YES];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    int rowsCount = 0;
    
    rowsCount = (int)self.quiz.questions.count;
    
    // set all questions in single array in proper order
    for (int i=0; i < self.quiz.questions.count; i++) {
        
        [self.questionAndAnswersList addObject:self.quiz.questions[i]];
        
        NSArray *answersArr = [self.quiz.questions[i] answers];
        
        [self.questionAndAnswersList addObjectsFromArray: answersArr];
        
        rowsCount += (int)[self.quiz.questions[i] answers].count;
        
    }
    NSLog(@"Rows for quiz: %i", rowsCount);
    
    return rowsCount;
}


-(UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier;
    static NSString *cellText;
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = cellText;
    cell.imageView.image = [UIImage imageNamed:questionImgStr];
    
    return cell;
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
