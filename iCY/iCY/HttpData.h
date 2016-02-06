//
//  HttpData.h
//  iCY
//
//  Created by My Name on 2/6/16.
//  Copyright © 2016 My Name. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpData : NSObject

-(void) getFrom: (NSString*) urlStr
        headers: (NSDictionary*) headersDict
withCompletionHandler: (void(^)(NSDictionary*, NSError*)) completionHandler;

-(void) postAt: (NSString*) urlStr
      withBody: (NSDictionary*) bodyDict
       headers: (NSDictionary*) headersDict
andCompletionHandler: (void(^)(NSDictionary*, NSError*)) completionHandler;

+(HttpData*)httpData;
@end
