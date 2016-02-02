//
//  ViewController.m
//  iCY
//
//  Created by My Name on 2/2/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import "MainScreenViewController.h"

@interface MainScreenViewController ()

@end

@implementation MainScreenViewController

static NSString *viewIdentifier = @"MainScreenView" ;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:viewIdentifier owner:self options:nil];
    UIView *subview = (UIView *)[nibs objectAtIndex:0 ];
    [self.view addSubview:subview];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
