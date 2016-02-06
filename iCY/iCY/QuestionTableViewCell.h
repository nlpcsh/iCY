//
//  QuestionTableViewCell.h
//  iCY
//
//  Created by My Name on 2/5/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *questionImage;
@property (weak, nonatomic) IBOutlet UILabel *questionBody;

@end
