//
//  AppDelegate.m
//  iCY
//
//  Created by My Name on 2/2/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import "AppDelegate.h"
//#import "iCY-Swift.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.data = [[LocalData alloc] init];
    
    self.httpData = [HttpData httpData];
    
    [self getChallenges];
    
    [self checkIfAppHasPermissionsToReadAddressBook];
    
    [self checkIfIdCorrespondsToNameInAddressBook];
    
    [self.data loadQuizHeadersFromJson];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void) getChallenges {
    
    NSString *url = @"http://localhost:9001/api/challenges";
    
    [ self.httpData getFrom: url
                    headers: nil
      withCompletionHandler: ^(NSDictionary *dict, NSError *err) {
          
          if(err){
              NSLog(@"Error!");
              return;
          }
          
          NSMutableArray *challenges = [NSMutableArray array];
          
          for (NSDictionary *challengesDict in [dict objectForKey: @"result"]){
              [challenges addObject:[Challenge challengeWithDict: challengesDict]];
          }
          
          self.data.challenges = challenges;
          
          //// update data in the element when done
          //dispatch_async(dispatch_get_main_queue(), ^{
          //    [self.tableView reloadData];
          //});
          //NSLog(@"%@", [self.data.challenges[0] challengeeId]);
      }];
}


-(void)checkIfAppHasPermissionsToReadAddressBook {
    // Code to check if there are permissions to use addres book
    // https://www.sinch.com/tutorials/ios-address-book-tutorial/
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
                //// Put contacts in contacts list:
                
                if (!self.data.contacts) {
                    self.data.contacts = [[NSMutableArray alloc] init];
                }
                [self.data.contacts addObject: newContact];
                
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
}

-(void) checkIfIdCorrespondsToNameInAddressBook {
    
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;

    for (int i = 0; i < self.data.contacts.count; i++) {
        
        NSString *phone = [self.data.contacts[i] homeNumber];
        
        for (int j = 0; j < delegate.data.challenges.count; j++) {
            
            NSString *senderId = [delegate.data.challenges[j] senderId];
            
            if (senderId == phone) {
                [delegate.data.challenges[j] setSenderName:[self.data.contacts[i] firstName]];
            }
        }
    }
}

@end
