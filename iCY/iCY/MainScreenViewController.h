//
//  ViewController.h
//  iCY
//
//  Created by My Name on 2/2/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainScreenViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *welcome;
@property (weak, nonatomic) IBOutlet UIButton *acceptChallenge;
@property (weak, nonatomic) IBOutlet UIButton *challange;
@property (weak, nonatomic) IBOutlet UIButton *doQuiz;

- (IBAction)goToQuiz:(id)sender;
- (IBAction)goToResults:(id)sender;

@end

