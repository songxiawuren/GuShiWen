//
//  GSWGlobalObject.m
//  GuShiWen
//
//  Created by byn on 16/4/13.
//  Copyright © 2016年 byn. All rights reserved.
//

#import "GSWGlobalObject.h"
#import "GSWDatabaseOperation.h"
#import "Constants.h"

@implementation GSWGlobalObject

static GSWGlobalObject *manager;
+ (GSWGlobalObject *)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[GSWGlobalObject alloc] init];
    });
    return manager;
}



- (void)getAllAuthorInfo {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        self.authorInfo = [[GSWDatabaseOperation sharedInstance] getAllAuthorInfo];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:getAuthorInfoSucceed object:nil];
    });
}

@end
