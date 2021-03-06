//
//  LocalData.m
//  iCY
//
//  Created by My Name on 2/7/16.
//  Copyright © 2016 My Name. All rights reserved.
//
#import "LocalData.h"

@implementation LocalData

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.challenges = [NSMutableArray array];
        self.contacts = [NSMutableArray array];
        self.quizNames = [NSMutableArray array];
        self.results = [NSMutableArray array];
    }
    return self;
}

-(void)deleteChallenge:(Challenge *)challenge {
    NSInteger index = [self.challenges indexOfObject:challenge];
    [self.challenges removeObjectAtIndex:index];
}

-(void) addContact: (Contact *) contact {
    [self.contacts addObject:contact];
}

-(void) loadQuizHeadersFromJson {
    
    NSString * filePath =[[NSBundle mainBundle] pathForResource:@"list" ofType:@"json"];
    
    NSError * error;
    NSString* fileContents =[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    
    if(error)
    {
        NSLog(@"Error reading file: %@",error.localizedDescription);
    }
    
    NSArray *rawQuizHeaders = (NSArray *)[NSJSONSerialization JSONObjectWithData:[fileContents dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
    
    //NSMutableArray *myItems = [[NSMutableArray alloc] init];

    for (NSDictionary *dict in rawQuizHeaders) {
        QuizHeader *headers = [[QuizHeader alloc] initWithDict: dict];
        [self.quizNames addObject: headers];
    }
    
    //NSLog(@"%@",[self.quizNames[0] name]);
}

-(Quiz *) loadQuizFromJson: (NSString *) quizId {
    
    NSString * filePath =[[NSBundle mainBundle] pathForResource: quizId ofType: @"json"];
    NSError * error;
    NSString* fileContents =[NSString stringWithContentsOfFile: filePath encoding:NSUTF8StringEncoding error:&error];
    
    if(error)
    {
        NSLog(@"Error reading file: %@",error.localizedDescription);
    }
    
    NSArray *rawQuiz = (NSArray *)[NSJSONSerialization JSONObjectWithData:[fileContents dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
    
    NSMutableArray *quizBody = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dictQuiz in rawQuiz) {
        Quiz *quiz = [[Quiz alloc] initWithDict: dictQuiz];
        
        NSMutableArray *questions = [NSMutableArray array];
        
        for (NSDictionary *dictQuestion in quiz.questions) {
            
            Question *question = [[Question alloc] initWithDict:dictQuestion];
            NSMutableArray *answers = [NSMutableArray array];
            
            for (NSDictionary *dictAnswers in question.answers) {
                Answer *answer = [[Answer alloc] initWithDict:dictAnswers];
                [answers addObject:answer];
            }
            
            question.answers = answers;
            [questions addObject:question];
        }

        //[quiz.questions removeAllObjects];
        
        quiz.questions = questions;
        
        [quizBody addObject: quiz];
    }
    
    return quizBody[0];
}

@end
