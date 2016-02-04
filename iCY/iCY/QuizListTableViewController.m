//
//  QuizListViewController.m
//  iCY
//
//  Created by My Name on 2/3/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import "QuizListTableViewController.h"

@interface QuizListTableViewController ()

@end

@implementation QuizListTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSLog(@"Quiz list did load");
    
    [self quizListUpdate];
    
}

-(void) quizListUpdate {
    self.quizList = [NSArray arrayWithObjects:@"First quiz", @"Second quiz", @"Third quiz", nil ];
}

-(UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"quizNameCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [self.quizList objectAtIndex:indexPath.row];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end