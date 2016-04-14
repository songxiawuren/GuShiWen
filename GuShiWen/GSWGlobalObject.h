//
//  GSWGlobalObject.h
//  GuShiWen
//
//  Created by byn on 16/4/13.
//  Copyright © 2016年 byn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GSWGlobalObject : NSObject

@property (nonatomic,strong) NSMutableDictionary *authorInfo;
+ (GSWGlobalObject *)sharedInstance;
- (void)getAllAuthorInfo;
@end
