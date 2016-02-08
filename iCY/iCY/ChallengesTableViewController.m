//
//  ChallengesTableViewController.m
//  iCY
//
//  Created by My Name on 2/4/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import "ChallengesTableViewController.h"

@interface ChallengesTableViewController ()

@end

@implementation ChallengesTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"Challenges";
    
    //[self readChallenges];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    AppDelegate* delegate = [UIApplication sharedApplication].delegate;
    self.challenges = [delegate.data challenges];
    
}



-(void)tableView:(UITableView *)tableView commitEditingStyle: (UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    if( editingStyle == UITableViewCellEditingStyleDelete){
        
        AppDelegate* delegate = [UIApplication sharedApplication].delegate;
        [delegate.data deleteChallenge:[self.challenges objectAtIndex: indexPath.row]];
        
        self.challenges = [delegate.data challenges];
        
        [self.tableView deleteRowsAtIndexPaths: @[indexPath]
                              withRowAnimation: UITableViewRowAnimationFade];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

/*- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}*/

-(NSInteger)tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section {
    //return self.challenges.count;
    AppDelegate* delegate = [UIApplication sharedApplication].delegate;
    
    return delegate.data.challenges.count;
}

-(UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = @"challengeCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault
                                      reuseIdentifier: cellIdentifier];
    }
    

    NSString *name = [[self.challenges objectAtIndex:indexPath.row] senderName];
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    int quesId = [[[self.challenges objectAtIndex: indexPath.row] questId] intValue] - 1;
    NSString *quizName = [[appDelegate.data.quizNames objectAtIndex: quesId] name];
    
    NSString *cellText = [ NSString stringWithFormat: @"%@      [ %@ ]", name, quizName];
    cell.textLabel.text = cellText;
    
    //cell.imageView.image =
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //NSLog(@" Selected row is %ld", indexPath.row);
    
    Challenge *challenge = [self.challenges objectAtIndex:indexPath.row];
    NSString *storyBoardId = @"challengeInfoView";
    
    ChallengeInfoViewController *challengeVC =
    [self.storyboard instantiateViewControllerWithIdentifier: storyBoardId];
    challengeVC.challenge = challenge;
    
    // AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    // appDelegate.window.rootViewController = detailsVC;
    [self.navigationController pushViewController: challengeVC
                                         animated: YES];
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
