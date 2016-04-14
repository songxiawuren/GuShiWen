//
//  GSWDatabaseOperation.h
//  GuShiWen
//
//  Created by byn on 16/4/12.
//  Copyright © 2016年 byn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GSWDatabaseOperation : NSObject
+ (GSWDatabaseOperation *)sharedInstance;
- (NSArray *)getAuthorImageWithAuthorName : (NSString *)name;
- (void)addItemToDatabase : (NSArray *)itemArray;
- (NSMutableDictionary *)getAllAuthorInfo;
@end
