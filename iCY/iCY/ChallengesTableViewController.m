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
    
    
    // Code to check if there are permissions to use addres book
    if (ABAddressBookGetAuthorizationStatus() ==
        kABAuthorizationStatusDenied ||
        ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusRestricted) {
        
        UIAlertView *cantAddContactAlert = [[UIAlertView alloc] initWithTitle: @"Cannot Add Contact"
                                                                      message: @"You must give the app permission to add the contact first."
                                                                     delegate: nil
                                                            cancelButtonTitle: @"OK"
                                                            otherButtonTitles: nil];
        [cantAddContactAlert show];
    }
    else if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized){
        [self fillContacts];
    }
    else {
        ABAddressBookRequestAccessWithCompletion(ABAddressBookCreateWithOptions(NULL, nil), ^(bool granted, CFErrorRef error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (!granted) {
                    UIAlertView *cantAddContactAlert = [[UIAlertView alloc] initWithTitle: @"Cannot Add Contact"
                                                                                  message: @"You must give the app permission to add the contact first."
                                                                                 delegate: nil
                                                                        cancelButtonTitle: @"OK"
                                                                        otherButtonTitles: nil];
                    [cantAddContactAlert show];
                    return;
                }
                [self fillContacts];
            });
        });
    }
    
    
    [self readChallenges];
}

- (void)fillContacts {
    ABAddressBookRef addressBookRef = ABAddressBookCreateWithOptions(NULL, nil);
    
    NSArray *allContacts = (__bridge NSArray *)ABAddressBookCopyArrayOfAllPeople(addressBookRef);
    for (id record in allContacts){
        ABRecordRef thisContact = (__bridge ABRecordRef)record;
        
        NSString *fName;
        NSString *lName;
        NSString *mNumber;
        NSString *hNumber;
        
        int numberCount = 0;
        
        ABMultiValueRef phonesRef = ABRecordCopyValue(thisContact, kABPersonPhoneProperty);
        
        if (ABMultiValueGetCount(phonesRef) > 0) {
            // 1
            fName = (__bridge NSString *)ABRecordCopyValue(thisContact, kABPersonFirstNameProperty);
            lName = (__bridge NSString *)ABRecordCopyValue(thisContact, kABPersonLastNameProperty);
            
            for (int i=0; i < ABMultiValueGetCount(phonesRef); i++) {
                
                CFStringRef phoneLabel = ABMultiValueCopyLabelAtIndex(phonesRef, i);
                CFStringRef phoneValue = ABMultiValueCopyValueAtIndex(phonesRef, i);
                
                NSString *phoneNumber = (__bridge NSString *)phoneValue;
                
                // parse out unwanted characters in number
                NSString *parsedPhoneNumber;
                for (int i = 0; i < phoneNumber.length; i++) {
                    char currentChar = [phoneNumber characterAtIndex:i];
                    if (currentChar >= '0' && currentChar <= '9') {
                        NSString *digitString = [NSString stringWithFormat:@"%c",currentChar];
                        if (parsedPhoneNumber.length == 0) {
                            parsedPhoneNumber = [NSString stringWithString:digitString];
                        }
                        else{
                            NSString * newString = [parsedPhoneNumber stringByAppendingString:digitString];
                            parsedPhoneNumber = [NSString stringWithString:newString];
                        }
                    }
                }
                
                // check if number is foreign
                if ((parsedPhoneNumber.length < 11)
                    || (parsedPhoneNumber.length == 11 && [parsedPhoneNumber hasPrefix:@"1"])) {
                    
                    numberCount++;
                    
                    if (CFStringCompare(phoneLabel, kABPersonPhoneMobileLabel, 0) == kCFCompareEqualTo) {
                        mNumber = phoneNumber;
                    }
                    
                    if (CFStringCompare(phoneLabel, kABHomeLabel, 0) == kCFCompareEqualTo) {
                        hNumber = phoneNumber;
                    }
                }
                
                CFRelease(phoneLabel);
                CFRelease(phoneValue);
            }
            
            // 2
            if (numberCount > 0) {
                Contact *newContact = [Contact createContactWithFirst: fName
                                                                 Last: lName
                                                         MobileNumber: mNumber
                                                           HomeNumber: hNumber];
                //// PUT contacts in table:
                
                if (!self.addressBookList) {
                    self.addressBookList = [[NSMutableArray alloc] init];
                }
                [self.addressBookList addObject: newContact];
                
                //NSIndexPath *indexPath = [NSIndexPath indexPathForRow: self.addressBookList.count-1
                //                                            inSection: 0];
                //
                //[self.tableView insertRowsAtIndexPaths: @[indexPath]
                //                     withRowAnimation: UITableViewRowAnimationAutomatic];
                //[self.tableView reloadData];
                
            }
        }
        
        CFRelease(phonesRef);
    }
    
    
    //[self readChallenges];
}


-(void) readChallenges {
    
    //self.challengerNames = [NSMutableDictionary dictionary];
    
    for (int i = 0; i < self.addressBookList.count; i++) {
    
        NSString *phone = [self.addressBookList[i] homeNumber];
        
        for (int j = 0; j < self.challenges.count; j++) {
            
            NSString *senderId = [self.challenges[j] senderId];
            
            if (senderId == phone) {
                [self.challenges[j] setSenderName:[self.addressBookList[i] firstName]];
            }
            
        }
        
//        if (self.challenges[i] == phone) {
//            
//            [self.challengerNames setObject:[self.addressBookList[i] firstName]
//                                     forKey:[self.addressBookList[i] homeNumber]];
//            
//        }
        
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
    return self.challenges.count;
}

-(UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = @"challengeCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault
                                      reuseIdentifier: cellIdentifier];
    }
    
    
    
    
    //NSLog(@" Name: %@, number: %@", cellText, [self.addressBookList[indexPath.row] homeNumber]);
    
    //cell.textLabel.text = cellText;
    
    NSString *name = [[self.challenges objectAtIndex:indexPath.row] senderName];
    NSString *score =[[self.challenges objectAtIndex:indexPath.row] senderScore];
    NSString *time =[[self.challenges objectAtIndex:indexPath.row] senderTime];
    NSString *cellText = [ NSString stringWithFormat: @"%@    SCORE: %@ / Time: %@ sec", name, score, time];

    cell.textLabel.text = cellText;
    
    //cell.imageView.image =
    
    return cell;
}

/*
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //NSLog(@" Selected row is %ld", indexPath.row);
    
}
*/

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
