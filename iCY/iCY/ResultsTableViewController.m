//
//  ResultsTableViewController.m
//  iCY
//
//  Created by My Name on 2/3/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import "ResultsTableViewController.h"

@interface ResultsTableViewController ()

@end

@implementation ResultsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"Results did load");
    
    self.title = @"My Results";
    [self readResults];
    
}

-(void) readResults {
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    self.results = appDelegate.data.results;
    
    //[NSArray arrayWithObjects:@"First result", @"Second result", @"Third result", nil ];
}

-(UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"resultsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    int quizId = [[[self.results objectAtIndex:indexPath.row] quizId] integerValue];
    NSString *quizName = appDelegate.data.quizNames[quizId];

    //id score = [appDelegate.data.results objectAtIndex:indexPath.row].score;
    
    NSString *displaiedText = [self.results objectAtIndex:indexPath.row];
    
    cell.textLabel.text = displaiedText;
    //cell.imageView.image =
    
    return cell;
}

-(NSInteger)tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section {
    return self.results.count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //NSLog(@" Selected row is %ld", indexPath.row);
    
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
